Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s6JBPPB1027041
	for <linux-lvm@redhat.com>; Sat, 19 Jul 2014 07:25:25 -0400
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s6JBPOV0003639
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sat, 19 Jul 2014 07:25:24 -0400
Received: by mail-oa0-f45.google.com with SMTP id i7so4980632oag.32
	for <linux-lvm@redhat.com>; Sat, 19 Jul 2014 04:25:23 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 19 Jul 2014 04:25:23 -0700
Message-ID: <CACE2HEC7VQsDEFcHp=SVppB29AjHML7h8jvooRYccWc7eofd3g@mail.gmail.com>
From: John Sheu <john.sheu@gmail.com>
Subject: [linux-lvm] LVM2 and Read-Only Backing Devices
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Summary: should LVM2 report a VG as read-only if constructed from PVs
on read-only devices?

I've got a block device (an md-raid array actually) that is, for other
reasons, being assembled as read-only right now.  There are two
relevant filesystems on it:

* an ext4 FS directly on a partition on the device
* an ext4 FS on a LVM2 VG created from a PV on another partition on the device

When I mount the ext4 FS from the raw partition, mount sees that the
device is read-only and mounts it read-only.  So far so good.

When I mount the ext4 FS from the LVM2 VG, mount sees the VG as
read-write.  Indeed, vgdisplay shows that the VG is marked as
read-write.  This causes mount to try to mount the filesystem in
read-write mode.  The first thing that this does it cause a journal
replay which fails a few writes at the kernel block layer, resulting
in some scary-looking kernel spew about lost writes before the FS is
remounted in read-only mode.

My question is: is the behavior of the VG being marked read-write in
this case expected behavior?  If not, what's the most expedient way to
fix this?  I'd like to see that a VG that includes one or more PVs
located on read-only devices be automatically marked read-only,
instead.

Thanks,
-John Sheu
