# EV3_Control

- (En) Control the [LEGO EV3 Robot](http://education.lego.com/ja-jp/preschool-and-school/secondary/mindstorms-education-ev3) freely by using a [MATLAB](http://www.mathworks.co.jp/products/matlab/?refresh=true) and a [Max6](http://www.mi7.co.jp/products/cycling74/) software.
- (Ja) [LEGO EV3ロボット](http://education.lego.com/ja-jp/preschool-and-school/secondary/mindstorms-education-ev3) を [MATLAB](http://www.mathworks.co.jp/products/matlab/?refresh=true) と [Max6](http://www.mi7.co.jp/products/cycling74/) の2ソフトを利用して自由にコントロールする。

## Features

(En)

- You can control the motor of the LEGO NXT easily, without using official GUI programming software.
- You can do effective robot control because this program can control the MATLAB software by using the UDP connection from the Max6 software.
- In a default Max6 patch, the six commands are written to control robot, which movements are defined switch-case function in ```start.m``` file.

(Ja)

- 純正GUIプログラミングソフトウェアを使わず、より手軽にNXTのモーターコントロールができる
- MaxMSPからUDP通信によりMATLABを操作することで、より直感的で応用が利いたコントロールが可能
	* ```key```を利用して特定のキーが押されるとロボットが動くようにしたり、```mxj net.udp.recv```を利用して他のソフトウェアからudp通信を受け取って処理することも可能
	* 筆者は以上機能を使って、研究開発に使用している(詳細ファイルは非公開)
- デフォルトパッチでは6つのコマンドが用意されており、それぞれの動作は```start.m```内のswitch文内に指示されている各動作から定義することができる


## How to use?
- (研究開発用としてアップデートしているので) 完成時に記載予定

## License
- CC by 3.0

## Acknowledgments
- [QUT EV3 MATLAB toolkit - CyPhy Lab](https://wiki.qut.edu.au/display/cyphy/QUT+EV3+MATLAB+toolkit)

