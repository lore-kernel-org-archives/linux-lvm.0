From: M.Ritzert@CENIT.DE
Message-ID: <F1138FCB1C61D211AA690004AC6289EA015A8EF4@ntss15.stgt.cenit.de>
Subject: [linux-lvm] LVM Partition ID in conflict?
Date: Thu, 2 Sep 1999 13:58:58 +0200 
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi,

i'm preparing a third disk to extend the volume group of my debian potato
system. During fdisk i noticed that
the partition ID used by LVM is meanwhile preoccupied by a partition type
called "LANstep". I'm aware that
partition IDs are soley based on convention and that its violation probably
won't harm technical functionality severely.

Anyway --- i feel that as soon as LVM will merge into the maninstream linux
kernel the need to fix this double 
occupation of a partition ID will probably arise quickly. Any comments?

Michael
