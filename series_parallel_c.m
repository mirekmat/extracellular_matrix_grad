%Computaional Lab 2
%Matthew Mirek

%Overview: This class initialized two nonlinear springs in series, and 
%solves for the middle distance between the two springs by using minimum 
%function solver. By initializes an instance of the object you can pull 
%information about the spring and graph stress strain graphs of the 
%function. 

classdef spring_parallel
   properties
      %Spr_A and Spr_B ask for a 4 part array, where:
      %[term ai, term bi, term ci, unstressed length]
      SpringData 
      Xo = 0;
      N
      Distr_Type
      Distr_Width
      Distr_Average
      Len
   end
   methods
       
      %Constructor class, initiliazes variables
      function obj = spring_parallel(A, size, type, avg, width)
         if nargin > 0
            obj.SpringData = A;
            obj.N = size;
            obj.Distr_Type = type;
            obj.Distr_Width = width;
            obj.Distr_Average = avg;
            obj.Len = zeros(1,size,'double');
            
          if  strcmpi('single',obj.Distr_Type)
                 for x = 1:1:obj.N
                 obj.Len(1,x) = obj.Distr_Average;
                 end
          end
          
          if  strcmpi('uniform',obj.Distr_Type)
                 for x = 1:1:obj.N     
                 obj.Len(1,x) = obj.Distr_Average - obj.Distr_Width/2 + rand*obj.Distr_Width;
                 end
          end
         end
      end
      

      
      
      %Calculates energy for a given midpoint for combined spring system.
      function E = findEnergy(obj, length)
         sum = 0;
         
         for x = 1:1:obj.N     
            if (obj.Len(1,x) < length)
              Disp = (obj.Len(1,x) - length);
              sum = sum + 1/2*obj.SpringData(1)*power(Disp, 2)+ 1/3*obj.SpringData(2)*power(Disp, 3) +  1/4*obj.SpringData(3)*power(Disp, 4);
            end
         end
         E = sum;
      end

      
      %takes in midpoint, and calculates array 
      function F = findForce(obj, length)
         sumf = 0;
         for x = 1:1:obj.N    
            if (obj.Len(1,x) < length)
              Disp = (length - obj.Len(1,x));
              indiv = obj.SpringData(1)*power(Disp, 1)+ obj.SpringData(2)*power(Disp, 2) +  obj.SpringData(3)*power(Disp, 3);
              sumf = sumf + indiv;
            end
         end
         F = sumf;
      end
      
      %graphs stress strain for the system, and each individual spring
      function data = graph_stress_strain(obj, STARTLENGTH, STOPLENGTH)
          
          results = [ 0, 0];
          
          for x = STARTLENGTH:.2:STOPLENGTH
              A = [(x-STARTLENGTH)/STARTLENGTH, obj.findForce(x)/obj.N];
              results = [results; A];
          end
          
          figure(1)
          
          plot(results(:,1),results(:,2), 'g' ,'DisplayName','Calculated Spring')
       
          axis([0,(STOPLENGTH-STARTLENGTH)/STARTLENGTH,0,max(results(:,2))])
          xlabel('Strain')
          ylabel('Stress')
          title('Stress-Strain Curve Series Spring')
          
          legend('show')
          
          data = results;
          
      end
      
   end
end