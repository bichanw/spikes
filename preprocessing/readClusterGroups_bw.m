function [cids, cgs] = readClusterGroups_bw(filename)
%function [cids, cgs] = readClusterGroupsCSV(filename)
% cids is length nClusters, the cluster ID numbers
% cgs is length nClusters, the "cluster group":
% - 0 = noise
% - 1 = mua
% - 2 = good
% - 3 = unsorted

T = tdfread(filename);

% read label from file
group = T.group(:,1);  % hand-labeled ones
group(group==' ') = T.KSLabel(group==' ',1);  % ks-labeled ones

% change it to numerical label like phy
cgs = zeros(size(group));
cgs(group== 'm') = 1;
cgs(group== 'g') = 2;
cgs(group== 'u') = 3;
cids = T.cluster_id;