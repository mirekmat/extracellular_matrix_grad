%Computaional Lab 2
%Matthew Mirek

%Modified Class to change distribution of ci

classdef spring_parallel_c
   properties
      SpringData 
      Xo = 0;
      N
      Distr_Type
      Distr_Width
      Distr_Average
      Initial_Length
      C
   end
   methods
       
      %Constructor class, initiliazes variables
      function obj = spring_parallel_c(A, size, type, avg, width, initial)
         if nargin > 0
            obj.SpringData = A;
            obj.N = size;
            obj.Distr_Type = type;
            obj.Distr_Width = width;
            obj.Distr_Average = avg;
            obj.Initial_Length = initial;
            obj.C = zeros(1,size,'double');

          if  strcmpi('uniform',obj.Distr_Type)
                 for x = 1:1:obj.N     
                 obj.C(1,x) = obj.Distr_Average - obj.Distr_Width/2 + rand*obj.Distr_Width;
                 end
          end
         end
      end
      
      function F = findForce(obj, length)
         sumf = 0;
         for x = 1:1:obj.N    
              Disp = (length - obj.Initial_Length);
              indiv = obj.SpringData(1)*power(Disp, 1)+ obj.SpringData(2)*power(Disp, 2) +  obj.C(1,x)*power(Disp, 3);
              sumf = sumf + indiv;
         end
         F = sumf;
      end
      
      function data = graph_stress_strain(obj, STARTLENGTH, STOPLENGTH)
          
          results = [ 0, 0];
          
          for x = STARTLENGTH:.2:STOPLENGTH
              A = [(x-STARTLENGTH)/STARTLENGTH, obj.findForce(x)/obj.N];
              results = [results; A];
          end
          
          results(1,:) = [];
          figure(1)
          
          plot(results(:,1),results(:,2), 'g' ,'DisplayName','Calculated Spring')
       
          axis([0,(STOPLENGTH-STARTLENGTH)/STARTLENGTH,0,max(results(:,2))])
          xlabel('Strain')
          ylabel('Stress')
          title('Stress-Strain Curve Series Spring')
          legend('Location','northwest')
          legend('show')
          
          data = results;
          
      end
      
   end
end