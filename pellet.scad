nozz=0.4;
diam=4.5;
cone=2.7;
leng=5;
walls=1;
tol=0.1;
$fn=360;

thick=nozz*walls;

module sabot(){

}

module flachette(){

}

module shotshell(){
    difference(){
        union(){
            cylinder(h=leng,d=diam-2*tol);
        }
        union(){
            linear_extrude(height=(diam-cone),scale=cone/diam)circle(d=diam-2*thick);
            translate([0,0,diam-cone+thick])cylinder(h=leng,d=diam-2*thick-2*tol);
            
        }

    }

}

module pellet(){

}

shotshell();