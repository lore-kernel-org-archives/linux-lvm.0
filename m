Date: Thu, 13 Jul 2000 15:55:07 -0700 (PDT)
From: Adam Crews <acrews@cisco.com>
Subject: [linux-lvm] invalid i/o protocal version
In-Reply-To: <001301bfea54$f84de470$42c225c3@steuer.ofd.niedersachsen.de>
Message-ID: <Pine.LNX.4.21.0007131531430.3258-100000@scooby.cisco.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hello

I have just downgraded from kernel 2.4.0-test1 to 2.2.16.

I installed the lvm patch to 2.2.16 and can load the lvm module just fine.
[root@scooby /root]# lsmod
Module                  Size  Used by
lvm                    98216   0  (autoclean)
soundcore               3204   0  (autoclean) (unused)
ide-probe               6512   0
autofs                  9504   1  (autoclean)
eepro100               16752   2  (autoclean)
unix                   11396  89  (autoclean)
ide-disk                6332   0
ide-mod                41656   0  [ide-probe ide-disk]
ncr53c8xx              52336   6
sd_mod                 16328   6
scsi_mod               40716   2  [ncr53c8xx sd_mod]
[root@scooby /root]# cat /proc/lvm
LVM module version 0.8i  (02/10/1999)

Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
Global: 140 bytes vmalloced   IOP version: 5   0:05:09 active
[root@scooby /root]#


When I try to do any lvm commands I get the following:
[root@scooby /root]# vgscan -d -v
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 5
vgscan -- invalid i/o protocol version

[root@scooby /root]#


I have re-compiled the lvm tools against the 2.2.16 src and libs, but I
get the same message.

How can I fix this, or what other info is needed to figure out what is
happening?

-adam
