Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6D99XV27118
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 05:09:33 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.206])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6D99Wj8029940
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 05:09:32 -0400
Received: by zproxy.gmail.com with SMTP id 13so77496nzp
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 02:09:27 -0700 (PDT)
Message-ID: <55c223960507130209319a9251@mail.gmail.com>
Date: Wed, 13 Jul 2005 10:09:27 +0100
From: Alex Owen <r.alex.owen@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] iSCSI lun resize
Reply-To: Alex Owen <r.alex.owen@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Igor, the trick is to partition the iSCSI device. I have not done this
with iSCSI but have with a Fibre Channel SAN.

You made sdb  a PV. LVM cannot resize a PV.
If you partitioned sdb and made sdb1 a PV then you could using iSCSI
resize sdb, then make a new partition from the new free space on
sdb... lets call this sdb5 (logical partition). Then pvcreate
/dev/sdb5 then vgextend your VG onto /dev/sdb5 then resize the LV then
grow the filesystem.

The problem may be that you need to reboot to get the kernel to
re-read the partition table...

Alternativly present a new iSCSI LUN lets call this sdc. Make a PV on
that and add that PV to the VG... then resize the LV then grow the
filesystem.

Regards
Alex Owen
