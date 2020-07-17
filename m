Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA9E01067CF5
	for <linux-lvm@redhat.com>; Fri, 17 Jul 2020 07:04:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68AFD8007C8
	for <linux-lvm@redhat.com>; Fri, 17 Jul 2020 07:04:38 +0000 (UTC)
Received: from [10.3.12.2] ([185.31.247.5])
	(authenticated user h.kraal@exonet.nl)
	by kerio.exonet.nl (Kerio Connect 9.2.11) with ESMTPSA
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	for linux-lvm@redhat.com; Fri, 17 Jul 2020 09:04:33 +0200
From: Henk Kraal <h.kraal@exonet.nl>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Message-Id: <0B6E7FBE-CE2B-4A2F-8560-A47218C0B511@exonet.nl>
Date: Fri, 17 Jul 2020 09:04:32 +0200
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Failed to update old PV extension headers in VG
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi all,

I’ve run into an issue when trying to activate an LV which resides on a read-only loop device. When I run lvchange -a y <LV Path> I get the following error:

  Error writing device /dev/loop0p5 at 4096 length 512.
  bcache_invalidate: block (4, 0) still dirty
  Failed to write mda header to /dev/loop0p5 fd -1
  Failed to update old PV extension headers in VG recursor02-01-vg.
  Volume group "recursor02-01-vg" not found
  Cannot process volume group recursor02-01-vg

I’ve observed this issue when using LVM version 2.03.02 (Debian 10) to activate the LV. The volume I’m trying to mount comes from a host which has LVM version 2.02.168 which explains why headers are attempted to be updated.


The lvchange commando is part of a file restore procedure. The backup solution we are using (Xen Orchestra) creates chained .vhd files but is unable to access LVM volumes which reside across multiple PV’s. As restoring a full VM is often not required a solution was found in using vhdimount and losetup to access the data and get the required files from the backups.

# vhdimount 20200714T234001Z.vhd /mnt/20200714T234001Z
# losetup -P -r -f /mnt/20200714T234001Z/vhdi1
# lsblk /dev/loop0
NAME      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
loop0       7:0    0   42G  1 loop
|-loop0p1 259:0    0  243M  1 part
|-loop0p2 259:1    0    1K  1 part
`-loop0p5 259:2    0 41.8G  1 part


Given the error I would guess the source of this issue might be caused by the following commit: https://sourceware.org/git/?p=lvm2.git;a=commit;h=070c0d31ab3847240081e7593f959b03e716923d


Is there a way I can prevent the update of the extension headers when activating the LV?

With kind regards,

Henk
