%Computaional Lab 2
%Matthew Mirek

classdef spring_parallel
   properties
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

      function cdata = graph_cl(obj, STARTLENGTH, STOPLENGTH, density)
          
          results = [ 0, 0];
          crosslink = zeros(1,obj.N-1,'double');
          for j = 1:1:(obj.N-1)
              crosslink(j) = rand();
          end 
          
          for x = STARTLENGTH:.2:STOPLENGTH               
              A = [(x-STARTLENGTH)/STARTLENGTH, ...
                  obj.findForce_Cross(x, crosslink, density)/obj.N];
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
          
          cdata = results;
          
      end
      
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
      
      
      function F = findForce_Cross(obj, length, cross, density)
         sumf = 0;
         for x = 1:1:obj.N    
            if (obj.Len(1,x) < length)
              Disp = (length - obj.Len(1,x));
              indiv = obj.SpringData(1)*power(Disp, 1)+ obj.SpringData(2)*...
                  power(Disp, 2) +  obj.SpringData(3)*power(Disp, 3);
              if(x == 1)
                  if(cross(x) < density)
                    sumf = sumf + indiv*1.5;
                  end
              elseif(x == obj.N)
                  if(cross(x-1) < density)
                    sumf = sumf + indiv*1.5;
                  end
              elseif((cross(x-1) < density) || (cross(x) < density))
                sumf = sumf + indiv*1.5;
              else
                sumf = sumf + indiv;  
              end
            end
         end
         F = sumf;
      end
      function L = get.Len(obj)
          L = obj.Len;
      end
      
   end
end