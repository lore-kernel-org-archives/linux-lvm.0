Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l06GAvl8003001
	for <linux-lvm@redhat.com>; Sat, 6 Jan 2007 11:10:57 -0500
Received: from kallisti.us (kallisti.us [67.59.168.233])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l06GAugr010837
	for <linux-lvm@redhat.com>; Sat, 6 Jan 2007 11:10:56 -0500
Received: from eris.kallisti.us (ross@localhost.localdomain [127.0.0.1])
	by kallisti.us (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l06GAoPa018674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Sat, 6 Jan 2007 11:10:50 -0500
Received: (from ross@localhost)
	by eris.kallisti.us (8.13.4/8.13.4/Submit) id l06GAnMg018673
	for linux-lvm@redhat.com; Sat, 6 Jan 2007 11:10:49 -0500
From: Ross Vandegrift <ross@kallisti.us>
Date: Sat, 6 Jan 2007 11:10:48 -0500
Message-ID: <20070106161048.GA18619@kallisti.us>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] pvmove ioctl errors
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

Hi everyone,

Judging by the archives, a few others have seen this issue, but I'm
getting errors when I try to pvmove off a PV to remove it from my VG:

root@turalyon:~# pvmove -v /dev/hda2
    Wiping cache of LVM-capable devices
    Finding volume group "vg0"
    Archiving volume group "vg0" metadata (seqno 16).
    Creating logical volume pvmove0
    Moving 33769 extents of logical volume vg0/home
    Found volume group "vg0"
    Creating vg0-home
    Loading vg0-home table
    Resuming vg0-home (253:0)
    Updating volume group metadata
    Creating volume group backup "/etc/lvm/backup/vg0" (seqno 17).
    Found volume group "vg0"
    Found volume group "vg0"
    Suspending vg0-home (253:0)
    Found volume group "vg0"
    Creating vg0-pvmove0
    Loading vg0-pvmove0 table
  device-mapper: reload ioctl failed: Invalid argument
  ABORTING: Temporary mirror activation failed.  Run pvmove --abort.
    Found volume group "vg0"
    Loading vg0-pvmove0 table
  device-mapper: reload ioctl failed: Invalid argument
    Loading vg0-home table
  device-mapper: reload ioctl failed: Invalid argument
root@turalyon:~# 


I noticed one post that indicated pvmove requires snapshot support,
which I don't normally use.  Before running this pvmove, I modprobed
all of the dm-* modules just to make sure.

The box in question is running Ubuntu Edgy Eft on i386.  I've been
able to recover just fine from this by rebooting, running pvmove
--abort, and then rebooting again.

Obviously this prevents me from removing the volume though.  Thanks in
advance for any help!


-- 
Ross Vandegrift
ross@kallisti.us

"The good Christian should beware of mathematicians, and all those who
make empty prophecies. The danger already exists that the mathematicians
have made a covenant with the devil to darken the spirit and to confine
man in the bonds of Hell."
	--St. Augustine, De Genesi ad Litteram, Book II, xviii, 37
