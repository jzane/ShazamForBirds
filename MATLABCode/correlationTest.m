
[Bird,Fs]= audioread('crow-noise.mp3');
[magpie, Fs2] = audioread('Magpie-warning-call.mp3');

[acor,lag] = xcorr(Bird(:,1), magpie(:,1)); %only consider chanle 1
[AutoCorr, lag1] = xcorr(Bird(:,1), 'biased');
[AutoCorrU, lag2] = xcorr(Bird(:,1), 'unbiased');

figure;

subplot(3,1,1);
plot(lag, acor); title('Correlation of Magpie and Crow'); ylabel('magnitude'); xlabel('Samples');

subplot(3,1,2);
plot(lag1, AutoCorr); title('AutoCorrelation of Crow (Biased)'); ylabel('magnitude'); xlabel('Samples');

subplot(3,1,3);
plot(lag2, AutoCorrU); title('AutoCorrelation of Crow (Ubiased)'); ylabel('magnitude'); xlabel('Samples');



% Now we'll add in the noise
[rows, sizeBird] = size(Bird);
y2 = randn(1,rows); %30,000 of random gaussian distribution white noise
Bird1(:,1) = Bird(:,1) + transpose(y2);
figure;
plot(Bird(:,1));
figure;
plot(Bird1(:,1));


[acor2,lag2] = xcorr(Bird1(:,1), Bird(:,1)); %only consider channel 1
[AutoCorr2, lag12] = xcorr(Bird1(:,1), 'biased');
[AutoCorrU2, lag22] = xcorr(Bird1(:,1), 'unbiased');


figure;

subplot(3,1,1);
plot(lag2, acor2); title('Correlation of Crow and Noisy Crow'); ylabel('magnitude'); xlabel('Samples');

subplot(3,1,2);
plot(lag12, AutoCorr2); title('AutoCorrelation of Noisy Crow (Biased)'); ylabel('magnitude'); xlabel('Samples');

subplot(3,1,3);
plot(lag22, AutoCorrU2); title('AutoCorrelation of Noisy Crow (Ubiased)'); ylabel('magnitude'); xlabel('Samples');

