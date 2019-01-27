#   Copyright (c) 2019, Xilinx, Inc.
#   All rights reserved.
# 
#   Redistribution and use in source and binary forms, with or without 
#   modification, are permitted provided that the following conditions are met:
#
#   1.  Redistributions of source code must retain the above copyright notice, 
#       this list of conditions and the following disclaimer.
#
#   2.  Redistributions in binary form must reproduce the above copyright 
#       notice, this list of conditions and the following disclaimer in the 
#       documentation and/or other materials provided with the distribution.
#
#   3.  Neither the name of the copyright holder nor the names of its 
#       contributors may be used to endorse or promote products derived from 
#       this software without specific prior written permission.
#
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
#   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
#   PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
#   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
#   EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
#   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#   OR BUSINESS INTERRUPTION). HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
#   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
#   OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
#   ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


from . import Arduino


__author__ = "zou cong"
__copyright__ = "Copyright 2019, Xilinx"
__email__ = "pynq_support@xilinx.com"


ARDUINO_AUTOMOTO_PROGRAM = "arduino_4wdmoto.bin"

CONFIG_IOP_SWITCH = 0x1
STOP = 0x3
MOVE = 0x5
VELOCITY = 0x7
PWM_CONTROL = 0x9

DIRECTION = ["FORWARD": 0,"BACKWARD": 1,
             "LEFT_S": 2,"RIGHT_S": 3,
             "LEFT_R":4,"RIGHT_R":5]

TIMER = [0,1,2,3,4,5]

PINS = [6,9,10,11,7,8,12,13,4,5,18,19]
'''
PINS[0:4] is set the pins to control
the pwm generate io for motor a,b,c,d in sequence

 * auotmoto a: right front
 * auotmoto b: right rear
 * automoto c: left sacro-anterior / left front
 * auotmoto d: left rear
 
PINS[4:8] is to set the pin to control the direction of motor
1 normal, 0 reverse

PINS[8:12] is to set the pins to record the velocity
'''

class Automoto(object):
    """This class controls the Automoto. 
    
    Each automoto has five io control the power and direction of motor
    Model: FIT0441. Hardware version: v2.2.
    
    Attributes
    ----------
    microblaze : Arduino
        Microblaze processor instance used by this module.
        
    """
    def __init__(self, mb_info, pin = PINS):
        """Return a new instance of an Grove LEDbar object. 
        
        Parameters
        ----------
        mb_info : dict
            A dictionary storing Microblaze information, such as the
            IP name and the reset name.
        instruction: list
           instruction to controll the car

        """
        if len(pin) != 12:
            raise ValueError("the number of pin should be set exactly 12.")
        if int(max(pin)) > 21 or int(min(pin)) > 0:
            raise ValueError("the value of pin should not be bigger than 21 or smaller than 0")

        self.microblaze = Arduino(mb_info, ARDUINO_AUTOMOTO_PROGRAM)
        self.microblaze.write_mailbox(0, pin)
        self.microblaze.write_blocking_command(CONFIG_IOP_SWITCH)

    def stop(self):
        """stop the car

        Returns
        -------
        None

        """
        self.microblaze.write_blocking_command(STOP)

    def move(self, instruction, speed = 50):
        """control the car to move
        Parameters
        ----------
        instruction is a string defined to instruct the direction
        speed is a int to control the speed

        Returns
        -------
        None

        """
        data_in = []
        if instruction not in DIRECTION.keys():
            raise ValueError("please input valid direction!")
        if speed not in range(101):
            raise ValueError("velocity should be in the range from 0 to 100")
        data_in += DIRECTION[instruction]
        data_in += speed
        self.microblaze.write_mailbox(0, data_in)
        self.microblaze.write_blocking_command(MOVE)

    def velocity(self):
        """
        return the average of the four motor velocity
        
        Parameters
        ----------
        int -> float

        Returns
        -------
        velocity of the whole car
        """
        self.microblaze.write_block_command(VELOCITY)
        avalue = self.microblaze.read_mailbox(0)
        bvalue = self.microblaze.read_mailbox(1)
        cvalue = self.microblaze.read_mailbox(2)
        dvalue = self.microblaze.read_mailbox(3)
        return value = (avalue + bvalue + cvalue + dvalue)/4
        
    def pwm_control(self, timer = 0,period = 625998, pulse =  312998)
        """
        set which timer to control and
        control the output of pwm
        
        Parameters
        ----------
        long int: period, pulse
        int : timer

        Returns
        -------
        None
        
        """
        data_in = []
        data_in += timer
        data_in += period
        data_in += pulse
        self.microblaze.write_mailbox(0, data_in)
        self.microblaze.write_block_command(PWM_CONTROL)
