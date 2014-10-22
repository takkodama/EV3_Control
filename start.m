mssg=48;
disp('Connecting ... ')
b = Brick('ioType','usb');
b.beep();

disp('===================================')

while char(mssg)-48 < 6
    mssg = judp('receive', 3334, 1);

    char(mssg)
    switch char(mssg)
    %%these commands are same as 'Switcher.m'
      case '1'
        b.beep();
        disp('> Beep');
      case '2'
        b.beep();
        disp('> Beep');
      case 's'
        b.outputStart(0,Device.MotorB);
        disp('> Motor Started');
        disp(['> stateMotorA: ' num2str(stateMotorA)]);
        disp(['> stateMotorB: ' num2str(stateMotorB)]);
        disp(['> stateMotorD: ' num2str(stateMotorD)]);
      case 'q'
        break;
      otherwise
    end
mssg=48;
end