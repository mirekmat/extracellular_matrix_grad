%Computaional Lab 1
%Matthew Mirek

%Overview: This class initialized two nonlinear springs in series, and 
%solves for the middle distance between the two springs by using minimum 
%function solver. By initializes an instance of the object you can pull 
%information about the spring and graph stress strain graphs of the 
%function. 

classdef series_spring
   properties
      %Spr_A and Spr_B ask for a 4 part array, where:
      %[term ai, term bi, term ci, unstressed length]
      Spr_A %Left Spring
      Spr_B %Right Spring
      Xe %Endpoint of two springs combined
      Xo = 0;
   end
   methods
       
      %Constructor class, initiliazes variables
      function obj = series_spring(A, B, length)
         if nargin > 0
            obj.Spr_A = A;
            obj.Spr_B = B;
            obj.Xe = length;
         end
      end
      
      %Calculates energy for a given midpoint for combined spring system.
      function E = findEnergy(obj, Xp)
         Disp_A = ((Xp - obj.Xo) - obj.Spr_A(4)); %Displacement
         Disp_B = ((obj.Xe - Xp) - obj.Spr_B(4));
         
         EnergyA = 1/2*obj.Spr_A(1)*power(Disp_A, 2)+ 1/3*obj.Spr_A(2)*power(Disp_A, 3) +  1/4*obj.Spr_A(3)*power(Disp_A, 4);
         EnergyB = 1/2*obj.Spr_B(1)*power(Disp_B, 2)+ 1/3*obj.Spr_B(2)*power(Disp_B, 3) +  1/4*obj.Spr_B(3)*power(Disp_B, 4);
     
         E = EnergyA + EnergyB;
      end
      
      %Utilizes findEnergy to find the location of the midpoint by
      %minimizing the energy
      function E = findXp(obj)
         E = fminsearch(@obj.findEnergy,0);
         
      end
      
      %takes in midpoint, and calculates array 
      function E = checkForce(obj, Xp)
          
         Disp_A = ((Xp - obj.Xo) - obj.Spr_A(4));
         Disp_B = ((obj.Xe - Xp) - obj.Spr_B(4));
         ForceA = obj.Spr_A(1)*power(Disp_A, 1)+ obj.Spr_A(2)*power(Disp_A, 2) +  obj.Spr_A(3)*power(Disp_A, 3);
         ForceB = obj.Spr_B(1)*power(Disp_B, 1)+ obj.Spr_B(2)*power(Disp_B, 2) +  obj.Spr_B(3)*power(Disp_B, 3);
         
         E = [ForceA ForceB] ;
         
      end
      %graphs stress strain for the system, and each individual spring
      function graph_stress_strain(obj)
          
          temp = obj.Xe;
          results = [ 0, 0, 0, 0, 0, 0];
          
          for x = 0.2:.2:.2*20
              
          obj.Xe = obj.Spr_A(4) + obj.Spr_B(4) + x;
          mid = obj.findXp();
          force = obj.checkForce(mid);
          
          A = [(mid - obj.Spr_A(4))/(obj.Spr_A(4)), force(1),(obj.Xe - mid - obj.Spr_B(4))/obj.Spr_B(4), force(2),x/(obj.Spr_A(4)+obj.Spr_B(4)), force(1)];
      
          results = [results; A];
          
          end
          
          obj.Xe = temp;
          
          figure(1)
          plot(results(:,1),results(:,2), 'g' ,'DisplayName','Spring A')
          hold on
          plot(results(:,3),results(:,4), 'r' ,'DisplayName','Spring B')
          hold on
          plot(results(:,5),results(:,6), 'b' ,'DisplayName','Spring Total')
          hold on

          axis([0,2,0,max(results(:,6))])
          xlabel('Strain')
          ylabel('Stress')
          title('Stress-Strain Curve Series Spring')
          
          legend('show')
          
      end
      %graphs force displacement for the system, and each individual spring
      function graph_force_displacement(obj)
          
          temp = obj.Xe;
          results = [ 0, 0, 0, 0, 0, 0];
          
          for x = 0.2:.2:.2*20
              
          obj.Xe = obj.Spr_A(4) + obj.Spr_B(4) + x;
          mid = obj.findXp();
          force = obj.checkForce(mid);
          
          A = [(mid - obj.Spr_A(4)), force(1),(obj.Xe - mid - obj.Spr_B(4)), force(2),x , force(1)];
      
          results = [results; A];
          
          end
          
          obj.Xe = temp;
          
          figure(2)
          plot(results(:,1),results(:,2), 'g' ,'DisplayName','Spring A')
          hold on
          plot(results(:,3),results(:,4), 'r' ,'DisplayName','Spring B')
          hold on
          plot(results(:,5),results(:,6), 'b' ,'DisplayName','Spring Total')
          hold on

          axis([0,.2*20,0,max(results(:,6))])
          xlabel('Displacement')
          ylabel('Force')
          title('Force-Displacement Curve Series Spring')
          
          legend('show')
          
      end
      
   end
end