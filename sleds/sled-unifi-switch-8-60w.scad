include <sled-fixtures/side-posts.scad>
include <sled-fixtures/corners.scad>
include <../libs/roundedcube/roundedcube.scad>


module blank2wSled() {
    import("2Wsled.stl");
}

module cutouts() {
    color("gray")
    roundedcube([110, 55, 15], true, 5, "z");
    
    // sidepost cutouts
    translate([-70.15, 0, 0])
    roundedcube([8, 10, 15], true, 0.5, "z");
    translate([70.15, 0, 0])
    roundedcube([8, 10, 15], true, 0.5, "z");
    
    // rear void
    color("gray")
    translate([0, 70, 0])
    roundedcube([120, 23, 15], true, 5, "z"); 
}


difference() {
    translate([1, 0, 0])
    blank2wSled();
    
    translate([0, -7.6, 0])
    cutouts();
}

translate([0, -7.6, 3.55])
corners(containerWidth=148.25, containerDepth=100, tolerance=0.15, cornerWD=10, cornerHeight=5, hullThickness=2);

translate([0, -7.6, 3.55])
sideposts(148.25, 30.75, 0.15, 0.25, 4);

// switch
//color("blue", 0.5)
//translate([0, -7.6, -3])
//cube([132, 75, 15.75], center=true);


// switch
//color("gray", 0.5)
//translate([0, -7.6, 19.1])
//cube([148.25, 100, 30.75], center=true);


