Date: Thu, 30 Mar 2000 17:20:04 -0500 (EST)
From: Chris Shelton <cshelton@indiana.edu>
Subject: [linux-lvm] Can't locate modules when running vgscan
Message-ID: <Pine.HPP.3.96.1000330171141.7850C-100000@othello.ucs.indiana.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I've recently started using the LVM software on one of my systems, and
I've noticed that there are numerous messages are produced each time I run
vgscan:

Mar 30 13:50:19 fmslan kernel: LVM version 0.8i  by Heinz Mauelshagen
(02/10/1999) 
Mar 30 13:50:19 fmslan kernel: lvm -- Module successfully initialized 
Mar 30 13:50:20 fmslan modprobe: can't locate module block-major-48
Mar 30 13:50:22 fmslan last message repeated 63 times
Mar 30 13:50:22 fmslan modprobe: can't locate module block-major-49
Mar 30 13:50:23 fmslan last message repeated 63 times
Mar 30 13:50:27 fmslan kernel: cdrom: open failed. 
Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-33
Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-33
Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-34
Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-34
Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-7
Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-7
Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-9
Mar 30 13:50:27 fmslan modprobe: can't locate module block-major-9

I've added these two lines to my /etc/modules.conf:
alias block-major-58      lvm
alias char-major-109      lvm

The system is running kernel version 2.2.14, with version 0.8i of the LVM
patch.  

The filesystem created in the logical volume I have created seems to work
just fine, but I've not sure if I've missed something in the setup that is
causing these messages to appear.

Chris Shelton
