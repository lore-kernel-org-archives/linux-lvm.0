Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBA3ZNqr013202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 9 Dec 2016 22:35:23 -0500
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61A3FC05678E
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2016 03:35:22 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id d2so5949983pfd.0
	for <linux-lvm@redhat.com>; Fri, 09 Dec 2016 19:35:22 -0800 (PST)
Received: from [192.168.1.2] (70-36-204-232.dsl.static.fusionbroadband.com.
	[70.36.204.232]) by smtp.googlemail.com with ESMTPSA id
	s5sm60892279pgj.19.2016.12.09.19.35.20 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Dec 2016 19:35:20 -0800 (PST)
From: "John L. Poole" <jlpoole56@gmail.com>
Message-ID: <efb9fde8-8120-7098-1784-b9a72e6987f7@gmail.com>
Date: Fri, 9 Dec 2016 19:35:24 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate: vfat signature detected on /dev/sda5
Reply-To: jlpoole56@gmail.com,
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

I have a new 4TB disk on a new server which I'm installing Xen on.
I've always intended that I use whatever small partitions to get a 
system up and running
and then dedicate the remaining balance of the disk to LVM.

After much hassle I finally got my Xen instance up on this EUFI based unit,
and I created a new partition, /dev/sda5, using fsdisk.

When I tried to create a new volume, I received a warning about
a vfat signature.  I aborted.

Note: /dev/sda2 is a VFAT system which is required by EFI.

I had not previously create sda5, I just created sda1 - sda4 until
I finally had a dom0 server operating.

Here's the layout of the disk:

Device        Start        End    Sectors  Size Type
/dev/sda1      2048       6143       4096    2M BIOS boot
/dev/sda2      6144     268287     262144  128M EFI System
/dev/sda3    268288    1316863    1048576  512M Linux filesystem
/dev/sda4   1316864   42272767   40955904 19.5G Linux filesystem
/dev/sda5  42272768 7814037134 7771764367  3.6T Linux LVM

Here's my attempt to create a physical volume:

    zeta jlpoole # pvcreate /dev/sda5
    WARNING: vfat signature detected on /dev/sda5 at offset 54. Wipe it? 
[y/n]: n
      Aborted wiping of vfat.
      1 existing signature left on the device.
      Aborting pvcreate on /dev/sda5.
    zeta jlpoole #

Is the warning something I need to be concerned about when
creating a physical volume on /dev/sda5?  I'm wondering if it was 
looking at another
partition and bubbling up just as a precaution.

Thank you,

John
