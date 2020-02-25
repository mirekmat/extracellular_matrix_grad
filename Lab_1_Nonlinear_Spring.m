%================Lab 1, 2 Nonlinear Fibers in Series======================%

%QUESTION 1
%First, stretch the system to a length L of 4, i.e. the right end is moved 
%to x=4, provide an initial estimate for the mid position and let fminsearch
%find the position. Use a linear system first with a1=a2=1 and b=c=0. Check
%your solution that the midpoint is at xp=2.

Spring_1 = series_spring([1,0,0,1], [1,0,0,1],4);
xp1 = Spring_1.findXp();

%QUESTION 2
%To further check your system, compute analytically the midpoint for a 
%linear system in which the 2 springs are not the same: a1=1 and a2=2. 

Spring_2 = series_spring([1,0,0,1], [2,0,0,1],4);
xp2 = Spring_2.findXp();
force2 = Spring_2.checkForce(xp2);

%Now go back to the homogeneous system and make it nonlinear:  a1=a2=1, 
%b1=b2=0.1 and c1=c2=1. Next, increase ci to 10 and then to 100. Is it
%still true that F1=F2 up to a high precision?

Spring_3 = series_spring([1,.1,1,1], [1,.1,1,1],4);
xp3 = Spring_3.findXp();
force3 = Spring_3.checkForce(xp3);

Spring_4 = series_spring([1,.1,10,1], [1,.1,10,1],4);
xp4 = Spring_4.findXp();
force4 = Spring_4.checkForce(xp4);

Spring_5 = series_spring([1,.1,100,1], [1,.1,100,1],4);
xp5 = Spring_5.findXp();
force5 = Spring_5.checkForce(xp5);

%QUESTION 3
%Plot the 3 curves on top of each other. Next, make the system inhomogeneous
%by setting the left spring to be linear while the right spring remains 
%nonlinear. Repeat these for c2=5, 10 and 100. 

%Spring_6 = series_spring([1,0,0,1], [1,0,1,1],4);
%Spring_6.graph_stress_strain();
%Spring_6.graph_force_displacement();

Spring_7 = series_spring([1,0,0,1], [1,0,5,1],4);
Spring_7.graph_stress_strain();
Spring_7.graph_force_displacement();

Spring_8 = series_spring([1,0,0,1], [1,0,10,1],4);
Spring_8.graph_stress_strain();
Spring_8.graph_force_displacement();

Spring_9 = series_spring([1,0,0,1], [1,0,100,1],4);
Spring_9.graph_stress_strain();
Spring_9.graph_force_displacement();

%QUESTION 4
%Generate a highly nonlinear curve that shows a knee
Spring_10 = series_spring([.1,1,1,1], [0,0,10,1],4);
Spring_10.graph_stress_strain();

%BONUS QUESTION
Spring_99 = series_spring([2,7,0,1], [3,5,0,1],4);
xp99 = Spring_99.findXp();










