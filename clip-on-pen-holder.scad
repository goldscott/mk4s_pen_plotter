gap_thick=1.25;

arm_thick=8;
stop_thick=2;
hook_depth=2;

arm_height=3;

width=16;
body_height = 3;

$fn=24;

//import existing pen holder with rubberband hook
translate([8,23,-8]){
    rotate([0,0,180])
import("pen_mount_simple.stl");
}

//triangle
triangle_points =[[0,0],[1.5,0],[0,2.1]];
triangle_paths =[[0,1,2]];

//lower triangle hook
translate([0,0,arm_height]){
mirror([0,0,1]){
rotate([180,90,180]){
linear_extrude(width)
polygon(triangle_points,triangle_paths,10);
}}}

//lower hook arm

//lower bottom of hook
cube([width,stop_thick*2+gap_thick,arm_height]);

//lower hook stop
translate([0,stop_thick+gap_thick,arm_height])
{
    cube([width,stop_thick,hook_depth]);
}

//lower arm from pen cylinder to hook
translate([arm_thick/2,stop_thick+gap_thick,0])
{
    cube([arm_thick, arm_thick, body_height]);
}


//upper hook assembly
bracket_height=33.1;
upper_hook_depth = 8;
//upper triangle hook
translate([0,0,bracket_height+arm_height]){
mirror([0,0,0]){
rotate([180,90,180]){
linear_extrude(width)
polygon(triangle_points,triangle_paths,10);
}}}


//upper bottom of hook
translate([0,0,bracket_height+arm_height])
cube([width,stop_thick*2+gap_thick,arm_height]);

//upper hook stop
translate([0,stop_thick+gap_thick,bracket_height+arm_height-upper_hook_depth])
{
    cube([width,stop_thick,upper_hook_depth]);
}

//upper arm from pen cylinder to hook
translate([arm_thick/2,stop_thick+gap_thick,bracket_height-upper_hook_depth+arm_height])
{
    cube([arm_thick, arm_thick, body_height]);
}




