From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010311816.e9VIG6d09539@webber.adilger.net>
Subject: Re: [linux-lvm] Exporting VG
In-Reply-To: <39FF049B.F7651520@imim.es> "from Xavi Fustero at Oct 31, 2000 06:42:52
 pm"
Date: Tue, 31 Oct 2000 11:16:06 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xavi Fustero <xfustero@imim.es>
Cc: linux-lvm@msede.com

Xavi Benavent writes:
> I have a cluster with 4 nodes. 3 of them has several disks which I need
> to see as an only one disk. After a really strong work I got LVM working
> on all the 3 machines !!!! i created three Volume Groups, one for
> machine. Now, I would like to export them to get only one virtual group.

When you do vgexport, this does not do anything like NFS export (does NOT
allow network access to the VG).  It allows you to physically move the
disks to another machine.

> Thats my 3 machines: N1, N2 and N3.  From N2 I try to export my VG to N1.
> N2> vgchange -a n  'vg_name'
> N2> vgexport 'vg_name'
> 
> From N1 I type,
> N1>vgimport 'vg_name'  /dev/sda3   (this vg is made from /dev/sda3 )

Are the disks connected via shared SCSI or Fibre Channel?  Is /dev/sda3
the disk on the local machine?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
