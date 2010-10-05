Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o95CYGqc025938
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 08:34:16 -0400
Received: from mail-yw0-f46.google.com (mail-yw0-f46.google.com
	[209.85.213.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o95CY1EO008029
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 08:34:01 -0400
Received: by ywg8 with SMTP id 8so193671ywg.33
	for <linux-lvm@redhat.com>; Tue, 05 Oct 2010 05:34:01 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 5 Oct 2010 18:04:01 +0530
Message-ID: <AANLkTikOF7nPG+MpxoVUyZWKc+maC7AFrC_z_z5Pb2D8@mail.gmail.com>
From: Tapas Mishra <mightydreams@gmail.com>
Subject: [linux-lvm] how to add an lvm entry in /dev/mapper to /dev/sda
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is what blkid shows on my system

/dev/sda1: UUID="6876c294-0c70-4b4e-87a2-636ea19e5ed6" TYPE="ext4"
/dev/sda5: UUID="5060205e-daa0-4635-8806-8f0b70623f78" TYPE="swap"
/dev/sda6: UUID="UMmBxP-upFM-H3S4-neHF-XYyo-gs3Q-rZsWMx" TYPE="LVM2_member"
/dev/mapper/nintendo-backupp1:
UUID="22b018f5-1512-4bbb-85e0-cc02e772d0ab" TYPE="ext4"
/dev/mapper/nintendo-backupp5:
UUID="aeb66e1a-a3c5-434c-9b73-309adf05d81b" TYPE="swap"
/dev/mapper/nintendo-backup1:
UUID="22b018f5-1512-4bbb-85e0-cc02e772d0ab" TYPE="ext4"
/dev/mapper/nintendo-backup5:
UUID="aeb66e1a-a3c5-434c-9b73-309adf05d81b" TYPE="swap"

I want all the devices in /dev/mapper as you see above to be in
/dev/sda6 because I have other LVMs which are in /dev/sda6 which blkid
does not show me.
