From: harrie@descent.penguinpowered.com
Date: Sun, 30 Apr 2000 19:45:06 +0200 (CEST)
Subject: [linux-lvm] invalid i/o protocol version
Message-ID: <Pine.LNX.4.10.10004301928550.13661-100000@tiger.private>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi there,

I get this error while running vgscan:

# vgscan -vd
lvm_get_iop_version -- CALLED
lvm_get_iop_version -- AFTER ioctl ret: 0
lvm_get_iop_version -- LEAVING with ret: 0
vgscan -- invalid i/o protocol version

As a saw in the mail archives, it could be a missing /dev/lvm, but it is there:

# ls -l /dev/lvm
crw-r-----   1 root     root     109,   0 Apr 29 03:35 /dev/lvm

I tried a few kernels to see if that was the problem, but still haven't found what is wrong.

Is it the lvm-0.8-11.rpm that I use? For some reason I can't compile the tools in tar files (tried different version, all the same errors on "function basename").

# dmesg | grep -i lvm
LVM version 0.8final  by Heinz Mauelshagen  (15/02/2000)
lvm -- Driver successfully initialized

Is the rpm file compatible with this version (it installed without problems)?

At the moment I use Redhat 6.0 with upgraded kernel 2.3.99-pre6.

Hope somebody can help me.

Harrie
