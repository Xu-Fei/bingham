function [E_med E_mean C_mean] = get_tofoo_error(fdir, bag_sizes, cvsets)
% [E_med E_mean C_mean] = get_tofoo_error(fdir)


if nargin < 3
    cvsets = 1:5;
end

% get CV error for an object
E = {};
for k=cvsets
   k
   files = dir(sprintf('%s/cv%d*.m', fdir, k));
   if nargin > 1
      E{k} = tofoo_error_rotsym(fdir, files, bag_sizes);
   else
      E{k} = tofoo_error_rotsym(fdir, files);
   end
end

'break'

% plot error graphs
for i=cvsets
    i
   E_med(:,:,i) = median(E{i}(1:20,:,:),3);
   E_mean(:,:,i) = mean(E{i}(1:20,:,:),3);
   C = E{i}<20;
   C_mean(:,:,i) = mean(C(1:20,:,:),3);
end

%figure(4); plot(mean(E_med,3), 'LineWidth', 2);
%figure(5); plot(mean(E_mean,3), 'LineWidth', 2);
%figure(6); plot(mean(C_mean,3), 'LineWidth', 2);
