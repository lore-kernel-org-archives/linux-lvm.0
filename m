Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1S83cVS031652
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 03:03:39 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1S83bNG016411
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 03:03:37 -0500
Date: Wed, 28 Feb 2007 09:03:36 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Please help: LVM Recovery on base RHEL3 system.
Message-ID: <20070228080335.GC23712@percy.comedia.it>
References: <2100174a0702271504s5d0a9d4cra027a3e38fc6d9fa@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2100174a0702271504s5d0a9d4cra027a3e38fc6d9fa@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Feb 27, 2007 at 06:04:02PM -0500, Pete Toscano wrote:
>[root@Server lvmconf]# cat /proc/mdstat
>Personalities : [raid5]
>read_ahead 1024 sectors
>Event: 1
>md0 : active raid5 hdh[4] hdg[3] hdf[2] hde[1] hdc[0]
>      976793600 blocks level 5, 128k chunk, algorithm 2 [5/5] [UUUUU]
>
>unused devices: <none>
>
>>From what I can tell, though, it doesn't look like LVM is seeing the RAID
>device as a PV anymore:
>
>[root@Server lvmconf]# pvdisplay -vv /dev/md0
>pvdisplay -- checking physical volume name "/dev/md0"
>pvdisplay -- reading data of physical volume "/dev/md0" from disk
>pvdisplay -- no physical volume identifier on "/dev/md0"
>
Weird.
before proceding: are you sure that your friend did not partition the
ide disks before creating the md? could auto-assemble be that stupid?

>I tried to do a vgcfgrestore and got this:
>
>[root@Server lvmconf]# vgcfgrestore -n raid_discs -vv  /dev/md0
...
>vgcfgrestore -- ERROR "pv_read(): PV identifier invalid" reading physical
>volume "/dev/md0"
you need to pvcreate the device before using vgcfgrestore, but read the
pvcreate manpage (option -z iirc) or you will do a mess....

>Is there anything that we can do to save his data?  I know that with
>partition tables, if you know them in advance, you can re-write them and, if
>you're exact, you won't lose any data.  Is it possible to do the same with
>pvcreate?  Could I re-init the PV, then have the VG suddenly be happy?
pvcreate/lvcreate by default zeroes the beginning of the PV/LV, you must
use the option -z to avoid this...

>Suggestions?
I would also play with testdisk before pvcreating, but i am pretty sure
that data (or metadata for that matter) does not disappear, so before
doing anything that involves writing to the disk, try understanding what
happened.

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
