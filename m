Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAEI3BpM000541
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 13:03:11 -0500
Received: from web51005.mail.yahoo.com (web51005.mail.yahoo.com
	[206.190.38.136])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	kAEI3AuW000950
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 13:03:10 -0500
Message-ID: <20061114175622.90848.qmail@web51005.mail.yahoo.com>
Date: Tue, 14 Nov 2006 09:56:22 -0800 (PST)
From: Richard Mollel <unixtipz@yahoo.com>
Subject: Re: [linux-lvm] my PV's disappearing
In-Reply-To: <20061114170723.GE30653@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Sorry...
I am running Mandriva 2006.0, with LVM2
(lvm2-2.01.09-1mdk). I am in the process of migrating
to Redhat ES 4.0. I have external storage, EonStor,
virtually partitioned into 2+2+1TB to overcome 2TB
limitation...and brought together with LVM with PV's
sdb, sdc and sdd.
I have migrated one such partition to Redhat
successfully, simple vgexport and vgimport on the
other end after moving physical device.
So i rebooted one box to add storage so as to migrate
data on reiserfs to new storage, lvm2+ext3. Only then,
the old LVM group did not come up. pvscan shows "no
matching devices". So i had to go thru LVM
recovery...which has fsck'ed my LVM partition, it is
no longer mountable, reiserfs --rebuild-tree could not
complete, not finding metadata.
So i started looking at other nodes, 4 of them, all
Mandriva 2006.0 with LVM2....i perform pvscan once, it
shows output, then probably pvdisplay, and pvscan
again...No output! Only option at that point has been
to backup data as fast as possible...and upon reboot,
all PV's as expected are not recognized,.....and going
thru lvm_recovery (as detailed on
http://codeworks.gnomedia.com/archives/2005/general/lvm_recovery/)
messes up reiserfs completely. 
I have ran pvscan on 4 different systems, only to kill
LVM...it seems somehow it is removing LVM label from
physical partition....
I have not been able to pin-point where the problem
might be. On the external Raid5 device, it does not
show any signs of fault...besides, we are talking of 4
different systems and four different (same make)
storage devices.
As for mandriva 2006.0, i simply take all updates it
recommends that i am missing...and i cannot see
anything remotely close to causing problems. I have
osiris running to detect rpm changes...and recently i
can only see ssh related stuff, running really
concerning.
So i am hurriedly backing up all filesystems that are
on LVM....since it seems to be to common
denominator...though i dont know why....

Just before i sent this out...i saw this thread::
https://www.redhat.com/archives/linux-lvm/2005-May/msg00032.html

And that was exactly my problem!! Not sure why!!
I have now been able to perform::
losetup /dev/loop0 /dev/sdb
losetup /dev/loop1 /dev/sdc
losetup /dev/loop2 /dev/sdd

and, performed : vgchange -a y
(it complained of duplicate uuid's, recreated on
sdb1,sdc1 and sdd1 since pvcreate was complaining of
/dev/sdb,sdc & sdd not found!)
I have been able to mount my reiserfs, so i can
continue with migration.
Issue which i have to take up with Mandriva guys is
why the failure all of a sudden? and do i need to be
performing losetup everytime? My original
configuration had used whole disks...


_Thanks


--- Alasdair G Kergon <agk@redhat.com> wrote:

> On Mon, Nov 13, 2006 at 09:44:22AM -0800, Richard
> Mollel wrote:
> > For some unknown reasons...my LVM PV's which have
> > worked for several years are dropping!
> 
> A simple rule to follow when reporting a problem:
>   Tell people the precise version of the software
> you're using - and the
>   distro!
> 
> And if things suddenly stopped working, tell people
> about anything possibly
> relevant that might have changed recently on the
> system.
> 
> Alasdair
> -- 
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
> http://tldp.org/HOWTO/LVM-HOWTO/
> 



 
____________________________________________________________________________________
Cheap talk?
Check out Yahoo! Messenger's low PC-to-Phone call rates.
http://voice.yahoo.com
