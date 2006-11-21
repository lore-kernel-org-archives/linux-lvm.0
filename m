Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kALDrfGS006482
	for <linux-lvm@redhat.com>; Tue, 21 Nov 2006 08:53:41 -0500
Received: from web51005.mail.yahoo.com (web51005.mail.yahoo.com
	[206.190.38.136])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id kALDrUDa023247
	for <linux-lvm@redhat.com>; Tue, 21 Nov 2006 08:53:31 -0500
Date: Tue, 21 Nov 2006 05:53:19 -0800 (PST)
From: Richard Mollel <unixtipz@yahoo.com>
Subject: Re: [linux-lvm] my PV's disappearing
In-Reply-To: <20061120182137.GC18439@percy.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <572710.72712.qm@web51005.mail.yahoo.com>
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

--- Luca Berra <bluca@comedia.it> wrote:

> On Tue, Nov 14, 2006 at 09:56:22AM -0800, Richard
> Mollel wrote:
> >
> >Just before i sent this out...i saw this thread::
>
>https://www.redhat.com/archives/linux-lvm/2005-May/msg00032.html
> >
> >And that was exactly my problem!! Not sure why!!
> >I have now been able to perform::
> >losetup /dev/loop0 /dev/sdb
> >losetup /dev/loop1 /dev/sdc
> >losetup /dev/loop2 /dev/sdd
> >
> can you please clarify if you are really using whole
> disks or did you by
> chance partition the devices.
> the message you cite was the fix for someone that
> did partition the disk
> after creating the PVs and filling LVM with data.
> 
> if the device holds a partition table lvm commands
> will ignore the
> whole disk and try to find an LVM label on the
> partition.
> the loosetup trick will fool lvm tools (loop device
> are not
> partitionable)

Hi Luca,
It created these LVM volumes several years back on
LVM1...and to admit, were my first LVM's experience
then. So, i followed religiously the instructions,
whereby i had to create a partition, label it type
"8e" (LVM) on the partition. For some reason, back
then, i then performed pvcreate on whole device
(/dev/sdb, sdc,sdd) and not their partition. It all
worked OK for years, even after OS upgrade from
Mandrake 10.0 to Mandriva 2006.0, thus changing LVM to
LVM2. Until i ran s fresh pvscan was when i broke the
configuration. It seems to have been working on cache
(/etc/lvm/.cache) configuration, and a pvscan forced a
flush of that.
> 
> >and, performed : vgchange -a y
> >(it complained of duplicate uuid's, recreated on
> >sdb1,sdc1 and sdd1 since pvcreate was complaining
> of
> >/dev/sdb,sdc & sdd not found!)
> pvcreate? did you pvcreate? on the partition?
> 
> >I have been able to mount my reiserfs, so i can
> >continue with migration.
> >Issue which i have to take up with Mandriva guys is
> >why the failure all of a sudden? and do i need to
> be
> >performing losetup everytime? My original
> >configuration had used whole disks...
> >
> 
> i did not see anything related to that on mandriva
> bugzilla, but in any
> case if the issue is that the whole device was
> partitioned after lvm
> creation there is not much i can do about it.
The whole device was partitioned before LVM
creation...
> 
> L.
> 
> -- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
> http://tldp.org/HOWTO/LVM-HOWTO/
> 



 
____________________________________________________________________________________
Sponsored Link

Compare mortgage rates for today. 
Get up to 5 free quotes. www2.nextag.com
