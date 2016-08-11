function [ d ] = DistributionDistance( target_pdf, pdfs )
%BHATTACHARYYA_DISTANCE returns the Bhattacharyya Distance between 2 pdfs
%   target_pdf: vector 1xM containing the target pdf to which we want to
%   compute the distance
%   pdfs: matrix NxM containing pdfs
%   d = column vector containing N distances
    target_pdf = repmat(target_pdf,size(pdfs,1) ,1);
    d = -log(sum(sqrt(target_pdf .* pdfs),2));

end

