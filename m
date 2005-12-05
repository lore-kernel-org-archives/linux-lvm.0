Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB5MdaV15054
	for <linux-lvm@redhat.com>; Mon, 5 Dec 2005 17:39:36 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id jB5MdVfk030169
	for <linux-lvm@redhat.com>; Mon, 5 Dec 2005 17:39:31 -0500
Received: from pc8.trash.bin (pc8.trash.bin [192.168.4.8])
	by pc1.trash.bin (Postfix) with ESMTP id A17A042D9
	for <linux-lvm@redhat.com>; Mon,  5 Dec 2005 23:39:11 +0100 (CET)
Date: Mon, 5 Dec 2005 23:39:11 +0100
From: Marc-Jano Knopp <pub_ml_lvm@marc-jano.de>
Message-ID: <20051205223911.GE3123@mjk.myfqdn.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Which size for snapshot volume for a *safe* backup?
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

Hi!

I want to use LVM snapshots to create consistent backups.

Given an original logical volume of size "n" Bytes (or chunks or extents
or whatever you need for calculating it), how large in
Bytes/chunks/extents must the appropriate snapshot volume be in order to
retain the complete original logical volume in case the latter gets
completely overwritten?

For testing, I used a 320 k logical volume on a VG on a PV comprising of
a 1 MiB loop-back file of and created an equally sized snapshot volume.

While the snapshot worked perfectly with only overwriting half the
original volume, it bailed out when overwriting the whole original
volume; accessing the snapshot volume with "dd" after that
overwrite produced the following:

  Buffer I/O error on device dm-6, logical block 0
  (blocks 0-15)

So, obviously,

  snapshot volume size = original volume size

is not sufficient to hold a complete change of the original volume.


Btw.: There's a bug in "lvscan", it still displayed the snapshot
as being "ACTIVE", while in fact (at least that's what I concluded),
it was "INACTIVE" due to the lack of space, as shown using "lvdisplay".

Oh, and another small bug:

  For a file with 256 kiB bound to a loop device, pvcreate says
  correctly:

    /dev/loop/0: Size must exceed minimum of 1024 sectors.
    Failed to setup physical volume "/dev/loop/0"

  But for files smaller than that (like 512 bytes), it erronously
  prints:

    Device /dev/loop/0 not found


Best regards

  Marc-Jano
