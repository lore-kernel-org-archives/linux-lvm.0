Return-Path: <urs@isnogud.escape.de>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
References: <200105270747.f4R7lIYa005098@webber.adilger.int>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 27 May 2001 11:47:30 +0200
In-Reply-To: <200105270747.f4R7lIYa005098@webber.adilger.int>; from Andreas Dilger on Sun, 27 May 2001 01:47:18 -0600 (MDT)
Message-ID: <m27kz39l8t.fsf@isnogud.escape.de>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andreas Dilger <adilger@turbolinux.com> writes:

> /dev/vgtest/lvtest = real 66.909s user 0.440s sys 10.420 *** 5x as slow
> /dev/vgtest/lvtest = real 70.135s user 0.520s sys 11.390 *** 5x as slow
> 
> /dev/vgtest3/lvtest = real 63.552s user 0.510s sys 10.290s *** 6x as slow
> /dev/vgtest3/lvtest = real 62.354s user 0.610s sys 10.020s *** 6x as slow

This is similar to the worst case numbers I have measured.

> I'm not sure if it is an SMP or SCSI issue, or what.  Urs, do you also
> have an SMP system?  Maybe there are locking slowdowns under SMP and
> not under UP?

No.  It's a single Pentium II, 333MHz, kernel 2.4.3 with lvm-0.9.1_beta7
compiled without SMP support:

    isnogud:urs$ grep SMP /usr/src/linux-2.4.3-ut/.config
    # CONFIG_SMP is not set

The SCSI controller is an Adaptec AIC 7880 on an ASUS P2L97-S
mainboard (onboard).  The SCSI disks are

    Host: scsi0 Channel: 00 Id: 00 Lun: 00
      Vendor: IBM      Model: DCAS-34330W      Rev: S65A
      Type:   Direct-Access                    ANSI SCSI revision: 02
    Host: scsi0 Channel: 00 Id: 01 Lun: 00
      Vendor: IBM      Model: DCAS-34330W      Rev: S65A
      Type:   Direct-Access                    ANSI SCSI revision: 02
    Host: scsi0 Channel: 00 Id: 02 Lun: 00
      Vendor: NEC      Model: DSE2100S         Rev: 0306
      Type:   Direct-Access                    ANSI SCSI revision: 02

i.e. /dev/sda and /dev/sdb are UW-SCSI and /dev/sdc is a SCSI-2 disks.


> The problem is definitely more noticable on the SCSI disks, but at least
> on the IDE disk the increased wall-clock time is wholly accounted for
> by increased system time.  On the SCSI disks, it would guess that "dd"
> is waiting for I/O completions under LVM, and not on the raw disk???

How could I check?  And do you have an idea, why a file system on top
of such a slow LV is, if at all, only somewhat slower?


urs
