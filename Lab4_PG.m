%=========Computational Lab 4: Introducing the proteoglycan matrix===========%

%QUESTION 1
%Implement this in Matlab to simulate the effects of the PG. Try a narrow 
%distribution of initial angles around x=0 with s=0, 0.5 and 1. Plot the 
%evolution of angles as in lab 3 and plot the stress-strain curves.

Spring_1 = spring_angle_PG([1,0,0], 10000, 0, 3.14159/8, .001 , 1, 3, .05, 1, 2, 0, 3.14159/4);
data1 = Spring_1.graph();
Spring_1.plot_histogram_3d();

Spring_2 = spring_angle_PG([1,0,0], 10000, 0, 3.14159/8, .001 , 1, 3, .05, 3, 4, .5, 3.14159/4);
data2 = Spring_2.graph();
Spring_2.plot_histogram_3d();

Spring_3 = spring_angle_PG([1,0,0], 10000, 0, 3.14159/8, .001 , 1, 3, .05, 5, 6, 1, 3.14159/4);
data3 = Spring_3.graph();
Spring_3.plot_histogram_3d();

figure(7)             
plot(data1(:,1),data1(:,2), 'r' ,'DisplayName','S=0, u=0, w=PI/8')
hold on   
plot(data2(:,1),data2(:,2), 'y' ,'DisplayName','S=.5, u=0, w=PI/8')
hold on      
plot(data3(:,1),data3(:,2), 'c' ,'DisplayName','S=1, u=0, w=PI/8')

axis([0,2,0,max(data1(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

%QUESTION 2
%Repeat 1) with a narrow distribution of angles around ?/4 and a narrow 
%distribution around ?/2.

Spring_4 = spring_angle_PG([1,0,0], 10000, 3.14159/4, 3.14159/8, .001 , 1, 3, .05, 8, 9, 0, 3.14159/4);
data4 = Spring_4.graph();
Spring_4.plot_histogram_3d();

Spring_5 = spring_angle_PG([1,0,0], 10000, 3.14159/4, 3.14159/8, .001 , 1, 3, .05, 10, 11, .5, 3.14159/4);
data5 = Spring_5.graph();
Spring_5.plot_histogram_3d();

Spring_6 = spring_angle_PG([1,0,0], 10000, 3.14159/4, 3.14159/8, .001 , 1, 3, .05, 12, 13, 1, 3.14159/4);
data6 = Spring_6.graph();
Spring_6.plot_histogram_3d();

figure(14)             
plot(data4(:,1),data4(:,2), 'r' ,'DisplayName','S=0, u=PI/4, w=PI/8')
hold on   
plot(data5(:,1),data5(:,2), 'y' ,'DisplayName','S=.5, u=PI/4, w=PI/8')
hold on      
plot(data6(:,1),data6(:,2), 'c' ,'DisplayName','S=1, u=PI/4, w=PI/8')

axis([0,2,0,max(data4(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

Spring_7 = spring_angle_PG([1,0,0], 10000, 3.14159/2, 3.14159/8, .001 , 1, 3, .05, 15, 16, 0, 3.14159/4);
data7 = Spring_7.graph();
Spring_7.plot_histogram_3d();

Spring_8 = spring_angle_PG([1,0,0], 10000, 3.14159/2, 3.14159/8, .001 , 1, 3, .05, 17, 18, .5, 3.14159/4);
data8 = Spring_8.graph();
Spring_8.plot_histogram_3d();

Spring_9 = spring_angle_PG([1,0,0], 10000, 3.14159/2, 3.14159/8, .001 , 1, 3, .05, 19, 20, 1, 3.14159/4);
data9 = Spring_9.graph();
Spring_9.plot_histogram_3d();

figure(21)             
plot(data7(:,1),data7(:,2), 'r' ,'DisplayName','S=0, u=PI/2, w=PI/8')
hold on   
plot(data8(:,1),data8(:,2), 'y' ,'DisplayName','S=.5, u=PI/2, w=PI/8')
hold on      
plot(data9(:,1),data9(:,2), 'c' ,'DisplayName','S=1, u=PI/2, w=PI/8')

axis([0,2,0,max(data7(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')


%QUESTION 3
%Repeat 1 and 2 with much wider distribution around 0, ?/4 and ?/2.

Spring_10 = spring_angle_PG([1,0,0], 10000, 0, 3.14159/4, .001 , 1, 3, .05, 22, 23, 0, 3.14159/4);
data10 = Spring_10.graph();
Spring_10.plot_histogram_3d();

Spring_11 = spring_angle_PG([1,0,0], 10000, 0, 3.14159/4, .001 , 1, 3, .05, 24, 25, .5, 3.14159/4);
data11 = Spring_11.graph();
Spring_11.plot_histogram_3d();

Spring_12 = spring_angle_PG([1,0,0], 10000, 0, 3.14159/4, .001 , 1, 3, .05, 26, 27, 1, 3.14159/4);
data12 = Spring_12.graph();
Spring_12.plot_histogram_3d();

figure(28)             
plot(data10(:,1),data10(:,2), 'r' ,'DisplayName','S=0, u=0, w=PI/4')
hold on   
plot(data11(:,1),data11(:,2), 'y' ,'DisplayName','S=.5, u=0, w=PI/4')
hold on      
plot(data12(:,1),data12(:,2), 'c' ,'DisplayName','S=1, u=0, w=PI/4')

axis([0,2,0,max(data12(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')


Spring_13 = spring_angle_PG([1,0,0], 10000, 3.14159/4, 3.14159/4, .001 , 1, 3, .05, 29, 30, 0, 3.14159/4);
data13 = Spring_13.graph();
Spring_13.plot_histogram_3d();

Spring_14 = spring_angle_PG([1,0,0], 10000, 3.14159/4, 3.14159/4, .001 , 1, 3, .05, 31, 32, .5, 3.14159/4);
data14 = Spring_14.graph();
Spring_14.plot_histogram_3d();

Spring_15 = spring_angle_PG([1,0,0], 10000, 3.14159/4, 3.14159/4, .001 , 1, 3, .05, 33, 34, 1, 3.14159/4);
data15 = Spring_15.graph();
Spring_15.plot_histogram_3d();

figure(35)             
plot(data13(:,1),data13(:,2), 'r' ,'DisplayName','S=0, u=PI/4, w=PI/4')
hold on   
plot(data14(:,1),data14(:,2), 'y' ,'DisplayName','S=.5, u=PI/4, w=PI/4')
hold on      
plot(data15(:,1),data15(:,2), 'c' ,'DisplayName','S=1, u=PI/4, w=PI/4')

axis([0,2,0,max(data15(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

Spring_16 = spring_angle_PG([1,0,0], 10000, 3.14159/2, 3.14159/4, .001 , 1, 3, .05, 36, 37, 0, 3.14159/4);
data16 = Spring_16.graph();
Spring_16.plot_histogram_3d();

Spring_17 = spring_angle_PG([1,0,0], 10000, 3.14159/2, 3.14159/4, .001 , 1, 3, .05, 38, 39, .5, 3.14159/4);
data17 = Spring_17.graph();
Spring_17.plot_histogram_3d();

Spring_18 = spring_angle_PG([1,0,0], 10000, 3.14159/2, 3.14159/4, .001 , 1, 3, .05, 40, 41, 1, 3.14159/4);
data18 = Spring_18.graph();
Spring_18.plot_histogram_3d();

figure(42)             
plot(data16(:,1),data16(:,2), 'r' ,'DisplayName','S=0, u=PI/2, w=PI/4')
hold on   
plot(data17(:,1),data17(:,2), 'y' ,'DisplayName','S=.5, u=PI/2, w=PI/4')
hold on      
plot(data18(:,1),data18(:,2), 'c' ,'DisplayName','S=1, u=PI/2, w=PI/4')

axis([0,2,0,max(data18(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(43)  
hold on      
plot(data6(:,1),data6(:,2), 'c' ,'DisplayName','S=1, u=PI/4, w=PI/8')
hold on      
plot(data9(:,1),data9(:,2), 'b' ,'DisplayName','S=1, u=PI/2, w=PI/8')
hold on      
plot(data15(:,1),data15(:,2), 'y' ,'DisplayName','S=1, u=PI/4, w=PI/4')
hold on      
plot(data18(:,1),data18(:,2), 'g' ,'DisplayName','S=1, u=PI/2, w=PI/4')

axis([0,2,0,max(data18(:,2))])
xlabel('Strain')
ylabel('Stress')
title('Stress-Strain Curve Series Spring')
legend('Location','northwest')
legend('show')

