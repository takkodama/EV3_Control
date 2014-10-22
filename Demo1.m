s% init the connection
disp('Connecting ... ')
% brick usb init
b = Brick('ioType','usb');
% beep to indicate connection
b.beep();

% print information
disp('===================================')
disp('EV3 example code')
disp('===================================')
disp('u - increase motor speed')
disp('d - decrease motor speed')
disp('t - start the motor')
disp('s - stop the motor')
disp('b - beep')
disp('o - output the tachometer')
disp('c - clear the tachometer')
disp('v - output the brick voltage')
disp('q - quit the program');
disp('===================================')
% user intput
userIn = '';
% motor power
motorPowerA = 10;
motorPowerB = 10;
motorPowerD = 10;
% set motor power
b.outputPower(0,Device.MotorA, 0)
b.outputPower(0,Device.MotorB, 0)
b.outputPower(0,Device.MotorD, 0)
% reset motor
b.outputClrCount(0,Device.MotorA)
b.outputClrCount(0,Device.MotorB)
b.outputClrCount(0,Device.MotorD)
% motor state
stateMotorA = 0;
stateMotorB = 0;
stateMotorD = 0;

while(~strcmp(userIn,'q'))
    % get input
    userIn = input('> Input(s, h, b, r, l, u, d, o, c, q): ', 's');


    % beep test
    if (userIn == 'b')
        b.beep();
        disp('> Beep');
    end

    % start the motor
    if (userIn == 's')
        b.outputStart(0,Device.MotorB);
        disp('> Motor Started');
        disp(['> stateMotorA: ' num2str(stateMotorA)]);
        disp(['> stateMotorB: ' num2str(stateMotorB)]);
        disp(['> stateMotorD: ' num2str(stateMotorD)]);
    end

    % stop the motor
    if (userIn == 'h')
        b.outputStop(0,Device.MotorA,0);
        b.outputStop(0,Device.MotorB,0);
        b.outputStop(0,Device.MotorD,0);
        disp('> Motor Stopped');
    end

    % turn right
    if (userIn == 'r')

        if(stateMotorD < 1)
            b.outputStepSpeed(0,Device.MotorD,30,0,240,0,Device.Brake);
            disp('> Right');
            tachoD = b.outputGetCount(0,Device.MotorD);
            disp(['> Tachometer: ' num2str(tachoD)]);
            stateMotorD = stateMotorD + 1;
            disp(['> stateMotorD: ' num2str(stateMotorD)]);
        else
            b.beep();
            disp('> Beep');
            disp('Cannot go to right anymore !');
        end
    end

    % turn left
    if (userIn == 'l')

        if(stateMotorD > -1)
            b.outputStepSpeed(0,Device.MotorD,-30,0,240,0,Device.Brake)
            disp('> Left');
            tachoD = b.outputGetCount(0,Device.MotorD);
            disp(['> Tachometer: ' num2str(tachoD)]);
            stateMotorD = stateMotorD - 1;
            disp(['> stateMotorD: ' num2str(stateMotorD)]);
        else
            b.beep();
            disp('> Beep');
            disp('Cannot go to left anymore !');
        end

    end

    % arm up
    if (userIn == 'u')
        b.outputPower(0,Device.MotorB, -70)
        b.outputStart(0,Device.MotorB)
        pause(1.5)
        disp('> Up');
        tachoB = b.outputGetCount(0,Device.MotorB);
        disp(['> Tachometer: ' num2str(tachoB)]);
        stateMotorB = stateMotorB + 1;
        disp(['> stateMotorB: ' num2str(stateMotorB)]);
    end

    % arm down
    if (userIn == 'd')
        b.outputPower(0,Device.MotorB, 30)
        b.outputStart(0,Device.MotorB)
        pause(0.5)
        b.outputStop(0,Device.MotorB,0)
        disp('> Down');
        tachoB = b.outputGetCount(0,Device.MotorB);
        disp(['> Tachometer: ' num2str(tachoB)]);
        stateMotorB = stateMotorB - 1;
        disp(['> stateMotorB: ' num2str(stateMotorB)]);
    end

    % hand open
    if (userIn == 'o')
        b.outputPower(0,Device.MotorA, -90)
        b.outputStart(0,Device.MotorA)
        pause(0.25)
        b.outputStop(0,Device.MotorA,0)
        disp('> Open');
        tachoA = b.outputGetCount(0,Device.MotorA);
        disp(['> Tachometer: ' num2str(tachoA)]);
        stateMotorA = stateMotorA + 1;
        disp(['> stateMotorA: ' num2str(stateMotorA)]);
    end

    % hand close
    if (userIn == 'c')
        b.outputPower(0,Device.MotorA, 100)
        b.outputStart(0,Device.MotorA)
        pause(0.5)
        b.outputStop(0,Device.MotorA,0)
        disp('> Close');
        tachoA = b.outputGetCount(0,Device.MotorA);
        disp(['> Tachometer: ' num2str(tachoA)]);
        stateMotorA = stateMotorA - 1;
        disp(['> stateMotorA: ' num2str(stateMotorA)]);
    end


    % voltage output
    if (userIn == 'v')
        v = b.uiReadVbatt;
        disp(['> Brick voltage: ' num2str(v) 'V']);
    end


    %===============================
    % output the tachometer
    if (userIn == 'to')
        tacho = b.outputGetCount(0,Device.MotorA);
        disp(['> Tachometer: ' num2str(tacho)]);
    end

    % clear the tachometer
    if (userIn == 'tc')
        b.outputClrCount(0,Device.MotorA)
        disp('> Cleared tacho');
    end
    %===============================


end
% delete the brick object
delete(b)