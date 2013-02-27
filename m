Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1RGj8Tl018884
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2013 11:45:08 -0500
Received: from mx-fr.neopost-group.com (mx-fr.neopost-group.com
	[81.255.101.36])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id r1RGj4M0029738
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2013 11:45:06 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Wed, 27 Feb 2013 17:45:02 +0100
Message-ID: <0926B8B0C4D4424CAE1FCE69BD50CB2F0854C4EC@s02008.neopost.grp>
From: "MOLLE Thomas" <t.molle@neopost.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm]  raid1 Failed to activate new LV
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I'm trying to create a raid1 but when I want create my LV, I get the
following error : 
# device-mapper: reload ioctl on failed: Invalid argument
# Failed to activate new LV.

My command is : lvcreate --type raid1 -m 1 -L 55G -n lv0 vg0

Vgdisplay :
  --- Volume group ---
  VG Name               vg0
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  63
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               1.09 TiB
  PE Size               4.00 MiB
  Total PE              285588
  Alloc PE / Size       0 / 0
  Free  PE / Size       285588 / 1.09 TiB
  VG UUID               k7hTZD-QXLt-LO34-Fc5P-vk5T-zcOL-2JgZmr

  --- Physical volumes ---
  PV Name               /dev/mapper/mpatha
  PV UUID               ccouAp-S0ew-vAWv-nRSc-VgA3-bzFi-pfHDqA
  PV Status             allocatable
  Total PE / Free PE    142794 / 142794

  PV Name               /dev/mapper/mpathd
  PV UUID               v3nfWQ-w7eU-jrnk-PDMW-Rxnc-cMAe-qn4F5e
  PV Status             allocatable
  Total PE / Free PE    142794 / 142794

If I do not specify the type, it works well ( lvcreate  -m 1 -L 55G -n
lv0 vg0) but in this case it's a mirror and I need a raid1.

Any help is welcome :)

Regards,
Thomas

# lvm version
  LVM version:     2.02.95(2)-RHEL6 (2012-10-16)
  Library version: 1.02.74-RHEL6 (2012-10-16)
  Driver version:  4.20.0
