%% scores_shuffled_total contains 5 columns of concatenated shuffled values with 77841 rows

for i = 1:77841
mean_shuffle(i) = mean(scores_shuffled_total(i,:));
std_shuffle(i) = std(scores_shuffled_total(i,:));
end

for i = 1:77841
if scores_not_shuffled(i) >=mean_shuffle(1,i)+2*std_shuffle(1,i)
adj_mat(i) = 1;
end
if scores_not_shuffled(i) ==0
adj_mat(i) = 0;
end
end

adj_mat = reshape(adj_mat,sqrt(length(adj_mat)), sqrt(length(adj_mat))); 

[r, c] = find(adj_mat > 0);

figure;

plot(X(:),Y(:),'.');

hold on;

box on;

for i = 1:length(r)

    [xaf,yaf] = ds2nfu([X(r(i)), X(c(i))],[Y(r(i)), Y(c(i))]); % Convert to normalized figure units 

    annotation('arrow',xaf,yaf) % Add annotation

end
