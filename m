Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105270747.f4R7lIYa005098@webber.adilger.int>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
In-Reply-To: <m2ofsguzp5.fsf@isnogud.escape.de> "from Urs Thuermann at May 26,
 2001 01:17:26 pm"
Date: Sun, 27 May 2001 01:47:18 -0600 (MDT)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Urs writes:
> First, I repeated my previous tests:
> 
> 						         $dev
> 
>                                                 /dev/sda5    /dev/vg0/test
> ---------------------------------------------+-------------+----------------
> dd if=$dev of=/dev/null bs=512 count=1048576 |    71.2s    |   122.7s
> dd if=$dev of=/dev/null bs=64k count=8192    |    71.5s    |    71.7s

OK, I have now reproduced this problem on my SMP test system.  This is on a
2xP5-200 + 128MB RAM, Advansys ABP940U SCSI, and (old) IBM 0662-S12 and
IBM 0663-L12 1GB SCSI drives.  I do NOT have this problem on my laptop
AFAICS (P2-500 + 128MB RAM, Intel PIIX4 IDE, IBM-DARA-218000).

Doing similar tests to the above (dd if=$dev of=/dev/null, bs=512 count=100k)
I get the following results (50MB I/O, 100MB LV, Linux 2.2.18 + LVM 0.9):

/dev/sda = real 12.290s user 0.110s sys 2.890s
/dev/sda = real 12.269s user 0.100s sys 2.900s
/dev/sda1 = real 12.317s user 0.140s sys 2.980s
/dev/sda1 = real 12.251s user 0.130s sys 2.900s
/dev/vgtest/lvtest = real 66.909s user 0.440s sys 10.420 *** 5x as slow
/dev/vgtest/lvtest = real 70.135s user 0.520s sys 11.390 *** 5x as slow

/dev/sdb = real 11.614s user 0.060s sys 3.090s
/dev/sdb = real 11.597s user 0.120s sys 2.910s
/dev/sdb1 = real 11.857s user 0.150s sys 4.020s
/dev/sdb1 = real 11.749s user 0.110s sys 2.800s
/dev/vgtest3/lvtest = real 63.552s user 0.510s sys 10.290s *** 6x as slow
/dev/vgtest3/lvtest = real 62.354s user 0.610s sys 10.020s *** 6x as slow

/dev/hda6 = real 10.848s user 0.180s sys 4.380s
/dev/hda6 = real 10.803s user 0.210s sys 4.300s
/dev/vgtest2/lvtest = real 15.258s user 0.480s sys 9.500s *** 50% slower
/dev/vgtest2/lvtest = real 15.827s user 0.360s sys 9.830s *** 50% slower

I'm not sure if it is an SMP or SCSI issue, or what.  Urs, do you also
have an SMP system?  Maybe there are locking slowdowns under SMP and
not under UP?

The problem is definitely more noticable on the SCSI disks, but at least
on the IDE disk the increased wall-clock time is wholly accounted for
by increased system time.  On the SCSI disks, it would guess that "dd"
is waiting for I/O completions under LVM, and not on the raw disk???

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
