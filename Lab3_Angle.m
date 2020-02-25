% %=========Lab 3,Computational Lab 3: Effects of fiber alignment===========%
% %====================on the stress-strain properties =====================%
% 
% %QUESTION 1
% % Write a Matlab code that simulates the stress-strain curve of this model.
% % We can directly use the derivative of Eq. 1 to compute the force on each 
% % spring and then we add the forces together. Assume that the system includes
% % N=10000 linear identical springs each with ai=1, bi=0 and ci=0. First
% % assume the distribution of angles is uniform between –PI/8 and P/8.
% % Calculate the stress-strain curve of the model while stretching the system
% % from length L=1 to L=3 in steps of 0.05. Also plot the force-strain curve 
% % on each fiber. 
% 
% 
% Spring_1 = spring_angle([1,0,0], 10000, 0, 3.14159/8, .001 , 1, 3, .05, 1, 2);
% force1 = Spring_1.findForce(1.05);
% data1 = Spring_1.graph();
% 
% 
% figure(50)             
% 
% for x = 1:1:10
%     data99 = Spring_1.graph_individual(x);
%     plot(data99(:,1),data99(:,2), 'b' ,'DisplayName','N/A')
%     hold on 
%     
% end
% 
% axis([0,.5,0,max(data99(:,2))/4])
% xlabel('Strain')
% ylabel('Stress')
% title('Stress-Strain Curve Series Spring')
% 
% 
% %QUESTION 2
% %For each strain step, save the histogram of the angles and plot the
% % evolution of the distribution of fiber angles as the system is gradually 
% % stretched. (Hint: use the hist function with 10-12 bins).
% % Does the result match you expectation?
% 
% Spring_1.plot_histogram_3d();
% 
% %QUESTION 3
% %Repeat 2) with wider and wider distributions of angles reaching a uniform 
% % distribution between –PI/2 and PI/2. How does the shape of the stress-strain
% % curve change?
% 
% Spring_2 = spring_angle([1,0,0], 10000, 0, 3.14159/2, .001 , 1, 3, .05, 3, 4);
% data2 = Spring_2.graph();
% 
% % QUESTION 4
% % Repeat the above with increasing the mean and the width of the distribution. 
% % For example, you can have a narrow distribution around ?/4, then a wider 
% % distribution around ?/4 and also a narrow distribution around ?/2 and a 
% % wider distribution around ?/2. How do the mean and width of the 
% % distribution affect the shape of the stress-strain curve? You should have 
% % realized that for a narrow distribution around say ?/2, you are simulating 
% % a highly anisotropic fiber system in the direction perpendicular to the 
% % fiber orientation, whereas a narrow distribution around 0 represents 
% % stretching an anisotropic fibrous tissue in the direction of fiber
% % orientation. Compare the stress-strain curves of these 2 cases. To gain 
% % insight, plot the evolution of angle distribution on a 3D plot.
% % 
% % Large Mean Small Distribution
% Spring_3 = spring_angle([1,0,0], 10000, 3.14159*(3/8), 3.14159/12, .001, 1, 3, .05 , 5 , 6);
% data3 = Spring_3.graph();
% Spring_3.plot_histogram_3d();
% 
% %Large Mean Large Distribution
% Spring_4 = spring_angle([1,0,0], 10000, 3.14159*(3/8), 3.14159/8, .001 , 1, 3, .05 , 7 , 8);
% data4 = Spring_4.graph();
% Spring_4.plot_histogram_3d();
% 
% %Small Mean Small Distribution 
% Spring_5 = spring_angle([1,0,0], 10000, 3.14159/4, 3.14159/12, .001 , 1, 3, .05 , 9 , 10);
% data5 = Spring_5.graph();
% Spring_5.plot_histogram_3d();
% 
% %Small Mean Large Distribution
% Spring_6 = spring_angle([1,0,0], 10000, 3.14159/4, 3.14159/8, .001 , 1, 3, .05 , 55, 11);
% data6 = Spring_6.graph();
% Spring_6.plot_histogram_3d();
% 
% figure(20)             
% plot(data3(:,1),data3(:,2), 'r' ,'DisplayName','Large u, Small w')
% hold on   
% plot(data4(:,1),data4(:,2), 'y' ,'DisplayName','Large u, Large w')
% hold on      
% plot(data5(:,1),data5(:,2), 'c' ,'DisplayName','Small u, Small w')
% hold on      
% plot(data6(:,1),data6(:,2), 'b' ,'DisplayName','Small u, Large w')
%   
% axis([0,.5,0,max(data6(:,2))/4])
% xlabel('Strain')
% ylabel('Stress')
% title('Stress-Strain Curve Series Spring')
% legend('Location','northwest')
% legend('show')
% 
% %QUESTION 5
% % Repeat 4) with nonlinear individual springs using bi=0.1 and ci=1. 

% Large Mean Small Distribution
Spring_7 = spring_angle([1,.1,1], 10000, 3.14159*(3/8), 3.14159/12, .001 , 1, 3, .05 , 12 , 13);
data7 = Spring_7.graph();
Spring_7.plot_histogram_3d();

%Large Mean Large Distribution
Spring_8 = spring_angle([1,.1,1], 10000, 3.14159*(3/8), 3.14159/8, .001 , 1, 3, .05 , 14 , 15);
data8 = Spring_8.graph();
Spring_8.plot_histogram_3d();

%Small Mean Small Distribution 
Spring_9 = spring_angle([1,.1,1], 10000, 3.14159/4, 3.14159/12, .001 , 1, 3, .05 , 16 , 17);
data9 = Spring_9.graph();
Spring_9.plot_histogram_3d();

%Small Mean Large Distribution
Spring_10 = spring_angle([1,.1,1], 10000, 3.14159/4, 3.14159/8, .001 , 1, 3, .05 , 18 , 19);
data10 = Spring_10.graph();
Spring_10.plot_histogram_3d();

figure(21)             
plot(data7(:,1),data7(:,2), 'r' ,'DisplayName','Large u, Small w')
hold on   
plot(data8(:,1),data8(:,2), 'y' ,'DisplayName','Large u, Large w')
hold on      
plot(data9(:,1),data9(:,2), 'c' ,'DisplayName','Small u, Small w')
hold on      
plot(data10(:,1),data10(:,2), 'b' ,'DisplayName','Small u, Large w')
  
axis([0,2,0,max(data10(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

% %QUESTION 6
% % Fit the results from 4) with an equivalent stress-strain relation 
% % based on Eq. 1 as in lab 2. Use the fitting function lsqcurvefit 
% % from Matlab to obtain best fit of the single compartment model parameters 
% % to the fiber alignment model by minimizing the mean square error between 
% % the single compartment and distributed fiber model stresses. 
% 
% 
% z3 = curvefit(data3(:,1),data3(:,2));
% z4 = curvefit(data4(:,1),data4(:,2));
% z5 = curvefit(data5(:,1),data5(:,2));
% z6 = curvefit(data6(:,1),data6(:,2));
