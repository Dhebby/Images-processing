function [ intensProfilesRR ] = intProfRR(seq)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generating ramp and roof intensity profiles
%
% seq: input sequence of undersampled signal (template)
%
% xxxx xxxxx
% April xx, 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Resampling: 'samples' is the number of samples per each template interval
samples=100.;
x=0:1:(length(seq)-1);
deltax=((max(x)-min(x))/(length(seq)*samples-1));
xinterp=0:deltax:(length(seq)-1);
% Linear interpolation done by the MATLAB function interp1
intensProfilesRR = interp1(x,seq,xinterp);
end