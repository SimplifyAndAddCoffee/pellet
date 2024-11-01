nozz=0.4;
diam=4.5;
cone=2.7;
leng=5;
walls=1;
tol=0.1;
gap=0.2;
segments=6;
$fn=360;

thick=nozz*walls;

module sabot(){

}

module flachette(){
    difference(){
        union(){
            cylinder(h=leng,d=diam-2*tol);
        }
        union(){
            linear_extrude(height=(diam-cone),scale=cone/(diam-2*thick))circle(d=diam-2*thick);
            difference(){
            union(){
                translate([0,0,thick+gap])linear_extrude(height=(diam-cone),scale=cone/(diam-2*thick))circle(d=diam-2*thick);
                translate([0,0,thick+gap+diam-cone])linear_extrude(height=cone/2,scale=0)circle(d=cone);
                translate([0,0,thick])cylinder(h=thick*0.5,d=diam);
                }
                union(){
                translate([0,0,thick+diam-cone])linear_extrude(height=cone/2,scale=0)circle(d=cone);
            translate([0,0,thick*1])linear_extrude(height=(diam-cone),scale=cone/(diam-2*thick))circle(d=diam-2*thick);            
            }
            }
            translate([0,0,leng])mirror([0,0,1])linear_extrude(height=leng-diam-thick-gap+cone/2,scale=0)circle(d=diam-2*thick);
        }
    }

}

module shotshell(){
    difference(){
        union(){
            cylinder(h=leng,d=diam-2*tol);
        }
        union(){
            linear_extrude(height=(diam-cone),scale=cone/(diam-2*thick))circle(d=diam-2*thick);
            translate([0,0,diam-cone+thick])cylinder(h=leng,d=diam-2*thick-2*tol);
            
        }

    }

}

module pellet(){

}

difference(){
flachette();
translate([-10,0,0])cube([20,20,20]);
}