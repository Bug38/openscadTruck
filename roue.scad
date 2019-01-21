$fn = 200;

module jante (l, d, nbtrous) {
  color([0.8,0.8,0.8])
  difference() {
    rotate_extrude()
    polygon(points=[
      // Partie haute / interraction pneu
      [d/2+d/25,-l/2], [d/2+d/25,-l/2+l/20], [d/2,-l/2+l/15], [d/2,l/2-l/15], [d/2+d/25,l/2-l/20], [d/2+d/25,l/2],
      // Partie verticale extérieure
      [d/2-d/10,l/2], [d/2-d/5,l/2+l/5], [0,l/2+l/5],
      // Partie verticale intérieure
      [0,l/2+l/5-l/15], [d/2-d/4.5,l/2+l/5-l/15], [d/2-d/8.5,l/2-l/15],
      // Partie haute intérieure
      [d/2-d/25,l/2-l/15], [d/2-d/25,-l/2]
      ]);
    for(i=[360/nbtrous:360/nbtrous:360]) {rotate([0,0,i]) translate([0, d/6, 0]) cylinder(r=3, h=l);}
  }
}

module pneu (l, h, d) {
  rotate_extrude()
  polygon(points=[
    // Partie basse / interraction jante
    [d/2+d/25,-l/2], [d/2+d/25,-l/2+l/20], [d/2,-l/2+l/15], [d/2,l/2-l/15], [d/2+d/25,l/2-l/20], [d/2+d/25,l/2],
    // Corps du pneu
    [d/2+l*h/100,l/2], [d/2+l*h/100,-l/2]
    ]);
}


module roue (l, h, d, nbtrous=4) {
  color([0.8,0.8,0.8])
  jante(l, d, nbtrous);
  color([0.2,0.2,0.2])
  pneu(l, h, d);
}

roue(31.5,70,57.15,6);
