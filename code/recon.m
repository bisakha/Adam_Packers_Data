M = csvread('C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\Analysis\scores_H116_z150_dfofOut_1.csv',1,1);

M1= reshape(M,sqrt(length(M)), sqrt(length(M)));

load('C:\Users\Bisakha Ray\Desktop\MAT_files_for_ANALYSIS\H116_z150_dfofOut.mat')

arr = H116_z150_dfofOut;

for i = 1:sqrt(length(M))
    
  X(i)  = mean(arr(1,1).contours{1,i}(:,1));
  
end

for i = 1:sqrt(length(M))
    
  Y(i)  = mean(arr(1,1).contours{1,i}(:,2));
  
end






for k = 1:1
threshold = input('Enter threshold: ');
%while threshold >= 0

%%%%input to algorithm will come from slider%%%%%%%%%%%%%%%%
figure;

plot(X(:),Y(:),'.');

size = length(M1) * length(M1);

adj_mat = zeros(1, size);

[r, c] = find(M1> threshold);

adj_mat(M1>threshold) = 1;

adj_mat = reshape(adj_mat,(length(M1)), (length(M1)));

coeff = clustering(adj_mat, 'undirected');

hold on;

box on;

for i = 1:length(r)

    [xaf,yaf] = ds2nfu([X(r(i)), X(c(i))],[Y(r(i)), Y(c(i))]); % Convert to normalized figure units 

    annotation('arrow',xaf,yaf) % Add annotation

end

pause;

close;
end

