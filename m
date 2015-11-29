Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tATNADkf003438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2015 18:10:13 -0500
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mx1.redhat.com (Postfix) with ESMTPS id EC578C0D2234
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2015 23:10:11 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so164220274pad.1
	for <linux-lvm@redhat.com>; Sun, 29 Nov 2015 15:10:11 -0800 (PST)
Received: from deskEdgar.presence-group.net
	(99-7-172-215.lightspeed.snmtca.sbcglobal.net. [99.7.172.215])
	by smtp.gmail.com with ESMTPSA id 7sm46743896pfb.78.2015.11.29.15.10.10
	for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Nov 2015 15:10:10 -0800 (PST)
From: PGNet Dev <pgnet.dev@gmail.com>
Message-ID: <565B85D1.1080901@gmail.com>
Date: Sun, 29 Nov 2015 15:10:09 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] errors on lvcreate snapshot : "device-mapper: remove
 ioctl on (...) failed: Device or resource busy";
 still unresolved old issue, or new?
Reply-To: PGNet Dev <pgnet.dev@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I run

	lvs --version
		LVM version:     2.02.120(2) (2015-05-15)
		Library version: 1.03.01 (2015-05-15)
		Driver version:  4.33.0

on OpenSUSE Leap

	lsb_release -rd
		Description:    openSUSE Leap 42.1 (x86_64)
		Release:        42.1

Exec of LV snapshots of active LVs reports ERRORs

	lvs
		LV      VG      Attr       LSize   Pool Origin Data%  Meta%  Move Log 
Cpy%Sync Convert
		LV01    VG0     -wi-ao---- 352.00m 

		LV02    VG0     -wi-ao----   5.00g 

		LV03    VG0     -wi-ao---- 512.00m
	lvcreate -L 352M -s -n SNAP01 /dev/VG0/LV01
		device-mapper: remove ioctl on (254:3) failed: Device or resource busy
		Logical volume "SNAP01" created.
	lvcreate -L 512M -s -n SNAP03 /dev/VG0/LV03
		device-mapper: remove ioctl on (254:15) failed: Device or resource busy
		Logical volume "SNAP03" created.
	lvcreate -L 5G   -s -n SNAP02 /dev/VG0/LV02
		device-mapper: remove ioctl on (254:18) failed: Device or resource busy
		Logical volume "SNAP02" created.

similar to similar errors referenced in BUG

	Bug 927437 - "device-mapper: remove ioctl on failed" error when 
creating thin pool volume
	https://bugzilla.redhat.com/show_bug.cgi?id=927437#c10

but still creates the snapshot LVs

	lvs | grep SNAP
		LV          VG      Attr       LSize   Pool Origin Data%  Meta%  Move 
Log Cpy%Sync Convert
		SNAP01      VG0     swi-a-s--- 352.00m        LV01 0.00 

		SNAP02      VG0     swi-a-s---   5.00g        LV02 0.01 

		SNAP03      VG0     swi-a-s--- 512.00m        LV03 0.00 


Are the "device-mapper: remove ioctl on (254:18) failed" still the 
same/similar issue  as #927437, new upstream issue, or distro-specific?
