function recon_pvalue(H115_z150_dfofOut)

M = csvread('C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\Analysis\shuffle_ap\scores_not_shuffled_0.csv',1,1);

M1= reshape(M,sqrt(length(M)), sqrt(length(M)));

M = csvread('C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\Analysis\shuffle_ap\scores_shuffled_1_0.csv',1,1);

M2= reshape(M,sqrt(length(M)), sqrt(length(M)));

M = csvread('C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\Analysis\shuffle_ap\scores_shuffled_2_0.csv',1,1);

M3= reshape(M,sqrt(length(M)), sqrt(length(M)));

M = csvread('C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\Analysis\shuffle_ap\scores_shuffled_3_0.csv',1,1);

M4= reshape(M,sqrt(length(M)), sqrt(length(M)));

M = csvread('C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\Analysis\shuffle_ap\scores_shuffled_4_0.csv',1,1);

M5= reshape(M,sqrt(length(M)), sqrt(length(M)));


M = csvread('C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\Analysis\shuffle_ap\scores_shuffled_5_0.csv',1,1);

M6= reshape(M,sqrt(length(M)), sqrt(length(M)));


%load('C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\H115_z150_dfofOut.mat')

arr = H115_z150_dfofOut;

for i = 1:sqrt(length(M))
    
  X(i)  = mean(arr(1,1).contours{1,i}(:,1));
  
end

for i = 1:sqrt(length(M))
    
  Y(i)  = mean(arr(1,1).contours{1,i}(:,2));
  
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%pval_mat%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pval_mat = [];
for i = 1:sqrt(length(M1))
     for j = 1:sqrt(length(M1))
       tot = numel(find(M2>M1(i,j))) + numel(find(M3>M1(i,j))) + numel(find(M4>M1(i,j))) + numel(find(M5>M1(i,j)))
       + numel(find(M6>M1(i,j)));
       pval_mat(i,j) = tot/(5*numel(M2));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%calculation%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




figure;

plot(X(:),Y(:),'.');



hold on;

box on;

    % add slider to figure
    s1h = uicontrol('Style', 'slider',...
                    'Units', 'Normalized',...
                    'Min',min(min(pval_mat)),'Max',max(max(pval_mat)),...
                    'Value', max(max(pval_mat)),...
                    'Position', [0.01,0.09,.1,.8],...
                    'Callback', @sliderCallback);

    % this nested function is called every time the slider is clicked
function sliderCallback(hObj,~)
threshold = get(hObj,'Value') % slider value between 0 and 1
      [r, c] = find(pval_mat<= threshold);
      
      for i = 1:length(r)

    [xaf,yaf] = ds2nfu([X(r(i)), X(c(i))],[Y(r(i)), Y(c(i))]); % Convert to normalized figure units
    
    annotation('arrow',xaf,yaf,'Tag' , 'somethingUnique'); % Add annotation

      end
    pause;
    %% Press Enter
    delete(findall(gcf,'Tag','somethingUnique'))
    end

end
