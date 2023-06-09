shader_type canvas_item;
// Mostly translated from Material Maker


// Translation x,y, Rotation of rectangles
uniform float shift_x:hint_range(-0.25, 0.15, 0.01) = 0.00;
uniform float shift_y:hint_range(-0.25, 0.15, 0.01) = 0.0;
uniform float shift_rotate:hint_range(-1.42, 1.42, 0.01) = 0.00;

// Crosshair Color
// Uniform color
uniform vec4 crosshair_color:source_color=vec4(1.0,1.0,1.0,1.0);

// uniform spread
uniform float spread:hint_range(0.0, 0.15, 0.001) = 0.00;

// uniform sides
// more sides -> smoother shape
uniform float shape_sides:hint_range(3.0, 15.0, 1.0) = 4.0;
uniform float radius_rectangle:hint_range(0.09, 0.2, 0.01) = 0.14;

// Gradient for Transparancy
const float p_o363960_gradient_0_pos = 0.321493253;
const float p_o363960_gradient_0_r = 1.000000000;
const float p_o363960_gradient_0_g = 1.000000000;
const float p_o363960_gradient_0_b = 1.000000000;
const float p_o363960_gradient_0_a = 0.000000000;
const float p_o363960_gradient_1_pos = 0.885129062;


// Translations rotations
// Rotation Rectangle 1
const float p_o170470_translate_y = 0.245000000;
const float p_o170470_rotate = 90.000000000;

uniform float rectangle_size_x:hint_range(1.0,1.3,0.01)=1.30;
uniform float rectangle_scale:hint_range(2.0, 5.0, 0.01)=3.0;
//const float p_o170470_scale_x = 1.320000000;

// Drawing rectangles
// Variables for drawing rectangles, see Material Maker Nodes
const float p_o170467_edge = 0.00;
const float p_o170470_translate_y_2 = -0.2450;
const float p_o170470_translate_y_3 = 0.0;
const float p_o170470_rotate_3 = 180.0;


// Drawing rectangles
float shape_polygon(vec2 uv, float sides, float size, float edge) {
    uv = 2.0*uv-1.0;
	edge = max(edge, 1.0e-8);
    float angle = atan(uv.x, uv.y)+3.14;
    float slice = 6.28/sides;
    return clamp((1.0-(cos(floor(0.5+angle/slice)*slice-angle)*length(uv))/size)/edge, 0.0, 1.0);
}

// Transformation functions
vec2 transform2_clamp(vec2 uv) {
	return clamp(uv, vec2(0.0), vec2(1.0));
}

vec2 transform2(vec2 uv, vec2 translate, float rotate, vec2 scale) {
 	vec2 rv;
	uv -= translate;
	uv -= vec2(0.5);
	rv.x = cos(rotate)*uv.x + sin(rotate)*uv.y;
	rv.y = -sin(rotate)*uv.x + cos(rotate)*uv.y;
	rv /= scale;
	rv += vec2(0.5);
	return rv;	
}


// Gradient Function for making transparency
vec4 o363960_gradient_gradient_fct(float x,vec4 crosshaircolor) {
  float p_o363960_gradient_1_r=crosshaircolor.r;
  float p_o363960_gradient_1_g=crosshaircolor.g;
  float p_o363960_gradient_1_b=crosshaircolor.b;
  float p_o363960_gradient_1_a=crosshaircolor.a;

  if (x < 0.5*(p_o363960_gradient_0_pos+p_o363960_gradient_1_pos)) {
    return vec4(p_o363960_gradient_0_r,p_o363960_gradient_0_g,p_o363960_gradient_0_b,p_o363960_gradient_0_a);
  }
  return vec4(p_o363960_gradient_1_r,p_o363960_gradient_1_g,p_o363960_gradient_1_b,p_o363960_gradient_1_a);
}


void fragment() {
//varying

float p_o474661_color_r = 1.0;
float p_o474661_color_g = 0.0;
float p_o474661_color_b = 0.0;
float p_o474661_color_a = 1.0;
// Shift translations
float p_o170470_translate_x_3 = 0.2+ shift_x;
float p_o170470_translate_x_4 = -0.2+ shift_x;
float p_o170470_scale_y = rectangle_size_x/rectangle_scale;
// Make Polygons	
float o170467_0_1_f = shape_polygon((transform2_clamp(transform2((UV), vec2(shift_x*(2.0*1.0-1.0), -shift_y+p_o170470_translate_y*(2.0*1.0-1.0)+spread), (1.0+shift_rotate)*p_o170470_rotate*0.01745329251*(2.0*1.0-1.0), vec2(rectangle_size_x*(2.0*1.0-1.0), p_o170470_scale_y*(2.0*1.0-1.0))))), shape_sides, radius_rectangle*1.0, p_o170467_edge*1.0);
float o170467_0_1_h = shape_polygon((transform2_clamp(transform2((UV), vec2(shift_x*(2.0*1.0-1.0), -shift_y+p_o170470_translate_y_2*(2.0*1.0-1.0)-spread), (1.0+shift_rotate)*p_o170470_rotate*0.01745329251*(2.0*1.0-1.0), vec2(rectangle_size_x*(2.0*1.0-1.0), p_o170470_scale_y*(2.0*1.0-1.0))))),shape_sides, radius_rectangle*1.0, p_o170467_edge*1.0);
float o170467_0_1_i = shape_polygon((transform2_clamp(transform2((UV), vec2(p_o170470_translate_x_3*(2.0*1.0-1.0)+spread, -shift_y+p_o170470_translate_y_3*(2.0*1.0-1.0)), (shift_rotate)*p_o170470_rotate_3*0.01745329251*(2.0*1.0-1.0), vec2(rectangle_size_x*(2.0*1.0-1.0), p_o170470_scale_y*(2.0*1.0-1.0))))),shape_sides, radius_rectangle*1.0, p_o170467_edge*1.0);
float o170467_0_1_j = shape_polygon((transform2_clamp(transform2((UV), vec2(p_o170470_translate_x_4*(2.0*1.0-1.0)-spread, -shift_y+p_o170470_translate_y_3*(2.0*1.0-1.0)), (shift_rotate)*p_o170470_rotate_3*0.01745329251*(2.0*1.0-1.0), vec2(rectangle_size_x*(2.0*1.0-1.0), p_o170470_scale_y*(2.0*1.0-1.0))))), shape_sides, radius_rectangle*1.0, p_o170467_edge*1.0);

// Add Polygons
float o339862_0_clamp_false = o170467_0_1_f+o170467_0_1_h;
float o339862_0_clamp_false_2 = o339862_0_clamp_false+o170467_0_1_i;
float o339862_0_clamp_false_3 = o339862_0_clamp_false_2 +o170467_0_1_j;
float o339862_0_clamp_true = clamp(o339862_0_clamp_false_3, 0.0, 1.0);
float o339862_0_2_f = o339862_0_clamp_false_3;

// Calculations for gradients
vec4 o474661_0_1_rgba = vec4(p_o474661_color_r, p_o474661_color_g, p_o474661_color_b, p_o474661_color_a);
vec3 o483667_0_clamp_false = ((o474661_0_1_rgba).rgb)*vec3(o339862_0_2_f);
float o288383_0_clamp_false = (dot((o483667_0_clamp_false).rgb, vec3(1.0))/3.0)+(dot((o483667_0_clamp_false).rgb, vec3(1.0))/3.0);
float o288383_0_clamp_true = clamp(o288383_0_clamp_false, 0.0, 1.0);
float o288383_0_1_f = o288383_0_clamp_false;
vec4 o363960_0_1_rgba = o363960_gradient_gradient_fct(o288383_0_1_f,crosshair_color);

// Set color
COLOR = o363960_0_1_rgba;
}
