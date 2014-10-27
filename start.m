mssg=48;
disp('Connecting ... ')
b = Brick('ioType','usb');
b.beep();

disp('===================================')

while char(mssg)-48 < 6
    mssg = judp('receive', 3335, 1);

    char(mssg)
    switch char(mssg)
      case 's'
        b.outputStart(0,Device.MotorB);
        disp('> Motor Started');
        disp(['> stateMotorA: ' num2str(stateMotorA)]);
      case 'h'
        b.outputStop(0,Device.MotorA,0);
        b.outputStop(0,Device.MotorB,0);
        b.outputStop(0,Device.MotorD,0);
        disp('> Motor Stopped');
      case '1'
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

      case '2'
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

      case '3'
        b.outputPower(0,Device.MotorB, -70)
        b.outputStart(0,Device.MotorB)
        pause(1.5)
        disp('> Up');
        stateMotorB = stateMotorB + 1;
        disp(['> stateMotorB: ' num2str(stateMotorB)]);

      case '4'
        b.outputPower(0,Device.MotorB, 30)
        b.outputStart(0,Device.MotorB)
        pause(0.5)
        b.outputStop(0,Device.MotorB,0)
        disp('> Down');
        stateMotorB = stateMotorB - 1;
        disp(['> stateMotorB: ' num2str(stateMotorB)]);

      case '5'
        b.outputPower(0,Device.MotorA, -90)
        b.outputStart(0,Device.MotorA)
        pause(0.25)
        b.outputStop(0,Device.MotorA,0)
        disp('> Open');
        stateMotorA = stateMotorA + 1;
        disp(['> stateMotorA: ' num2str(stateMotorA)]);

      case '6'
        b.outputPower(0,Device.MotorA, 100)
        b.outputStart(0,Device.MotorA)
        pause(0.5)
        b.outputStop(0,Device.MotorA,0)
        disp('> Close');
        stateMotorA = stateMotorA - 1;
        disp(['> stateMotorA: ' num2str(stateMotorA)]);

      case 'q'
        break;
      otherwise
    end
mssg=48;
end