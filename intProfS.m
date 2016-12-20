function [ intensProfilesS] = intProfS(seqS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generating step intensity profiles
%
% seq: input sequence of undersampled signal (template)
%
% xxxxxxx xxxxxxxxxxxxx
% April xxx, 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
intensProfilesS = []; % initialize the step function
dim = length(seqS);
for i=1 : dim % compute the step function, profile
              % signal along the scanline. It is obtained
              % by interpolating the seq template values
 intensProfilesS= [intensProfilesS seqS(i)*ones(1,100)];
end


end