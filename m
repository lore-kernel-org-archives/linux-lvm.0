Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBAIfA2I005182
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 13:41:10 -0500
Received: from e6.ny.us.ibm.com (e6.ny.us.ibm.com [32.97.182.146])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBAIesPR019711
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 13:40:55 -0500
Received: from d01relay07.pok.ibm.com (d01relay07.pok.ibm.com [9.56.227.147])
	by e6.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id nBAIaO5N023679
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 13:36:24 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay07.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	nBAIesbU1880294
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 13:40:54 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	nBAIesxe012295
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 16:40:54 -0200
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av03.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	nBAIerZ5012264
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 16:40:53 -0200
Date: Thu, 10 Dec 2009 10:40:53 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Re: Re: Problems with dissapearing PV when
	mounting (Stuart D. Gathman)
Message-ID: <20091210184053.GA6645@us.ibm.com>
References: <691e2b620912100845t435d0730ifb8bf13bae4d6b7d@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <691e2b620912100845t435d0730ifb8bf13bae4d6b7d@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Johan Gardell [gardin@gmail.com] wrote:
> The output from
> dmsetup table
>   gardin-swap_1:
>   gardin-root:
>   Dreamhack-dreamhacklv: 0 2636726272 linear 8:34 384

The above output clearly shows that gardin-root and gardin-swap_1 have
empty tables. I remember there was a fix that cleaned up empty tables
like above but that won't help you. You need to figure out the reason
for 'device mapper lookup failure' messages.

> >> [22723.980390] device-mapper: table: 254:1: linear: dm-linear: Device
> >> lookup failed
> >> [22723.980395] device-mapper: ioctl: error adding target to table
> >> [22724.001153] device-mapper: table: 254:2: linear: dm-linear: Device
> >> lookup failed
> >> [22724.001158] device-mapper: ioctl: error adding target to table

The above messages are direct reason for not "really" creating
gardin-root or gardin-swap_1 logical volumes.  If you know the
underlying PV's that make up gardin-root LV, try reading from them using
'dd'. If you can read, then the most likely problem is that someone else
has opened them. It may be hard to find though. You need to go through
usual culprits by running, 'cat /proc/mounts', 'cat /proc/swaps' etc. Is
EVMS using them by any chance..., maybe mdraid...

> >> mount doesn't give any messages in dmesg
> >>
> >> lvs shows:
> >> ? LV ? ? ? ? ?VG ? ? ? ?Attr ? LSize ? Origin Snap% ?Move Log Copy% ?Convert
> >> ? dreamhacklv Dreamhack -wi-ao ? 1,23t
> >> ? root ? ? ? ?gardin ? ?-wi-d- 928,00g
> >> ? swap_1 ? ? ?gardin ? ?-wi-d- ? 2,59g
> >>
> >> if i try to mount with:
> >> ? mount -t reiserfs /dev/mapper/gardin-root /mnt/tmp
> >>
> >> i get this in dmesg:
> >> ? [23113.711247] REISERFS warning (device dm-1): sh-2006
> >> read_super_block: bread failed (dev dm-1, block 2, size 4096)
> >> ? [23113.711257] REISERFS warning (device dm-1): sh-2006
> >> read_super_block: bread failed (dev dm-1, block 16, size 4096)
> >> ? [23113.711261] REISERFS warning (device dm-1): sh-2021
> >> reiserfs_fill_super: can not find reiserfs on dm-1
> >
> > Looks like you have some kind of LV here. What is the output of the
> > following two commands:

Your 'dmsetup table' output shows why the mount failed. You have an LV
created with no mapping.

Thanks, Malahal.
