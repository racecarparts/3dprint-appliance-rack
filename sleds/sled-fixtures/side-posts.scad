include <roundedcube/roundedcube.scad>

module sidepostFoot(postHeight, footDepth) {
    footHeight = postHeight * 0.40;
    
    color("Pink")
    hull() {
    difference() {
        // base
        translate([1, 0, 0])
        roundedcube([footDepth, 10, 1], false, 0.5, "z");

        translate([2, 0, 0.1])
        color("blue")
        cube([4, 10, 1]);
    }
    
    // top
    translate([1, 0, footHeight])
    roundedcube([1, 10, 1], false, 0.5, "zmax");
        
    }
}

module detent(postHeight) {
    
    hull() {
        // top
        translate([0.5, 0, postHeight])
        roundedcube([1.5, 10, 2.5], false, 0.5, "zmax");
    
    
    difference() {
        // dentent stub
        rotate([0, 0, 180])
        translate([-2, -10, postHeight])
        roundedcube([6, 10, 1], false, 0.5, "z");
        
        // cut the top off
        color("blue")
        translate([-3, 0, postHeight + 1])
        cube([6, 11, 2], center=false); 
    }
}
    
}

module sidepost(postHeight, footDepth) {
    color("red")
    roundedcube([2, 10, postHeight], false, 0.5, "z");
    
    sidepostFoot(postHeight, footDepth);
    detent(postHeight);
}

module sideposts(width, height, widthTolerance, heightTolerance, footDepth) {
    postDistance = width / 2 + widthTolerance;
    postHeight = height + heightTolerance;
    
    translate([postDistance, -5, 0])
    sidepost(postHeight, footDepth);

    rotate([0, 0, 180])
    translate([postDistance, -5, 0])
    sidepost(postHeight, footDepth);
}