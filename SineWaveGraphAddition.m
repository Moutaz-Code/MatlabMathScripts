clear; clc;
time = 1:0.1:100;

    % Sine 1
X1= sin(time);
Z1 = zeros(1,991);

    %Sine 2
X2 = zeros(1,991);
Z2 = sin(time+pi/2);

    % Sine 1&2 combined
X3 = (X1 + X2)/2;
Z3 = (Z1 + Z2)/2;
    
    %plots
hold on;
plot3(X1, time, Z1, 'red', 'LineWidth', 2, 'Color', [1 0 0 0.2]); % Partially transparent red for wave 1
plot3(X2, time, Z2, 'blue', 'LineWidth', 2, 'Color', [0 0 1 0.2]); % Partially transparent blue for wave 2
plot3(X3, time, Z3, 'magenta', 'LineWidth', 2); % Magenta for combined wave
hold off;

%plot3(X1, time, Z1, 'red',X2, time, Z2, 'blue',X3,time, Z3, 'magenta')
grid on;
set(findobj(gca, 'Type', 'Line'), 'LineWidth', 2)
xlabel('X')
ylabel('Y/ Time')
zlabel('Z')


Fs = 10; % Sampling frequency (number of samples per unit time)
period1 = 1 / abs(mean(diff(find(X1 > 0)))/Fs); % Period of Z1 (sine wave 1)
period2 = 1 / abs(mean(diff(find(Z2 > 0)))/Fs); % Period of Z2 (sine wave 2)
period3 = 1 / abs(mean(diff(find(Z3 > 0)))/Fs); % Period of Z3 (combined sine waves)

frequency1 = 1 / period1; % Frequency of Z1
frequency2 = 1 / period2; % Frequency of Z2
frequency3 = 1 / period3; % Frequency of Z3

fprintf('Period and Frequency of Sine Wave 1:\n');
fprintf('Period: %.2f\n', period1);
fprintf('Frequency: %.2f\n\n', frequency1);

fprintf('Period and Frequency of Sine Wave 2:\n');
fprintf('Period: %.2f\n', period2);
fprintf('Frequency: %.2f\n\n', frequency2);

fprintf('Period and Frequency of Combined Sine Waves:\n');
fprintf('Period: %.2f\n', period3);
fprintf('Frequency: %.2f\n\n', frequency3);
