sleepy = true;
snoozeLimit = 1;
while sleepy
    fprintf('ALARM %.0f!!!\n\n', snoozeLimit)
    fprintf('Snoozing')
    pause(1), fprintf('.'), pause(1), fprintf('.'), pause(1), fprintf('.'), pause(1), fprintf('.'), pause(1), fprintf('.\n\n')
    snoozeLimit = snoozeLimit + 1;
    if snoozeLimit == 6
        sleepy = false;
        fprintf('Waking up!\n\n')
    end
end