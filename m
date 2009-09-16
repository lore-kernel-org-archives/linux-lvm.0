Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GJG0sx004141
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 15:16:00 -0400
Received: from interhosting.it (smtpauth.interfree.it [213.158.72.43])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n8GJFl44031924
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 15:15:48 -0400
Received: from delo.gdit (delo.gdit [127.0.0.1])
	by delo.gdit (8.14.2/8.14.2) with ESMTP id n8GJFko5003513
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 21:15:46 +0200
Received: (from root@localhost)
	by delo.gdit (8.14.2/8.14.2/Submit) id n8GJFkTj003511
	for linux-lvm@redhat.com; Wed, 16 Sep 2009 21:15:46 +0200
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
From: Ambrogio De Lorenzo <ambrogio.de.lorenzo@alice.it>
In-Reply-To: <1253120322.16343.71.camel@pc.interlinx.bc.ca>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916170533.62999698@fixlaptop.gillibert.homelinux.net>
	<1253119669.5326.32.camel@delo.gdit>
	<1253120322.16343.71.camel@pc.interlinx.bc.ca>
Content-Transfer-Encoding: 7bit
Date: Wed, 16 Sep 2009 21:15:46 +0200
Message-Id: <1253128546.3243.13.camel@delo.gdit>
Mime-Version: 1.0
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

Il giorno mer, 16/09/2009 alle 12.58 -0400, Brian J. Murrell ha scritto:
> On Wed, 2009-09-16 at 18:47 +0200, Ambrogio De Lorenzo wrote:
> > 
> > snapshot is not a good choise for me.
> 
> It actually is.  I snapshot all of my filesystems before every upgrade
> and let the snapshots hang around until I am happy with the upgrade.
Imagine that upgrade change something in LVM configuration or in lvm
software.
Snapshots are good only if you have the original data and all the
modified data.
This is not a good way to rollback everything.

My idea is:
     1. Insert a new disk via USB
     2. configure mirroring
     3. continue to work and monitor for mirroring progress (performance
        are not a problem)
     4. In a good moment shutdown the system
     5. boot with a live CD with an LVM version compatible
     6. split mirroring of lv (this made available 2 copies with
        different names on 2 different disks)
     7. split VG
     8. reboot without the USB disk (that is a good copy of original VG)
     9. change everything I need (i.e. I can also destroy disk or
        destroy VG) and test it.
    10. If is good I can destroy the USB copy, if it isn't I can boot
        from USB

> Well, snapshots give you a very space efficient (if not performance
> efficient due to the COW nature of snapshots) version of that.  When you
> create a snapshot and before your modify any data in the origin (the
> volume you are creating a snapshot (a.k.a. copy) of your snapshot is an
> identical copy (just as if you'd used dd) of the origin, without using
> any additional space even!
I know very well how snapshot works. And it's for this reason that I
don't think it's a good choise for my scope

> > I'm looking also on mdadm to mirror a disk (or partition) but I think it
> > is not usable when disk is already partitioned and used without mdadm.
> 
> Well, you will have that same problem with LVM.  Planning is key in any
> of this.
Yes, but LVM is already configured for this reason.
Mdadm isn't. I tried to test it but I'm not able to obtain a mirror of
an already partitioned and used disk.

Bye
 Ambrogio
