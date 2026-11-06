import math
from pathlib import Path

DEFAULT_CHROMA = 0.04
MINIMUM_LIGHTNESS = 0.20
MAXIMUM_LIGHTNESS = 0.80
STEP_COUNT = 4


def convert_oklch_to_linear_srgb(lightness, chroma, hue_degrees=263.85):
    hue_radians = math.radians(hue_degrees % 360.0)
    oklab_a = chroma * math.cos(hue_radians)
    oklab_b = chroma * math.sin(hue_radians)

    cube_root_l = lightness + 0.3963377774 * oklab_a + 0.2158037573 * oklab_b
    cube_root_m = lightness - 0.1055613458 * oklab_a - 0.0638541728 * oklab_b
    cube_root_s = lightness - 0.0894841775 * oklab_a - 1.2914855480 * oklab_b

    cone_l = cube_root_l**3
    cone_m = cube_root_m**3
    cone_s = cube_root_s**3

    linear_red = 4.0767416621 * cone_l - 3.3077115913 * cone_m + 0.2309699292 * cone_s
    linear_green = -1.2684380046 * cone_l + 2.6097574011 * cone_m - 0.3413193965 * cone_s
    linear_blue = -0.0041960863 * cone_l - 0.7034186147 * cone_m + 1.7076147010 * cone_s

    return linear_red, linear_green, linear_blue


def convert_linear_to_srgb_byte(linear_channel):
    limited_channel = max(0.0, min(1.0, linear_channel))
    if limited_channel <= 0.0031308:
        srgb_channel = 12.92 * limited_channel
    else:
        srgb_channel = 1.055 * (limited_channel ** (1.0 / 2.4)) - 0.055
    return round(srgb_channel * 255.0)


def quantize_to_bit_depth(srgb_byte, bit_depth=6):
    quantization_step = 2 ** (8 - bit_depth)
    maximum_byte = 256 - quantization_step
    quantized_byte = round(srgb_byte / quantization_step) * quantization_step
    return min(maximum_byte, max(0, quantized_byte))


def make_palette(chroma=DEFAULT_CHROMA, minimum_lightness=MINIMUM_LIGHTNESS, maximum_lightness=MAXIMUM_LIGHTNESS, step_count=STEP_COUNT):
    if step_count < 1:
        raise ValueError(f"The minimum step_count value is 1. The value is {step_count}.")
    if chroma < 0:
        raise ValueError(f"The minimum chroma value is 0. The value is {chroma}.")

    minimum_lightness_limit = max(0.20, min(0.80, minimum_lightness))
    maximum_lightness_limit = max(0.20, min(0.80, maximum_lightness))
    if minimum_lightness_limit > maximum_lightness_limit:
        raise ValueError("The minimum_lightness value is more than the maximum_lightness value.")

    lightness_step = (maximum_lightness_limit - minimum_lightness_limit) / (step_count - 1) if step_count > 1 else 0.0

    palette = {}
    for step_index in range(step_count):
        lightness = minimum_lightness_limit + (step_index * lightness_step)
        linear_rgb = convert_oklch_to_linear_srgb(lightness, chroma)

        if any(channel < -1e-5 or channel > 1.00001 for channel in linear_rgb):
            raise ValueError(f"Token c{step_index} is outside the color gamut.")

        red_byte, green_byte, blue_byte = (quantize_to_bit_depth(convert_linear_to_srgb_byte(channel)) for channel in linear_rgb)
        palette[f"c{step_index}"] = f"#{red_byte:02x}{green_byte:02x}{blue_byte:02x}"

    return palette


def write_color_file(palette, output_path=Path(__file__).parent.parent / "COLOR"):
    Path(output_path).write_text("\n".join(palette.values()))


def main():
    palette = make_palette()
    write_color_file(palette)


if __name__ == "__main__":
    main()