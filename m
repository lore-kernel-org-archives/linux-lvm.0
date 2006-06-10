Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5AFjE17030403
	for <linux-lvm@redhat.com>; Sat, 10 Jun 2006 11:45:14 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5AFj7t4032590
	for <linux-lvm@redhat.com>; Sat, 10 Jun 2006 11:45:08 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Fp5du-000270-QE
	for linux-lvm@redhat.com; Sat, 10 Jun 2006 17:44:55 +0200
Received: from 221.174.csx.com ([216.231.221.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 10 Jun 2006 17:44:54 +0200
Received: from thomas by 221.174.csx.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 10 Jun 2006 17:44:54 +0200
From: Thomas <thomas@meiwing.com>
Date: Sat, 10 Jun 2006 23:44:39 +0800
Message-ID: <e6epd8$qi7$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] How to format a new hard disk using in LVM2 ?
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

Given:
hdc is a 80G hard disk.
Only use 20G and mount as backup
===============================
Steps:
# Phyical Volume creation of hdc
pvcreate /dev/hdc

# Volume group creation as name VolGroup01
vgcreate VolGroup01 /dev/hdc

# Logical Volume Group creation as name LogVol00
lvcreate -n LogVol00 --size 20G VolGroup01

# Format as EXT3
mke2fs -j /dev/VolGroup01/LogVol00

# Mount as backup
mkdir /backup
mount /dev/VolGroup01/LogVol00 /backup

# Check result with
df -h
pvdisplay
vgdisplay
lvdisplay

Just my two cents.
