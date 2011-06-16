Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p5GD42cv028787
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2011 09:04:02 -0400
Received: from lxme02.infocamere.it (lxme02.infocamere.it [80.82.3.213])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5GD3wpu030591
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2011 09:03:59 -0400
Received: from lxm07.intra.infocamere.it (lxm07.intra.infocamere.it [1.5.72.7])
	by lxme02.infocamere.it (8.14.3/8.14.3) with ESMTP id p5GD3vsx009225
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2011 15:03:58 +0200
Received: from [1.5.28.70] (ic2301012.ic.intra.infocamere.it [1.5.28.70])
	(authenticated bits=0)
	by lxm07.intra.infocamere.it (8.14.3/8.14.3) with ESMTP id
	p5GD3v49001886
	for <linux-lvm@redhat.com>; Thu, 16 Jun 2011 15:03:57 +0200
Message-ID: <4DF9FF21.3080406@infocamere.it>
Date: Thu, 16 Jun 2011 15:03:29 +0200
From: Enrico Ferro <enrico.ferro@infocamere.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Meaning of LV -missing_<x>_<x> devices
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> > after the extention of a logical volume (mysqld1) a new "ghost"
> > logical volume appeared with a <missing> suffix:
> >
> > brw-rw---- 1 root disk 253, 38 Feb 15 20:53 vgmysql-mysqld1
> > brw-rw---- 1 root disk 253, 44 Jun 1 10:21
> > vgmysql-mysqld1-missing_4_0
>
> That means the lv was extended onto a PV that is no longer online.
> The missing device is the extents allocated on the missing PV.

Thank you Stuart for this information. We are now trying to
reproduce this strange behavior using virtual machines. We have got
the same error messages during the FS extension, but the -missing_
device did not appeared. We will try again using the SAN on a test
cluster (no virtual machines).

 > > Before performing this LV we partitioned and added a new LUN to the
> > existing vgmysql volume group (again, no errors reported).
> > We did not discovered this strange device immediately (the lvextend
> > command did not reported errors), only after resizing the file
> > system.
> > The ext2fs operation aborted and so we started with investigation.
>
> > So online resize of the FS failed, we unmounted the LV, extended
> > with
> > (apparent) success the filesystems and lived happy for a few days.
> > Only
> > while a deep corruption of the FS appeared. :-(
>
> You needed to do an fsck after the aborted filesystem resize. I'm
> suprised the fs resize didn't make you do so. If you did do the fsck,
> then there are serious problems with your new PV.

You are right: we did also the fsck before extending the unmounted LV, the check 
completed apparently without problems. Only after the catastrophe we discovered 
in the syslog lines like "buffer i/o errors"
during the umount-fscheck-extension-mount activity. It seems very strange that 
similar errors are not reported as failure by command lines tools like e2fsck, 
mount, etc... or causing a remount in read-only mode of the filesystem.

> > A reboot cleaned up the strange "missing" LV, it is no more present.
> > The point is: what is the meaning of -missing_* device? When are
> > they
> > generated (and why there are no warnings reported?)
>
> Apparently, the new PV went offline between lvextend and resize.

Thank you *very much* Stuart for your help, we are still investigating
but now we have a clue related to the storage...

Best regards,
-- 
Enrico
