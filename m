Message-ID: <31A612FE6020D2119F6400A0C9B67EBB0381B0EF@FTHW901E>
From: Franken Klaus <Klaus.Franken@fth2.siemens.de>
Subject: RE: [linux-lvm] 2.2.15 Kernel LVM 0.8 vgscan -- invalid i/o proto
	col version
Date: Thu, 11 May 2000 18:01:41 +0200
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

> -----Original Message-----
> From: Tom Dawes-Gamble [mailto:tmdg@avbrief.com]
> Sent: Thursday, May 11, 2000 5:39 PM
> To: linux-lvm@msede.com
> Subject: [linux-lvm] 2.2.15 Kernel LVM 0.8 vgscan -- invalid i/o
> protocol version
> 
> [root@kingair /root]# vgscan  -vd
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: 0
> <1> lvm_get_iop_version -- LEAVING with ret: 5
> vgscan -- invalid i/o protocol version

> 
> So.  now I'm out of things to try I tought about using a 
> 2.3.X kernel but 
> I really don't want to use a beta kernel.
> 
> The distribution I'm using is RedHat 6.2 (Zoot).
> 
> So what should I try next.

You don't need a newer kernel. The format changed between <= 0.8 and 0.8final.
You have to re-create your physical volumes and to re-compile the new lvm-utils.

Klaus.Franken@fth2.siemens.de    +49 911 978 3707
Siemens Business Services IP 21F
