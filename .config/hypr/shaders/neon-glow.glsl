precision mediump float;

varying vec2 v_texcoord;

uniform sampler2D tex;
uniform float time;

const float ar = 16.0 / 9.0; // Ajusta según tu resolución

vec4 chroma_aberration(sampler2D texture, vec2 uv, float dist, float intensity) {
    vec4 r = texture2D(texture, uv + vec2(dist, 0.0));
    vec4 g = texture2D(texture, uv);
    vec4 b = texture2D(texture, uv - vec2(dist, 0.0));
    return intensity * vec4(r.r, g.g, b.b, 1.0);
}

vec4 one_blur(sampler2D texture, vec2 uv, int blur_samples, float size) {
    vec4 sum = vec4(0.0);
    for (float i = 0.0; i < 6.28; i += 6.28 / float(blur_samples)) {
        vec2 offset = vec2(cos(i), sin(i) * ar) * size;
        sum += texture2D(texture, uv + offset);
    }
    return sum;
}

vec4 apply_gaussian_blur(sampler2D texture, vec2 uv, int passes, int samples, float size, float intensity) {
    vec4 blurred = vec4(0.0);
    for (float i = 0.0; i <= 1.0; i += (1.0 / float(passes))) {
        blurred += one_blur(texture, v_texcoord, samples, i * size);
    }
    blurred = blurred / float(samples) * intensity;
    return blurred;
}

vec2 crt_coords(vec2 uv, float warp) {
    vec2 dc = abs(0.5 - uv);
    dc *= dc;

    vec2 result = uv;
    result.x -= 0.5;
    result.x *= 1.0 + (dc.y * (0.3 * warp));
    result.x += 0.5;
    result.y -= 0.5;
    result.y *= 1.0 + (dc.x * (0.4 * warp));
    result.y += 0.5;

    return result;
}

// Función principal del efecto CRT
vec4 apply_crt(vec4 baseColor, vec2 uv) {
    const float warp = 0.02; // Curvatura
    const float scan = 0.10; // Intensidad scanlines
    const float scanline_speed = 9.0; // Velocidad scanlines

    // Aplicar distorsión CRT
    vec2 warp_uv = crt_coords(uv, warp);

    // Verificar límites
    if (warp_uv.y > 1.0 || warp_uv.x < 0.0 || warp_uv.x > 1.0 || warp_uv.y < 0.0) {
        return vec4(0.0, 0.0, 0.0, 1.0);
    }

    // Scanlines animadas
    float scanline_pos = uv.y * 100.0 /* - time * scanline_speed */;
    float scan_intensity = abs(sin(scanline_pos) * 0.5 * scan);

    // Aplicar efectos al color base
    vec4 finalColor = baseColor ;
    finalColor.rgb = mix(finalColor.rgb, vec3(0.0), scan_intensity);

    return finalColor;
}

void main() {
    int passes = 1;
    int samples = 16;
    float size = 0.0025;
    float intensity = 0.3;

    vec4 blurred = apply_gaussian_blur(tex, v_texcoord, passes, samples, size, intensity);

    float chroma_distance = 0.0004;
    float chroma_inst = 1.0;
    vec4 chroma = chroma_aberration(tex, v_texcoord, chroma_distance, chroma_inst);

    vec4 base = chroma + blurred;
    vec4 final = apply_crt(base, v_texcoord);

    gl_FragColor = final;
}
