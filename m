Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n19HZW5M029406
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 12:35:32 -0500
Received: from Vail.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n19HZHOJ012682
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 12:35:17 -0500
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by Vail.esri.com (8.13.7+Sun/8.13.7) with ESMTP id n19HZFAi029818
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 09:35:16 -0800 (PST)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.1) with ESMTP id n19HZFQv001307
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 09:35:15 -0800
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n19HZF1F001305
	for linux-lvm@redhat.com; Mon, 9 Feb 2009 09:35:15 -0800
Date: Mon, 9 Feb 2009 09:35:15 -0800
From: Ray Van Dolson <rvandolson@esri.com>
Message-ID: <20090209173514.GA1244@esri.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Dead device and cleaning up LVM
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

I have a volgroup that was created on top of an iSCSI mounted block
device (target was stgt on RHEL 5.3 and initiator is the default iSCSI
initiator in RHEL 4.7).

Through a goof the target went offline and I tried shutting down the
initiator software before disabling the volume group on the initiator
with vgchange -an.  Now I'm left with a bit of a mess including iSCSI
initiator modules that won't completely unload.  I'm trying to avoid a
reboot and we have been theorizing that we somehow need to tell LVM to
"let go" of the remaining ghosts of the iSCSI device before things can
go back to normal.

The /dev/sdXX device is gone, but how can I convice LVM to quit trying
to use /dev/dm-2?  Can I edit the /etc/lvm/cache/.cache file and remove
entries there?

I'm seeing the following stuff in dmesg:

  scsi7 (0:1): rejecting I/O to dead device

And all the various pvscan/vgscan/lvscan tools show something similar
to the following:

  /dev/dm-2: read failed after 0 of 4096 at 4398038056960: Input/output error
  /dev/dm-2: read failed after 0 of 4096 at 4398038114304: Input/output error
  /dev/dm-2: read failed after 0 of 4096 at 0: Input/output error
  /dev/dm-2: read failed after 0 of 4096 at 4096: Input/output error
  /dev/dm-2: read failed after 0 of 4096 at 0: Input/output error

Anyone know how I can remove this device both from the system and from
LVM safely?  I can reboot, but saving that as a last resort if
possible.

Also, any best practices or suggestions for using iSCSI backed block
devices as volgroup members would be appreciated.  I'm worried about
LVM not recognizing the volume group of physical volumes correctly on
reboots...

Thanks,
Ray
