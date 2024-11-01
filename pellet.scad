nozz=0.4;
diam=4.5;
cone=2.7;
leng=6;
walls=1;
$fn=360;

thick=nozz*walls;

module sabot(){

}

module flachette(){

}

module shotshell(){
    difference(){
        union(){
            cylinder(h=leng,d=diam);
        }
        union(){
            linear_extrude(height=(diam-cone)/2,scale=cone/diam)circle(d=diam-2*thick);
            translate([0,0,diam-cone+thick])cylinder(h=leng,d=diam-2*thick);
            
        }

    }

}

module pellet(){

}

shotshell();