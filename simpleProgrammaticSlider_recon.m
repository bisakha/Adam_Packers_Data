function simpleProgrammaticSlider_recon(H115_z150_dfofOut)


M = csvread('C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\Analysis\scores_H115_z150_dfofOut_corrected_1.csv',1,1);

M1= reshape(M,sqrt(length(M)), sqrt(length(M)));



length(M1)

min(min(M1))

max(max(M1))

%load('C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\H116_z150_dfofOut.mat');

arr = H115_z150_dfofOut;

for i = 1:sqrt(length(M))
    
  X(i)  = mean(arr(1,1).contours{1,i}(:,1));
  
end

for i = 1:sqrt(length(M))
    
  Y(i)  = mean(arr(1,1).contours{1,i}(:,2));
  
end

figure;

plot(X(:),Y(:),'.');



hold on;

box on;

    % add slider to figure
    s1h = uicontrol('Style',    'slider',...
                    'Units',    'Normalized',...
                    'Min',min(min(M1)),'Max',max(max(M1)),...
                    'Value', max(max(M1)),...
                    'Position', [0.01,0.09,.1,.8],...
                    'Callback', @sliderCallback);

    % this nested function is called every time the slider is clicked
    function sliderCallback(hObj,~)
      threshold = get(hObj,'Value') % slider value between 0 and 1
      [r, c] = find(M1> threshold);
      
      for i = 1:length(r)

    [xaf,yaf] = ds2nfu([X(r(i)), X(c(i))],[Y(r(i)), Y(c(i))]); % Convert to normalized figure units 
    
    annotation('arrow',xaf,yaf,'Tag' , 'somethingUnique'); % Add annotation

      end
    pause;
    %% Press Enter
    delete(findall(gcf,'Tag','somethingUnique'))       
    end   

end
