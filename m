Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3FFcuj04252
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 11:38:56 -0400
Received: from www.okdhs.org (s99eagle01.okdhs.org [204.87.68.21])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i3FFct87016560
	for <linux-lvm@redhat.com>; Thu, 15 Apr 2004 11:38:55 -0400
Message-ID: <9BBB7C9EFEF1874BAC4DC204E867EFAF0256133C@s99mail06>
From: "Little, Chris" <Chris.Little@okdhs.org>
Subject: RE: [linux-lvm] Bug when creating snapshots on lvm on s390
Date: Thu, 15 Apr 2004 10:40:15 -0500
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

This is a known issue.  I have a bug open with IBM who in turn has opened
one with SUSE :

---------------

This is a short update from SuSE LVL3 folks.

his is a short status about the work that has been done to fix this bug.

Since the bug has been posted, different SuSE developers have been working
on that.

They have found a way to track the problem:
"by simply deleting and rewriting 200 MB to the first original volume after
creating the backups caused corruption on the second original volume."

<citat> of one developer

I have finally been able to reproduce it, on s390l2.

I have set up LVM similar to the setup described in the bug report (three
volume groups, several striped volumes on vg01), created two ext3
filesystems
(/dev/vg01/lvol[12]), filled them up with several copies of /opt/kde3, then
made backups (/dev/vg01/backup[12]) with the filesystems mounted as
described
above, then mounted those backups read-only.

No corruption on any volume so far.

After deleting some kde3 copies on /dev/vg01/lvol1 and copying them back
again
with different names, seemingly random corruption reared its ugly head on
_all_ volumes. Try "for i in /mnt/*/? /mnt/*/?? /mnt/*/??? ; do diff -r
/opt/
kde3 $i ; done" (ignore the dangling symlinks). /var/log/messages may be
worth
a look as well.

</citat>

Afterwards we have contacted IBM Boeblingen, and they have been also able to
reproduce the issue in the vanilla LVM-code.  Even in version 1.0.7.

We tried to reproduce it on x86, but it was not possible, on PPC we do not
know yet.

Summary:

The corruption we see on S/390 can be caused anywhere in the kernel,
starting
from the memory subsystem to the iobuf on S/390 (suspection of Andrea
Arcangeli) to the buffer header code within LVM(suspection of Martin
Schwidefsky) to the remapping of blocks within LVM-snapshot specific code
paths(and there are many) inside LVM including LV locking issues and
list-handling for the exception table which seems to be the instance where
the
LVM code works out the snapshot-specific block mapping.

By next week, you will hear from me; our developers are intensively working
on that issue.

With kind regards, 

Thomas Fenton
Staff Software Engineer
IBM Integrated Technical Services
Linux and NUMA-Q support
> -----Original Message-----
> From: Ihno Krumreich [mailto:ihno@suse.de]
> Sent: Thursday, April 15, 2004 5:42 AM
> To: linux-lvm@redhat.com; Mauelshagen@redhat.com
> Cc: Bernhard Kaindl; Uwe Drechsel; Ulrich Hecht
> Subject: [linux-lvm] Bug when creating snapshots on lvm on s390
> 
> 
> Hi,
> 
> we have a filecorruption on a LVM-Volume when a
> snapshot is created. This Problem seem to occur only
> on s390 (31-Bit mode).
> 
> are there any known issues when using snapshots on lvm on s390?
> 
> regards 
> 
> Ihno Krumreich
> 
> How to create the bug:
> 
> - Create three volume groups, which are striped over multiple
>   physical disks (9 x 2GByte).
> - use the second volume group to create a logical volume
> - create a file system on this LV (problem occurs with ext2, 
> ext3, reiserfs)
>   and put data in the filesystem
> - create a snapshot of this LVOL
> - the data on the original LVOL are corruptet
> 
> - It is important that the filesystem is mounted read/write
>   If it is only mounted readonly and the snapshot is
>   created the corruption does not occur.
>   
> 
> Machine setup:
> 
> S390 31-Bit with SUSE linux Enterprise Server 8 Service Pack 3
> Machine has 2 Gbyte RAM and 9 Model-3 DASD for the LVM.
> 
> SLES8 has LVM Version 1.0.5 with IBM patches for multipath support.
> 
> To exclude that Kernel modification from SUSE/IBM cause the
> problem IBM has testet it with the vanilla kernel 2.4.21 and
> LVM Version 1.0.7 and the problem is the same.
> 
> At SUSE we tried to reproduce the problem on x86, but without
> success (kernel 2.4.21 with lvm 1.0.5).
> 
> In the attached tar-ball is a file which showes the corruption
> starting at byte 0xc000 with a length of 0x1000 Bytes.
> 
> 
> -- 
> Best regards/Mit freundlichen Gr��en
> 
> Ihno Krumreich
> 
> "Never trust a computer you can lift."
> --
> Ihno Krumreich            ihno@suse.de
> SuSE Linux AG             Projectmanager S390 & zSeries
> Maxfeldstr. 5             +49-911-74053-439
> D-90409 N�rnberg          http://www.suse.de
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
