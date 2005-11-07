Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA7MlkV32045
	for <linux-lvm@redhat.com>; Mon, 7 Nov 2005 17:47:46 -0500
Received: from oxtel.com ([195.219.3.158])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA7Mlci0031119
	for <linux-lvm@redhat.com>; Mon, 7 Nov 2005 17:47:39 -0500
Received: from 192.168.14.23 by oxtel.com ([10.96.1.33] running VPOP3) with
	ESMTP for <linux-lvm@redhat.com>; Mon, 7 Nov 2005 22:14:19 -0000
Message-ID: <436FD150.9080800@oxtel.com>
Date: Mon, 07 Nov 2005 22:12:32 +0000
From: Tom Robinson <tom.robinson@oxtel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgchange partial mount fails
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com


Hi,

I'm trying to do a partial mount of a VG in order to rescue data from it
(the last of the 8 PVs has died)

If I do vgchange -P -a y vg1
It says:

  Partial mode. Incomplete volume groups will be activated read-only.
  7 PV(s) found for VG vg1: expected 8
  Logical volume (lv1) contains an incomplete mapping table.
  7 PV(s) found for VG vg1: expected 8
  Logical volume (lv1) contains an incomplete mapping table.
  1 logical volume(s) in volume group "vg1" now active

Which looks like it might have worked, but in /dev/mapper I have:

crw-rw----  1 root root  10, 63 May 30 02:48 control
brw-------  1 root root 254,  0 Oct 25 13:20 vg1-lv1

But I can't mount vg1-lv1 (its ext2 - but it says "must specify fs type).

What is wrong? Have I misconfigured lvm / dm?
are there any lines I need in my config file?
Are there any tools I can run to get more info?

The array was built with LVM1 & 2.4.18,
I'm now using LVM2/DM under 2.6.11.10

Also, It looks like it has done something, because if I try
to deactivate it with "vgchange -P -a n vg1" I get:

  Partial mode. Incomplete volume groups will be activated read-only.
  7 PV(s) found for VG vg1: expected 8
  Logical volume (lv1) contains an incomplete mapping table.
  Can't deactivate volume group "vg1" with 1 open logical volume(s)

Any help greatly appreciated.
Kind regards,
 Tom
