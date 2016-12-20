%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exercise 2.6
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
%%%%%%%%%%%%%%%(a)%%%%%%%%%%%%%%%%%%
%
c1 = conv(intensProfilesRR, boxMask);
c2 = conv(intensProfilesS, boxMask);
d1 = conv(intensProfilesRR, diffMask);
d2 = conv(intensProfilesS, diffMask);
%
figure
subplot(2, 3, 1);
plot(intensProfilesRR), grid on, title('intensProfilesRR');
subplot(2, 3, 2);
plot(c1), grid on, title('c1');
subplot(2, 3, 3);
plot(d1), grid on, title('d1');
subplot(2, 3, 4);
plot(intensProfilesS), grid on, title('intensProfilesS');
subplot(2, 3, 5);
plot(c2), grid on, title('c2');
subplot(2, 3, 6);
plot(d2), grid on, title('d2');
%
%%%%%%%%%%%%%%%(b)%%%%%%%%%%%%%%%%%%
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
%
c1 = conv(intensProfilesRRnoiseLow, boxMask);
c2 = conv(intensProfilesRRnoiseHigh, boxMask);
c3 = conv(intensProfilesSnoiseLow, boxMask);
c4 = conv(intensProfilesSnoiseHigh, boxMask);
d1 = conv(intensProfilesRRnoiseLow, diffMask);
d2 = conv(intensProfilesRRnoiseHigh, diffMask);
d3 = conv(intensProfilesSnoiseLow, diffMask);
d4 = conv(intensProfilesSnoiseHigh, diffMask);
%
figure('Name','intensProfilesRRnoise','NumberTitle','off')
subplot(2, 3, 1);
plot(intensProfilesRRnoiseLow), grid on, title('intensProfilesRRnoiseLow');
subplot(2, 3, 2);
plot(c1), grid on, title('c1');
subplot(2, 3, 3);
plot(d1), grid on, title('d1');
subplot(2, 3, 4);
plot(intensProfilesRRnoiseHigh), grid on, title('intensProfilesRRnoiseHigh');
subplot(2, 3, 5);
plot(c2), grid on, title('c2');
subplot(2, 3, 6);
plot(d2), grid on, title('d2');
%
figure('Name','intensProfilesSnoise','NumberTitle','off')
subplot(2, 3, 1);
plot(intensProfilesSnoiseLow), grid on, title('intensProfilesSnoiseLow');
subplot(2, 3, 2);
plot(c3), grid on, title('c3');
subplot(2, 3, 3);
plot(d3), grid on, title('d3');
subplot(2, 3, 4);
plot(intensProfilesSnoiseHigh), grid on, title('intensProfilesSnoiseHigh');
subplot(2, 3, 5);
plot(c4), grid on, title('c4');
subplot(2, 3, 6);
plot(d4), grid on, title('d4');
%
%%%%%%%%%%%%%%%(c)%%%%%%%%%%%%%%%%%%
d1 = conv(conv(intensProfilesRR, diffMask), diffMask);
d2 = conv(conv(intensProfilesRRnoiseLow, diffMask), diffMask);
d3 = conv(conv(intensProfilesRRnoiseHigh, diffMask), diffMask);
d4 = conv(conv(intensProfilesS, diffMask), diffMask);
d5 = conv(conv(intensProfilesSnoiseLow, diffMask), diffMask);
d6 = conv(conv(intensProfilesSnoiseHigh, diffMask), diffMask);

figure('Name','intensProfilesRR diff','NumberTitle','off')
subplot(2, 3, 1);
plot(intensProfilesRR), grid on, title('intensProfilesRR');
subplot(2, 3, 2);
plot(intensProfilesRRnoiseLow), grid on, title('intensProfilesRRnoiseLow');
subplot(2, 3, 3);
plot(intensProfilesRRnoiseHigh), grid on, title('intensProfilesRRnoiseHigh');
subplot(2, 3, 4);
plot(d1), grid on, title('d1');
subplot(2, 3, 5);
plot(d2), grid on, title('d2');
subplot(2, 3, 6);
plot(d3), grid on, title('d3');
%
figure('Name','intensProfilesS diff','NumberTitle','off')
subplot(2, 3, 1);
plot(intensProfilesS), grid on, title('intensProfilesS');
subplot(2, 3, 2);
plot(intensProfilesSnoiseLow), grid on, title('intensProfilesSnoiseLow');
subplot(2, 3, 3);
plot(intensProfilesSnoiseHigh), grid on, title('intensProfilesSnoiseHigh');
subplot(2, 3, 4);
plot(d4), grid on, title('d4');
subplot(2, 3, 5);
plot(d5), grid on, title('d5');
subplot(2, 3, 6);
plot(d6), grid on, title('d6');
%
%%%%%%%%%%%%%%%(d)%%%%%%%%%%%%%%%%%%
c1 = conv(conv(intensProfilesRR, boxMask), boxMask);
c2 = conv(conv(intensProfilesRRnoiseLow, boxMask), boxMask);
c3 = conv(conv(intensProfilesRRnoiseHigh, boxMask), boxMask);
c4 = conv(conv(intensProfilesS, boxMask), boxMask);
c5 = conv(conv(intensProfilesSnoiseLow, boxMask), boxMask);
c6 = conv(conv(intensProfilesSnoiseHigh, boxMask), boxMask);

figure('Name','intensProfilesRR somma','NumberTitle','off')
subplot(2, 3, 1);
plot(intensProfilesRR), grid on, title('intensProfilesRR'), ylim([-10, 20]);
subplot(2, 3, 2);
plot(intensProfilesRRnoiseLow), grid on, title('intensProfilesRRnoiseLow'), ylim([-10, 20]);
subplot(2, 3, 3);
plot(intensProfilesRRnoiseHigh), grid on, title('intensProfilesRRnoiseHigh'), ylim([-10, 20]);
subplot(2, 3, 4);
plot(c1), grid on, title('c1'), ylim([-5, 25]);
subplot(2, 3, 5);
plot(c2), grid on, title('c2'), ylim([-5, 25]);
subplot(2, 3, 6);
plot(c3), grid on, title('c3'), ylim([-5, 25]);
%
figure('Name','intensProfilesS somma','NumberTitle','off')
subplot(2, 3, 1);
plot(intensProfilesS), grid on, title('intensProfilesS'), ylim([-4, 8]);
subplot(2, 3, 2);
plot(intensProfilesSnoiseLow), grid on, title('intensProfilesSnoiseLow'), ylim([-4, 8]);
subplot(2, 3, 3);
plot(intensProfilesSnoiseHigh), grid on, title('intensProfilesSnoiseHigh'), ylim([-4, 8]);
subplot(2, 3, 4);
plot(c4), grid on, title('c4'), ylim([-2, 8]);
subplot(2, 3, 5);
plot(c5), grid on, title('c5'), ylim([-2, 8]);
subplot(2, 3, 6);
plot(c6), grid on, title('c6'), ylim([-2, 8]);
