Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAEMx0r25928
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 17:59:00 -0500
Received: from mail.o2w.nl (postfix@mail.o2w.nl [213.227.141.209])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAEMwxYM003326
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 17:58:59 -0500
Date: Sun, 14 Nov 2004 23:58:53 +0100
From: Jelle Herold <wires@defekt.nl>
Message-ID: <20041114225853.GB20425@hotwire.nl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] recover lost VG (VG data differs between PVs)
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

Help! :)

I think I messed up my VG trying to recover it... :( this is what I did.

First, I believe grub erased the first sector of a whole-disk PV
(/dev/hde). luckily I had a lvm1 backup in /etc/lvmconf. Using (lvm1's)
pvcreate and vgcfgrestore I managed to get my VG back online. Good.

Then I wanted to move the data from the PV on /dev/hde to a new PV, so I
created a new PV (/dev/hdf3) and used vgextend to extend the VG. Without
thinking I rebooted the computer and worse: I managed to overwrite that
first sectore of /dev/hde again! This time I don't have any backups of
the new configuration (still have the old ones), but I didn't move the
PV or resized the fs on the vg.

I removed the newly added VG and using vgcfgrestore to recover the
metadata on /dev/hde. but now vgdisplay tells me

 VG data differs between PVs /dev/hde and /dev/hdf3
 Volume group "datavg" doesn't exist

Any ideas on how to proceed next are highly appreciated...

Jelle
