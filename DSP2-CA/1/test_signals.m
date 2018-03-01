% test_signals

N = 1024;
n = 0:N-1;

x = MakeSignal('Bumps', N);

figure(1)
clf
subplot(4, 1, 1)
line(n, x)
title('Bumps')
xlim([0 N])

%%

x = MakeSignal('Blocks', N);

subplot(4, 1, 2)
line(n, x)
title('Blocks')
xlim([0 N])

%%

x = MakeSignal('Piece-Regular', N);

subplot(4, 1, 3)
line(n, x)
title('Piece-Regular')
xlim([0 N])

%%

x = MakeSignal('Doppler', N);

subplot(4, 1, 4)
line(n, x)
title('Doppler')
xlim([0 N])

orient tall
print -dpdf test_signals



