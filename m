Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iATI6Lr04865
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2004 13:06:21 -0500
Received: from www.austinlogistics.com (mail.austinlogistics.com
	[69.150.203.234])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iATI6FVo001681
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2004 13:06:16 -0500
Message-ID: <OF44682A09.C6D944AC-ON86256F5B.005FCD50-86256F5B.00636C35@austinlogistics.com>
From: Jetkins@austinlogistics.com
Date: Mon, 29 Nov 2004 12:06:03 -0600
MIME-Version: 1.0
Subject: [linux-lvm] Reusing a physical volume
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi folks, me again.

You may recall I asked a couple of weeks ago about the possibility of
expanding a PV on a hardware RAID.  Well, having determined that there was
no way to expand it in situ, I went to Plan B and attached an external
storage enclosure so that I could shuffle the data off of the existing PV
and then reuse the internal storage.

I pvcreate'd a second PV on the external storage (/dev/sdc1) and pvmove'd
everything from /dev/sdb, then vgreduce'd the original volume from the VG.
I now have the following:

      # pvscan
      pvscan -- reading all physical volumes (this may take a while...)
      pvscan -- inactive PV "/dev/sdb"  is in no VG  [819.73 GB]
      pvscan -- ACTIVE   PV "/dev/sdc1" of VG "vg01" [956.31 GB / 136.62 GB
free]
      pvscan -- total: 2 [1.73 TB] / in use: 1 [956.35 GB] / in no VG: 1
[819.73 GB]

      # pvdisplay /dev/sdb
      pvdisplay -- "/dev/sdb" is a new physical volume of 819.73 GB

My dilemma is what to do next.  The HOWTO simply says "The drive can now be
either physically removed when the machine is next powered down or
reallocated to other users."  I can "remove the drive" by blowing away the
first RAID volume at the next reboot, but won't that move /dev/sdc1 to
/dev/sdb1?  How does LVM handle that?

I'm also puzzled how to get LVM to forget about the inactive PV on
/dev/sdb.  Will it automatically remove it from the configuration if the
drive is removed?  I can't seem to find a "pvremove" or "pvdelete" command.
(I'm using LVM 1).

Any guidance and assistance gratefully accepted,

Jon Etkins
IT Administration & Support
Austin Logistics, Inc
ph:  (512) 651-5641
fax: (512) 329-5625
