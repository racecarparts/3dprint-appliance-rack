module innerCorner(cornerWD, cornerHeight) {
    color("blue")
        roundedcube([cornerWD, cornerWD, cornerHeight], false, 0.5, "zmax"); 
}

module outerCorner(cornerWD, hullThickness) {
        color("red")
        roundedcube([cornerWD + hullThickness, cornerWD + hullThickness, 1], false, 0.5, "z");
}

module hulledCorner(cornerWD, cornerHeight, hullThickness){
    color("gray")
    hull() {
        innerCorner(cornerWD, cornerHeight);
        outerCorner(cornerWD, hullThickness);    
    }
    
}

module outsideCorner(cornerWD, cornerHeight, hullThickness) {
    difference() {
        hulledCorner(cornerWD, cornerHeight, hullThickness);
        color("blue", 0.5)  
        translate([-hullThickness, -hullThickness, -1])
        cube([cornerWD, cornerWD, cornerHeight + 1]);
    } 
}

module corners(containerWidth, containerDepth, tolerance, cornerWD, cornerHeight, hullThickness) {
    
    baseSize=(cornerWD - hullThickness);
        
    translate([containerWidth/2-baseSize+tolerance, containerDepth/2-baseSize+tolerance, 0])
    outsideCorner(cornerWD, cornerHeight, hullThickness);
    
    translate([-containerWidth/2+baseSize-tolerance, containerDepth/2-baseSize+tolerance, 0])
    rotate([0,0,90])
    outsideCorner(cornerWD, cornerHeight, hullThickness);
    
    translate([-containerWidth/2+baseSize-tolerance, -containerDepth/2+baseSize-tolerance, 0])
    rotate([0,0,180])
    outsideCorner(cornerWD, cornerHeight, hullThickness);
    
    translate([containerWidth/2-baseSize+tolerance, -containerDepth/2+baseSize-tolerance, 0])
    rotate([0, 0, 270])
    outsideCorner(cornerWD, cornerHeight, hullThickness);
}
