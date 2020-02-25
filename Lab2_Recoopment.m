
%================Lab 2,Simulation of the stress-strain====================%
%=================properties of wavy parallel fibers======================%


%QUESTION 1
%1)	Write a Matlab code that simulates the stress-strain curve of the 
%fiber. Assume first that the system includes N=1000 linear identical 
%springs each with ai=1, bi=0 and ci=0. Also, assume that L0,i=1 for each 
%spring. Calculate the stress-strain curve of the model while stretching 
%the system from length L=1 to L=5. Plot the result! What is the effective 
%stiffness of the fiber as a function of the spring constant of the
%fibrils?

Spring_1 = spring_parallel([1,0,0], 1000, 'single' , 1,0*2);
force1 = Spring_1.findForce(2);
data1 = Spring_1.graph_stress_strain(1,5);

%QUESTION 2 
%Transform this distribution such that ?=1.5 and w=0.1. Plot and check 
% that all values are between 1.4 and 1.6 and assign them to L0,i. Calculate
% the corresponding stress-strain curve. Repeat the stress-strain curve
% calculations for w=0.2, 0.3 and 0.5. Next, increase ? to 3 and repeat 
% the calculations for w=0.1, 1, and 2. Plot the stress-strain curves on
% the same graph. How do the mean and the width of the initial length 
%distribution affect the shape of the stress-strain curve?

Spring_2 = spring_parallel([1,0,0], 1000, 'uniform' , 1.5,.1*2);
data2 = Spring_2.graph_stress_strain(1,5);

t = 1:1:1000;
z = Spring_2.Len();
plot(t,z,'ro')

Spring_3 = spring_parallel([1,0,0], 1000, 'uniform' , 1.5,.2*2);
data3 = Spring_3.graph_stress_strain(1,5);

Spring_4 = spring_parallel([1,0,0], 1000, 'uniform' , 1.5,.3*2);
data4 = Spring_4.graph_stress_strain(1,5);

Spring_5 = spring_parallel([1,0,0], 1000, 'uniform' , 1.5,.5*2);
data5 = Spring_5.graph_stress_strain(1,5);

Spring_6 = spring_parallel([1,0,0], 1000, 'uniform' , 3,.1*2);
data6 = Spring_6.graph_stress_strain(1,5);

Spring_7 = spring_parallel([1,0,0], 1000, 'uniform' , 3, 1*2);
data7 = Spring_7.graph_stress_strain(1,5);

Spring_8 = spring_parallel([1,0,0], 1000, 'uniform' , 3, 2*2);
data8 = Spring_8.graph_stress_strain(1,5);

figure(2)         
plot(data2(:,1),data2(:,2), 'g' ,'DisplayName','u = 1.5; w = .1')
hold on    
plot(data3(:,1),data3(:,2), 'r' ,'DisplayName','u = 1.5; w = .2')
hold on   
plot(data4(:,1),data4(:,2), 'y' ,'DisplayName','u = 1.5; w = .3')
hold on      
plot(data5(:,1),data5(:,2), 'c' ,'DisplayName','u = 1.5; w = .5')
hold on      
plot(data6(:,1),data6(:,2), 'b' ,'DisplayName','u = 3; w = .1')
hold on     
plot(data7(:,1),data7(:,2), 'k' ,'DisplayName','u = 3; w = 1')
hold on  
plot(data8(:,1),data8(:,2), 'm' ,'DisplayName','u = 3; w = 2')
  
axis([0,4,0,max(data5(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

%QUESTION 3
%Repeat 1) and 2) with nonlinear individual springs using bi=0.1 and ci=1. 
%How does microscopic nonlinearity influence macroscopic mechanics in the 
%presence of heterogeneous waviness?

Spring_8b = spring_parallel([1,.1,1], 1000, 'single' , 1,0*2);
data8b = Spring_8b.graph_stress_strain(1,5);

Spring_9 = spring_parallel([1,.1,1], 1000, 'uniform' , 1.5,.1*2);
data9 = Spring_9.graph_stress_strain(1,5);

Spring_10 = spring_parallel([1,.1,1], 1000, 'uniform' , 1.5,.2*2);
data10 = Spring_10.graph_stress_strain(1,5);

Spring_11 = spring_parallel([1,.1,1], 1000, 'uniform' , 1.5,.3*2);
data11 = Spring_11.graph_stress_strain(1,5);

Spring_12 = spring_parallel([1,.1,1], 1000, 'uniform' , 1.5,.5*2);
data12 = Spring_12.graph_stress_strain(1,5);

Spring_13 = spring_parallel([1,.1,1], 1000, 'uniform' , 3,.1*2);
data13 = Spring_13.graph_stress_strain(1,5);

Spring_14 = spring_parallel([1,.1,1], 1000, 'uniform' , 3, 1*2);
data14 = Spring_14.graph_stress_strain(1,5);

Spring_15 = spring_parallel([1,.1,1], 1000, 'uniform' , 3, 2*2);
data15 = Spring_15.graph_stress_strain(1,5);

figure(3)         
plot(data9(:,1),data9(:,2), 'g' ,'DisplayName','u = 1.5; w = .1')
hold on    
plot(data10(:,1),data10(:,2), 'r' ,'DisplayName','u = 1.5; w = .2')
hold on   
plot(data11(:,1),data11(:,2), 'y' ,'DisplayName','u = 1.5; w = .3')
hold on      
plot(data12(:,1),data12(:,2), 'c' ,'DisplayName','u = 1.5; w = .5')
hold on      
plot(data13(:,1),data13(:,2), 'b' ,'DisplayName','u = 3; w = .1')
hold on     
plot(data14(:,1),data14(:,2), 'k' ,'DisplayName','u = 3; w = 1')
hold on  
plot(data15(:,1),data15(:,2), 'm' ,'DisplayName','u = 3; w = 2')
  
axis([0,4,0,max(data15(:,2))*1.5])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

%QUESTION 4
%Next, set all L0,i=1 and distribute ci uniformly around its mean of 1
%with w=0.1, 0.5 and 1. Compute the stress-strain curves and compare them 
%to those in 2). Can you get a stress-strain curve similar to one of those
%in 2) where L0 was distributed?

Spring_16 = spring_parallel_c([1,.1], 1000, 'uniform' , 1, .1*2, 1);
data16 = Spring_16.graph_stress_strain(1,5);

Spring_17 = spring_parallel_c([1,.1], 1000, 'uniform' , 1, .5*2, 1);
data17 = Spring_17.graph_stress_strain(1,5);

Spring_18 = spring_parallel_c([1,.1], 1000, 'uniform' , 1,  1*2, 1);
data18 = Spring_18.graph_stress_strain(1,5);

figure(11)         
plot(data16(:,1),data16(:,2), 'g*' ,'DisplayName','Ci: u = 1; w = .1')
hold on    
plot(data17(:,1),data17(:,2), 'ro' ,'DisplayName','Ci: u = 1; w = .5')
hold on   
plot(data18(:,1),data18(:,2), 'b+' ,'DisplayName','Ci: u = 1; w = 1')
hold on      

axis([0,4,0,max(data18(:,2)/2)])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

%QUESTION 5
%Set therefore N=1 and allow for nonlinearity. Then go back to your 
%linear model in 2) and compute the stress-strain curve with ?=1.5 and
%w=0.5. Imagine that this stress-strain curve comes from the measurement 
%of the stress-strain curve of a fiber and you now want to fit your single
%compartment model to these data. Try to tune the parameters a, b and c 
%of the single compartment model by hand to best match the stress-strain
%curve from the parallel model. Try no more than 10-15 different combinations.

linear_model = data5;

x1 = 1:0.2:5;

F1 = 1*power(x1-1, 1)+ 1*power(x1-1, 2) +  .1*power(x1-1, 3);
F2 = .1*power(x1-1, 1)+ .1*power(x1-1, 2) +  .01*power(x1-1, 3);
F3 = .05*power(x1-1, 1)+ .1*power(x1-1, 2) +  .01*power(x1-1, 3);
F4 = .4*power(x1-1, 1)+ .1*power(x1-1, 2) +  .05*power(x1-1, 3);
F5 = .35*power(x1-1, 1)+ .1*power(x1-1, 2) +  .03*power(x1-1, 3);
F6 = .15*power(x1-1, 1)+ .09*power(x1-1, 2) +  .05*power(x1-1, 3);
F7 = .4*power(x1-1, 1)+ .2*power(x1-1, 2)  + 0*power(x1-1, 3);
F8 = .3*power(x1-1, 1)+ .2*power(x1-1, 2) +  0*power(x1-1, 3);
F9 = .3*power(x1-1, 1)+ .2*power(x1-1, 2) - .01*power(x1-1, 3);


figure(4)         
plot(data5(:,1),data5(:,2), 'bo' ,'DisplayName','Linear Model N = 1000')
hold on
plot((x1-1)/1,F1, 'g' ,'DisplayName','NonLin Model1 N = 1')
hold on
plot((x1-1)/1,F2, 'r' ,'DisplayName','NonLin Model2 N = 1')
hold on
plot((x1-1)/1,F3, 'y' ,'DisplayName','NonLin Model3 N = 1')
hold on
plot((x1-1)/1,F4, 'k' ,'DisplayName','NonLin Model4 N = 1')
hold on
plot((x1-1)/1,F5, 'c' ,'DisplayName','NonLin Model5 N = 1')
hold on
plot((x1-1)/1,F6, 'm' ,'DisplayName','NonLin Model6 N = 1')
hold on
plot((x1-1)/1,F7, 'g' ,'DisplayName','NonLin Model7 N = 1')
hold on
plot((x1-1)/1,F8, 'b+' ,'DisplayName','NonLin Model8 N = 1')
hold on
plot((x1-1)/1,F9, 'r+' ,'DisplayName','NonLin Model9 N = 1')
hold on


axis([0,4,0,max(data5(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

%QUESTION 6
%LSQFIT

xdata = data5(:,1);
ydata = data5(:,2);

Spring_30 = spring_parallel([1,0,0], 1000, 'uniform' , 2,1*2);
data30 = Spring_30.graph_stress_strain(1,5);
Spring_31 = spring_parallel([1,0,0], 1000, 'uniform' , 3,1*2);
data31 = Spring_31.graph_stress_strain(1,5);
Spring_32 = spring_parallel([1,0,0], 1000, 'uniform' , 3,2*2);
data32 = Spring_32.graph_stress_strain(1,5);

z = curvefit(xdata,ydata);
z1 = curvefit(xdata,data30(:,2));
z2 = curvefit(xdata,data31(:,2));
z3 = curvefit(xdata,data32(:,2));

%BONUS QUESTION 
%CrossLinking
%Show that increasing the cross-linking density significantly influences 
%the stress-strain curve of the fiber.

Spring_X = spring_parallel([1,0,0], 1000, 'uniform' , 3, 2*2);
density_A = 0;
dataA = Spring_X.graph_cl(1,5,density_A);
density_B = .1;
dataB = Spring_X.graph_cl(1,5,density_B);
density_C = .5;
dataC = Spring_X.graph_cl(1,5,density_C);
density_D = .8;
dataD = Spring_X.graph_cl(1,5,density_D);

figure(10)         
plot(dataA(:,1),dataA(:,2), 'g' ,'DisplayName','Cross Link = 0%')
hold on    
plot(dataB(:,1),dataB(:,2), 'r' ,'DisplayName','Cross Link = 10%')
hold on   
plot(dataC(:,1),dataC(:,2), 'y' ,'DisplayName','Cross Link = 50%')
hold on      
plot(dataD(:,1),dataD(:,2), 'c' ,'DisplayName','Cross Link = 80%')

axis([0,4,0,max(dataD(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')


