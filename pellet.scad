nozz=0.2;
diam=4.5;
cone=2.7;
leng=6;
walls=1;
tol=0.1;
gap=0.3;
segments=6;
$fn=360;

thick=nozz*walls;

$slices=(leng-thick-diam+cone)*10;

module sabot(){

}

module flachette() {
    difference() {
        cylinder(h=leng, d=diam-2*tol);
        
        union() {
            linear_extrude(height=(diam-cone), scale=cone/(diam-2*thick))
                circle(d=diam-2*thick);
            
            translate([0,0,thick])
                linear_extrude(height=(diam-cone+gap/2), scale=cone/(diam-2*tol-gap*1.5))
                    circle(d=diam-2*tol);
            
            translate([0,0,thick+gap/2+diam-cone])
                linear_extrude(height=cone/2+gap/2, scale=0)
                    circle(d=cone+gap);
            
            translate([0,0,0])
                cylinder(h=thick*1.5, d=diam);
            
            translate([0,0,leng])
                mirror([0,0,1])
                    linear_extrude(height=leng-diam-thick-gap+cone/2, scale=0)
                        circle(d=diam-2*thick);
            for(x=[0:360/segments:360]){
                rotate([0,0,x])cube([20,gap,leng*2],center=true);
            }
        }
    }
    
    difference() {
        union() {
            translate([0,0,thick+diam-cone])
                linear_extrude(height=cone/2, scale=0)
                    circle(d=cone);
            
            translate([0,0,thick*1])
                linear_extrude(height=(diam-cone), scale=cone/(diam-1.5*thick))
                    circle(d=diam-1.5*thick);
            linear_extrude(height=thick, scale=(diam-1.5*thick)/(diam-2*tol))
                    circle(d=diam-2*tol);
        }
        
        linear_extrude(height=(diam-cone), scale=cone/(diam-2*thick))
            circle(d=diam-2*thick);
    }
}


module shotshell(){
    difference(){
        
            translate([0,0,diam-cone+thick])cylinder(h=leng-diam+cone-thick,d=diam-2*tol);
        
        union(){
            translate([0,0,diam-cone+thick])cylinder(h=leng,d=diam-2*thick-2*tol);
            for(x=[0:360/segments:360]){
                rotate([0,0,x])cube([20,gap,leng*2],center=true);
            translate([0,0,diam-cone+thick])for(x=[0:360/segments:360]){
                rotate([0,0,x])cube([diam,diam/3,gap],center=true);
                }
            }
            
        }

    }
    difference(){
        cylinder(h=diam-cone+thick,d=diam-2*tol);
        
    union(){
    
            linear_extrude(height=(diam-cone),scale=cone/(diam-2*thick))circle(d=diam-2*thick);
    }
    }

}

module pellet(){
    translate([0,0,diam-cone+3*thick+$slices*0.1/2]){
        difference(){
            sphere(d=diam-2*tol);
            union(){
            translate([0,0,-diam/2])cylinder(h=diam,d=diam,center=true);
            translate([0,0,leng-(diam-cone+3*thick+$slices*0.1/2)])cylinder(h=diam,d=diam);
            }
        }
    
    }
    translate([0,0,diam-cone+3*thick]){
        for(s=[1:1:$slices/2]){
            hull(){
            translate([0,0,s*0.1])cylinder(h=0.01,r=(cone-tol)/2+(diam-cone)*(1-tol+cos(180-s*360/$slices))/4);
            translate([0,0,(s-1)*0.1])cylinder(h=0.01,r=(cone-tol)/2+(diam-cone)*(1-tol+cos(180-(s-1)*360/$slices))/4);
            
            }
        
        }
    }

    difference(){
        union(){
        
            translate([0,0,thick])linear_extrude(height=(diam-cone)+2*thick,scale=cone/(diam))circle(d=diam-2*tol);
            
            cylinder(h=thick,d=diam-2*tol);
        }
        union(){
            linear_extrude(height=diam-cone,scale=cone/(diam-2*thick))circle(d=diam-2*thick);
            
        }

    }

}

difference(){
for(i=[0:1:2]){
translate([0,i*diam*1.5,0]){
pellet();
translate([diam*1.5,0,0])shotshell();
translate([diam*3,0,0])flachette();
}
}
translate([-5,-20,0])cube([30,20,20]);
}