%=========Computational Lab 5: Fixing PG===========%

%QUESTION 2
%Implementation of spring classes for (mean  = 0, PI/4, PI/2) versus width
%= (PI/8, PI/4)

Spring_1 = angle_PG_rev2([1,0,0], 10000, 0, 3.14159/8, .001 , 1, 3, .05, 3, 4, 0, 3.14159/4);
data1 = Spring_1.graph();
%Spring_1.plot_histogram_3d();

Spring_2 = angle_PG_rev2([1,0,0], 10000, 0, 3.14159/8, .001 , 1, 3, .05, 3, 4, .25, 3.14159/4);
data2 = Spring_2.graph();
% Spring_2.plot_histogram_3d();

Spring_3 = angle_PG_rev2([1,0,0], 10000, 0, 3.14159/8, .001 , 1, 3, .05, 5, 6, .5, 3.14159/4);
data3 = Spring_3.graph();
% Spring_3.plot_histogram_3d();

figure(7)             
plot(data1(:,1),data1(:,2), 'r' ,'DisplayName','S=0, u=0, w=PI/8')
hold on   
plot(data2(:,1),data2(:,2), 'y' ,'DisplayName','S=.25, u=0, w=PI/8')
hold on      
plot(data3(:,1),data3(:,2), 'c' ,'DisplayName','S=.5, u=0, w=PI/8')

axis([0,2,0,max(data1(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')


Spring_4 = angle_PG_rev2([1,0,0], 10000, 3.14159/4, 3.14159/8, .001 , 1, 3, .05, 8, 9, 0, 3.14159/4);
data4 = Spring_4.graph();
% Spring_4.plot_histogram_3d();

Spring_5 = angle_PG_rev2([1,0,0], 10000, 3.14159/4, 3.14159/8, .001 , 1, 3, .05, 10, 11, .25, 3.14159/4);
data5 = Spring_5.graph();
% Spring_5.plot_histogram_3d();

Spring_6 = angle_PG_rev2([1,0,0], 10000, 3.14159/4, 3.14159/8, .001 , 1, 3, .05, 12, 13, .5, 3.14159/4);
data6 = Spring_6.graph();
% Spring_6.plot_histogram_3d();

figure(14)             
plot(data4(:,1),data4(:,2), 'r' ,'DisplayName','S=0, u=PI/4, w=PI/8')
hold on   
plot(data5(:,1),data5(:,2), 'y' ,'DisplayName','S=.25, u=PI/4, w=PI/8')
hold on      
plot(data6(:,1),data6(:,2), 'c' ,'DisplayName','S=.5, u=PI/4, w=PI/8')

axis([0,2,0,max(data4(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

Spring_7 = angle_PG_rev2([1,0,0], 10000, 3.14159/2, 3.14159/8, .001 , 1, 3, .05, 15, 16, 0, 3.14159/4);
data7 = Spring_7.graph();
% Spring_7.plot_histogram_3d();

Spring_8 = angle_PG_rev2([1,0,0], 10000, 3.14159/2, 3.14159/8, .001 , 1, 3, .05, 17, 18, .25, 3.14159/4);
data8 = Spring_8.graph();
% Spring_8.plot_histogram_3d();

Spring_9 = angle_PG_rev2([1,0,0], 10000, 3.14159/2, 3.14159/8, .001 , 1, 3, .05, 19, 20, .5, 3.14159/4);
data9 = Spring_9.graph();
%Spring_9.plot_histogram_3d();

figure(21)             
plot(data7(:,1),data7(:,2), 'r' ,'DisplayName','S=0, u=PI/2, w=PI/8')
hold on   
plot(data8(:,1),data8(:,2), 'y' ,'DisplayName','S=.25, u=PI/2, w=PI/8')
hold on      
plot(data9(:,1),data9(:,2), 'c' ,'DisplayName','S=.5, u=PI/2, w=PI/8')

axis([0,2,0,max(data7(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')


%QUESTION 3
%Repeat 1 and 2 with much wider distribution around 0, ?/4 and ?/2.

Spring_10 = angle_PG_rev2([1,0,0], 10000, 0, 3.14159/4, .001 , 1, 3, .05, 22, 23, 0, 3.14159/4);
data10 = Spring_10.graph();
% Spring_10.plot_histogram_3d();

Spring_11 = angle_PG_rev2([1,0,0], 10000, 0, 3.14159/4, .001 , 1, 3, .05, 24, 25, .25, 3.14159/4);
data11 = Spring_11.graph();
% Spring_11.plot_histogram_3d();

Spring_12 = angle_PG_rev2([1,0,0], 10000, 0, 3.14159/4, .001 , 1, 3, .05, 26, 27, .5, 3.14159/4);
data12 = Spring_12.graph();
% Spring_12.plot_histogram_3d();

figure(28)             
plot(data10(:,1),data10(:,2), 'r' ,'DisplayName','S=0, u=0, w=PI/4')
hold on   
plot(data11(:,1),data11(:,2), 'y' ,'DisplayName','S=.25, u=0, w=PI/4')
hold on      
plot(data12(:,1),data12(:,2), 'c' ,'DisplayName','S=.5, u=0, w=PI/4')

axis([0,2,0,max(data12(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')


Spring_13 = angle_PG_rev2([1,0,0], 10000, 3.14159/4, 3.14159/4, .001 , 1, 3, .05, 29, 30, 0, 3.14159/4);
data13 = Spring_13.graph();
% Spring_13.plot_histogram_3d();

Spring_14 = angle_PG_rev2([1,0,0], 10000, 3.14159/4, 3.14159/4, .001 , 1, 3, .05, 31, 32, .25, 3.14159/4);
data14 = Spring_14.graph();
% Spring_14.plot_histogram_3d();

Spring_15 = angle_PG_rev2([1,0,0], 10000, 3.14159/4, 3.14159/4, .001 , 1, 3, .05, 33, 34, .5, 3.14159/4);
data15 = Spring_15.graph();
% Spring_15.plot_histogram_3d();

figure(35)             
plot(data13(:,1),data13(:,2), 'r' ,'DisplayName','S=0, u=PI/4, w=PI/4')
hold on   
plot(data14(:,1),data14(:,2), 'y' ,'DisplayName','S=.25, u=PI/4, w=PI/4')
hold on      
plot(data15(:,1),data15(:,2), 'c' ,'DisplayName','S=.5, u=PI/4, w=PI/4')

axis([0,2,0,max(data15(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

Spring_16 = angle_PG_rev2([1,0,0], 10000, 3.14159/2, 3.14159/4, .001 , 1, 3, .05, 36, 37, 0, 3.14159/4);
data16 = Spring_16.graph();
% Spring_16.plot_histogram_3d();

Spring_17 = angle_PG_rev2([1,0,0], 10000, 3.14159/2, 3.14159/4, .001 , 1, 3, .05, 38, 39, .25, 3.14159/4);
data17 = Spring_17.graph();
% Spring_17.plot_histogram_3d();

Spring_18 = angle_PG_rev2([1,0,0], 10000, 3.14159/2, 3.14159/4, .001 , 1, 3, .05, 40, 41, .5, 3.14159/4);
data18 = Spring_18.graph();
% Spring_18.plot_histogram_3d();

figure(42)             
plot(data16(:,1),data16(:,2), 'r' ,'DisplayName','S=0, u=PI/2, w=PI/4')
hold on   
plot(data17(:,1),data17(:,2), 'y' ,'DisplayName','S=.25, u=PI/2, w=PI/4')
hold on      
plot(data18(:,1),data18(:,2), 'c' ,'DisplayName','S=.5, u=PI/2, w=PI/4')

axis([0,2,0,max(data18(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(43)  
hold on      
plot(data6(:,1),data6(:,2), 'c' ,'DisplayName','S=.5, u=PI/4, w=PI/8')
hold on      
plot(data9(:,1),data9(:,2), 'b' ,'DisplayName','S=.5, u=PI/2, w=PI/8')
hold on      
plot(data15(:,1),data15(:,2), 'y' ,'DisplayName','S=.5, u=PI/4, w=PI/4')
hold on      
plot(data18(:,1),data18(:,2), 'g' ,'DisplayName','S=.5, u=PI/2, w=PI/4')

axis([0,2,0,max(data18(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')


%Question 3, sensitivity of change in PG

Spring_19 = angle_PG_rev2([1,0,0], 10000, 3.14159/4, 3.14159/4, .001 , 1, 3, .05, 40, 41, .3, 3.14159/4);
data19 = Spring_19.graph();
Spring_20 = angle_PG_rev2([1,0,0], 10000, 3.14159/4, 3.14159/4, .001 , 1, 3, .05, 40, 41, .35, 3.14159/4);
data20 = Spring_20.graph();
Spring_21 = angle_PG_rev2([1,0,0], 10000, 3.14159/4, 3.14159/4, .001 , 1, 3, .05, 40, 41, .40, 3.14159/4);
data21 = Spring_21.graph();
figure(44)  
hold on      
plot(data14(:,1),data14(:,2), 'c' ,'DisplayName','S=.25, u=PI/4, w=PI/4')
hold on      
plot(data19(:,1),data19(:,2), 'b' ,'DisplayName','S=.30, u=PI/4, w=PI/4')
hold on      
plot(data20(:,1),data20(:,2), 'y' ,'DisplayName','S=.35, u=PI/4, w=PI/4')
hold on      
plot(data21(:,1),data21(:,2), 'g' ,'DisplayName','S=.40, u=PI/4, w=PI/4')

axis([0,2,0,max(data21(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

%Question 4, sensitivity of change in Fiber

Spring_22 = angle_PG_rev2([1.1,0,0], 10000, 3.14159/4, 3.14159/4, .001 , 1, 3, .05, 40, 41, .25, 3.14159/4);
data22 = Spring_22.graph();
Spring_23 = angle_PG_rev2([1.2,0,0], 10000, 3.14159/4, 3.14159/4, .001 , 1, 3, .05, 40, 41, .25, 3.14159/4);
data23 = Spring_23.graph();
Spring_24 = angle_PG_rev2([1.3,0,0], 10000, 3.14159/4, 3.14159/4, .001 , 1, 3, .05, 40, 41, .25, 3.14159/4);
data24 = Spring_24.graph();
figure(45)  
hold on      
plot(data14(:,1),data14(:,2), 'c' ,'DisplayName','A = 1.0, u=PI/4, w=PI/4')
hold on      
plot(data22(:,1),data22(:,2), 'b' ,'DisplayName','A = 1.1, u=PI/4, w=PI/4')
hold on      
plot(data23(:,1),data23(:,2), 'y' ,'DisplayName','A = 1.2, u=PI/4, w=PI/4')
hold on      
plot(data24(:,1),data24(:,2), 'g' ,'DisplayName','A = 1.3, u=PI/4, w=PI/4')

axis([0,2,0,max(data24(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')
