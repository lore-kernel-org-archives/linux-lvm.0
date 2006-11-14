Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAEN0dZl017057
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 18:00:39 -0500
Received: from mail.bdmcc-us.com (bdmcc-us.com [209.42.230.180])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAEN04iv030101
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 18:00:04 -0500
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by mail.bdmcc-us.com (Postfix) with ESMTP id 621A817FA97
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 18:00:04 -0500 (EST)
Received: from mail.bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 03427-01-4 for <linux-lvm@redhat.com>;
	Tue, 14 Nov 2006 18:00:03 -0500 (EST)
Date: Tue, 14 Nov 2006 18:00:03 -0500
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] How to restore a PV ??
Message-ID: <20061114230003.GA3401@bdmcc-us.com>
References: <452EEB6C.9040701@ibt.unam.mx> <4533ABCD.8030502@ibt.unam.mx>
	<01dbd6887fd9d439599e31bda27f3883@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01dbd6887fd9d439599e31bda27f3883@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I am having a similar problem with a drive that was created under LVM
version 1.  More questions below.


On Mon, Oct 16, 2006 at 02:20:14PM -0500, Jonathan E Brassow wrote:
> On each disk in the volume group is a record of the changes that have 
> been made to the volume group.  The last item in the record is the 
> current lvm meta-data.  If you can retrieve that, it is the same as 
> having the backup file which would normally be found in 
> /etc/lvm/backup.
> 
> You could use hexdump, but I find it much simpler to use 'less -f 
> <device>'.  You should see something like:
> 
> <crap>
> principal {
> ...
> }
> <comments>
> <crap>
> principal {
> ...
> }
> <comments>
> <crap>


Is this also true for LVM1?  I have examined the disk ( there are 5 LVs
on this disk, one elsewhere ( nowhere! ) ) and it doesn't seem to follow
this format.

If this is not true, is there any way to recover such a Volume Group?

Here is what vgscan and pvscan show:

[root@clachan media]# pvscan
  5 PV(s) found for VG vg_system: expected 6
  Logical volume (lvol4) contains an incomplete mapping table.
  PV segment VG free_count mismatch: 1381 != 2572
  PV segment VG extent_count mismatch: 1417 != 2608
  Internal error: PV segments corrupted in vg_system.
[root@clachan media]# vgscan
  Reading all physical volumes.  This may take a while...
  5 PV(s) found for VG vg_system: expected 6
  5 PV(s) found for VG vg_system: expected 6
  Volume group "vg_system" not found
[root@clachan media]# vgchange -a y --partial vg_system
  Partial mode. Incomplete volume groups will be activated read-only.
  5 PV(s) found for VG vg_system: expected 6
  Logical volume (lvol4) contains an incomplete mapping table.
  PV segment VG free_count mismatch: 1381 != 2572
  PV segment VG extent_count mismatch: 1417 != 2608
  Internal error: PV segments corrupted in vg_system.
  Unable to find volume group "vg_system"


I do have several copies of the config file, also on this drive ( in a
real ext2 partition! ).  Could I just edit the file to remove lvol4 (
with 250 segments! ) and do a vgcfgrestore from an LVM2 system?


Thank you,
Brian
