//그것이 알고 싶다 필터
precision mediump float;

uniform vec3                iResolution;
uniform sampler2D           iChannel0;
varying vec2                texCoord;

#define S (iResolution.x / 6e1) // The cell size.

void mainImage(out vec4 c, vec2 p)
{
    c = texture2D(iChannel0, floor((p + .2) / S) * S / iResolution.xy);
}

void main() {

     if( (iResolution.x/2.0 - gl_FragCoord.x) * (iResolution.x/2.0 - gl_FragCoord.x) + (iResolution.y/2.0 - gl_FragCoord.y +250.0) * (iResolution.y/2.0 - gl_FragCoord.y + 250.0) < 80000.0)
            mainImage(gl_FragColor, texCoord*iResolution.xy);
         else
           gl_FragColor = texture2D(iChannel0, texCoord);

   }

