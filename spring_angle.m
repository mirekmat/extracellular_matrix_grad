%Computaional Lab 3
%Matthew Mirek

classdef spring_angle 
   properties
      SpringData 
      Xo = 0;
      Number
      Angle
      Length
      Threshold
      Delta_X
      Start_Length
      Stop_Length
      Step_Size
      Distr_Mean
      Distr_Width
      f1
      f2
      
   end
   methods
       
      %Constructor class, initiliazes variables
      function obj = spring_angle(A, size, mean, half_width, threshold, start, stop, step, fig1, fig2)
         if nargin > 0
            obj.SpringData = A;
            obj.Number = size;
            obj.Distr_Mean = mean;
            obj.Distr_Width = half_width;
            obj.Threshold = threshold;
            obj.Start_Length = start;
            obj.Stop_Length = stop;
            obj.Step_Size = step;
            obj.f1 = fig1;
            obj.f2 = fig2;
    

            obj.Angle = zeros((stop-start)/step + 1,size,'double');
            obj.Length = zeros(1,size,'double');
              for x = 1:1:obj.Number    
                 obj.Angle(1,x) = obj.Distr_Mean - obj.Distr_Width + rand*obj.Distr_Width*2;
              end
              for Len = obj.Start_Length:obj.Step_Size:obj.Stop_Length             
                 for x = 1:1:obj.Number
                    Disp = Len - obj.Start_Length;
                    if(Disp > 0)
                    index1 = uint64(Disp/obj.Step_Size + 1);
                    initial_angle = obj.Angle(index1 -1,x);
                    xlength = 1*cos(initial_angle)+ Disp;
                    new_angle = (abs(initial_angle)/initial_angle)*acos(xlength);

                       if (isreal(new_angle))
                            obj.Angle(index1,x) = new_angle;
                       else
                            obj.Angle(index1,x) = 0;
                       end
                       if ((abs(obj.Angle(index1,x)) < obj.Threshold)&&(obj.Length(1,x) == 0)) 
                            obj.Length(1,x) = Len - step;
                       end
                    end
                 end
              end
         end
      end
      
      function H = Create_Hist(obj, index1)
           nbins = ((3.14159/2)*(1/20)):((3.14159/2)*(2/20)):((3.14159/2)*(19/20));
           x = obj.Angle(index1,:);
           [counts,centers]  = hist(x, nbins);
           %bar(centers, counts)
           H = counts;
      end
      function plot_histogram_3d(obj)
          Y = [ 0, 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ];
          for Len = obj.Start_Length:obj.Step_Size:obj.Stop_Length             
             Disp = Len - obj.Start_Length; 
             index1 = uint64(Disp/obj.Step_Size + 1);
             counts = Create_Hist(obj, index1);
             Y = [Y; counts]; 
          end
             Y(1,:) = [];
             figure(obj.f2)
             bar3(transpose(Y))
             title('Distribution of Alpha versus Strain')
             xaxis = 0:(obj.Step_Size/obj.Start_Length):((obj.Stop_Length-obj.Start_Length)/obj.Start_Length);
             ybins = (obj.Distr_Mean - obj.Distr_Width*(10/11)):obj.Distr_Width*(10/11)/5:(obj.Distr_Mean + obj.Distr_Width*(10/11));
             set(gca,'XTick', 1:41)
             set(gca,'YTick', 1:11)
             set(gca,'XTickLabel',xaxis)
             set(gca,'YTickLabel',ybins)
             xlabel('Strain')
             ylabel('Alpha')
      end
      function data = graph(obj)
          
          results = [ 0, 0];
          
          for x = obj.Start_Length:obj.Step_Size:obj.Stop_Length             
              A = [(x-obj.Start_Length)/obj.Start_Length, ...
                  obj.findForce(x)/obj.Number];
              results = [results; A];             
          end
          
          results(1,:) = [];
          
          figure(obj.f1)
          
          plot(results(:,1),results(:,2), 'g' ,'DisplayName','Calculated Spring')
       
          axis([0,(obj.Stop_Length-obj.Start_Length)/obj.Start_Length,0,max(results(:,2))])
          xlabel('Strain')
          ylabel('Stress')
          title('Stress-Strain Curve Series Spring')
          legend('Location','northwest')
          legend('show')
          
          data = results;
          
      end
      
      function F = findForce(obj, Len)
         sumf = 0;
         for x = 1:1:obj.Number  
            Disp = Len - obj.Start_Length;
            index1 = int64(Disp/obj.Step_Size + 1);
            a = abs(obj.Angle(index1,x));
            
            if (a < obj.Threshold) 
              Disp_off = Len - obj.Length(1,x);
              indiv = obj.SpringData(1)*power(Disp_off, 1)+ obj.SpringData(2)*power(Disp_off, 2) +  obj.SpringData(3)*power(Disp_off, 3);
              sumf = sumf + indiv;
            end
         end
         F = sumf;
      end
      function data = graph_individual(obj, fiber_index)
         
          results = [ 0, 0];
          
          for x = obj.Start_Length:obj.Step_Size:obj.Stop_Length             
              A = [(x-obj.Start_Length)/obj.Start_Length, ...
                  obj.find_Force_indiv(x, fiber_index)/obj.Number];
              results = [results; A];             
          end
          
          results(1,:) = [];
          data = results;
      end
      function F = find_Force_indiv(obj, Len, fiber_index)
            Disp = Len - obj.Start_Length;
            index1 = int64(Disp/obj.Step_Size + 1);
            a = abs(obj.Angle(index1,fiber_index));
            indiv = 0;
            if (a < obj.Threshold) 
              Disp_off = Len - obj.Length(1,fiber_index);
              indiv = obj.SpringData(1)*power(Disp_off, 1)+ obj.SpringData(2)*power(Disp_off, 2) +  obj.SpringData(3)*power(Disp_off, 3);
            end
            F = indiv;
      end

      
   end
end