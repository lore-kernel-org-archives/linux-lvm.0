Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k33DAoF1020560
	for <linux-lvm@redhat.com>; Mon, 3 Apr 2006 09:10:50 -0400
Received: from lists.geoinf.fu-berlin.de (www.geoinf.fu-berlin.de
	[160.45.89.23])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k33DAhHm028098
	for <linux-lvm@redhat.com>; Mon, 3 Apr 2006 09:10:43 -0400
Received: from [160.45.89.15] (callisto.geoinf.fu-berlin.de [160.45.89.15])
	by lists.geoinf.fu-berlin.de (Postfix) with ESMTP id 4577B4482D
	for <linux-lvm@redhat.com>; Mon,  3 Apr 2006 15:11:55 +0200 (CEST)
Message-ID: <44311ED1.9020800@zedat.fu-berlin.de>
Date: Mon, 03 Apr 2006 15:10:41 +0200
From: Sebastian Walter <swalter@zedat.fu-berlin.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Down After Disk Failure
References: <443111EF.5040103@zedat.fu-berlin.de>
In-Reply-To: <443111EF.5040103@zedat.fu-berlin.de>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Does anybody know how to force lvm to remove a PV or a LV from a PV
(even if the VG is not accessible)? Probably it still is present somehow
in the  vgda and lvm tries to access it.... thanks!


Sebastian Walter wrote:
> Dear list,
>
> after a power failure we had troubles with a hard drive, it went down
> unrecoverably. So I removed the LV's wich had PE's on this disk by
> executing, and I got this error:
>
> [root@xxx root]# lvremove /dev/xxx/data5
> lvremove -- do you really want to remove "/dev/vghrsc/data5"? [y/n]: y
> lvremove -- ERROR "vg_write(): write" storing data of volume group
> "vghrsc" on disks
>
> then I got another strange error:
>
> Message from syslogd@xxx at Mon Apr  3 12:14:39 2006 ...
> xxx kernel: journal commit I/O error
>
> therefore I decided to reboot the system. After the reboot, I couldn't
> manage to get the system up and running again, I got error messages
> about vgchange not finding any VG's.
>
> I even ran vgcfgrestore, but it succeeded without giving me a hint about
> errors.
>
> vgscan now gives me:
>
> [root@xxx root]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
> volume group "vghrsc" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
>
> pvscan gives me (I had to remove the scsi disk, before I got some sense
> key errors here):
>
> [root@mex root]# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sdb1"  is associated to unknown VG "vghrsc"
> (run vgscan)
> pvscan -- inactive PV "/dev/sdc1"  is associated to unknown VG "vghrsc"
> (run vgscan)
> pvscan -- inactive PV "/dev/sdd1"  is associated to unknown VG "vghrsc"
> (run vgscan)
> pvscan -- inactive PV "/dev/sde1"  is associated to unknown VG "vghrsc"
> (run vgscan)
> pvscan -- inactive PV "/dev/sdf1"  is associated to unknown VG "vghrsc"
> (run vgscan)
> pvscan -- total: 5 [6.84 TB] / in use: 5 [6.84 TB] / in no VG: 0 [0]
>
> /dev/sdf1 is the scsi drive I removed in the meanwhile and which is not
> present anymore.
>
> I would really appreciate any help! Thanks in advance,
> Sebastian
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   
