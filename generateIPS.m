%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 2.5
% Edge intensity profiles: filter responses
%
% Generating profile simulating multiple edge profiles
% Adding low/high noise to the profiles
% Filtering noisy profiles with sum and difference filters
%
% xxxxxxx xxxxxxxxx
% April xx 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Generate intensity profile signals
% starting with the template sequence seq
% seq: undersampled grey level values (template)
%
%%%%%%%%%%%%%%%%%%%%% Procedure to generate the ramp and roof profiles
seqRR=[0 0 0 4 8 12 12 0 0 0 12 0 0];% Ramp and roof templates
intensProfilesRR=intProfRR(seqRR); % Call to intProfRR function
                                   % interpolating linearly the
                                   % ramp and roof template, to
                                   % generate the intensity
                                   % profile intensProfilesRR
                                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Procedure to generate the step profiles
seqS=[0 0 4 4 0 0 0 4 4 0 0 0]; % Step template
intensProfilesS = intProfS(seqS); % Call to infProfS function
                                  % interpolating stepwise the
                                  % step template, to generate
                                  % the profile intensProfilesS
                                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate filter masks
boxMask=1/5.*ones(1,5);
diffMask=[-ones(1,5) ones(1,5)];
%
figure
subplot(2, 2, 1);
plot(intensProfilesRR), grid on, title('intensProfilesRR');
subplot(2, 2, 2);
plot(intensProfilesS), grid on, title('intensProfilesS');
subplot(2, 2, 3);
plot(boxMask), grid on, title('boxMask');
subplot(2, 2, 4);
plot(diffMask), grid on, title('diffMask');
%
% creo rumore
nLow = 0.01*max(intensProfilesRR)*randn(1, length(intensProfilesRR));
nHigh = 0.2*max(intensProfilesRR)*randn(1, length(intensProfilesRR));
%sommo rumore alle img di partenza
intensProfilesRRnoiseLow = intensProfilesRR + nLow;
intensProfilesRRnoiseHigh = intensProfilesRR + nHigh;

nLow = 0.01*max(intensProfilesS)*randn(1, length(intensProfilesS));
nHigh = 0.2*max(intensProfilesS)*randn(1, length(intensProfilesS));
intensProfilesSnoiseLow = intensProfilesS + nLow;
intensProfilesSnoiseHigh = intensProfilesS + nHigh;
%
figure
subplot(2, 3, 1);
plot(intensProfilesRR), grid on, title('intensProfilesRR');
subplot(2, 3, 2);
plot(intensProfilesRRnoiseLow), grid on, title('intensProfilesRRnoiseLow');
subplot(2, 3, 3);
plot(intensProfilesRRnoiseHigh), grid on, title('intensProfilesRRnoiseHigh');
subplot(2, 3, 4);
plot(intensProfilesS), grid on, title('intensProfilesS');
subplot(2, 3, 5);
plot(intensProfilesSnoiseLow), grid on, title('intensProfilesSnoiseLow');
subplot(2, 3, 6);
plot(intensProfilesSnoiseHigh), grid on, title('intensProfilesSnoiseHigh');




