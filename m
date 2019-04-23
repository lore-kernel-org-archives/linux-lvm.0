Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF88F60C62
	for <linux-lvm@redhat.com>; Tue, 23 Apr 2019 23:06:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61BFB8124B
	for <linux-lvm@redhat.com>; Tue, 23 Apr 2019 23:06:39 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id r186so3258764wmf.1
	for <linux-lvm@redhat.com>; Tue, 23 Apr 2019 16:06:39 -0700 (PDT)
Received: from mail.onse.fi ([109.204.156.230])
	by smtp.gmail.com with ESMTPSA id w10sm710212wmi.43.2019.04.23.16.06.36
	for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Apr 2019 16:06:36 -0700 (PDT)
Received: from mail.onse.fi (delta.onse.fi [127.0.0.1])
	by mail.onse.fi (Postfix) with ESMTP id 93C5F40297
	for <linux-lvm@redhat.com>; Wed, 24 Apr 2019 02:06:35 +0300 (EEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 24 Apr 2019 02:06:35 +0300
From: Anssi Hannula <anssi.hannula@iki.fi>
Message-ID: <eacb8d5110c2c658fa83dbd589fd6fbf@iki.fi>
Subject: [linux-lvm] Internal error: Referenced LV pvmove0 not listed in VG
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi all,

I'm getting the following error when trying to run a pvmove command:

# pvmove -v /dev/md0:18122768-19076597
     Cluster mirror log daemon not included in build.
     Archiving volume group "delta" metadata (seqno 72).
     Creating logical volume pvmove0
     activation/volume_list configuration setting not defined: Checking 
only host tags for delta/home_r.
     Moving 167398 extents of logical volume delta/home_r.
     activation/volume_list configuration setting not defined: Checking 
only host tags for delta/data_r.
   Internal error: Referenced LV pvmove0 not listed in VG delta.

This is with git master, but I see the same on 2.02.177.

The PV in question looks like following:

# pvdisplay /dev/md0 -m
   --- Physical volume ---
   PV Name               /dev/md0
   VG Name               delta
   PV Size               72,77 TiB / not usable 3,38 MiB
   Allocatable           yes (but full)
   PE Size               4,00 MiB
   Total PE              19076598
   Free PE               0
   Allocated PE          19076598
   PV UUID               P4jDYr-BjDD-3EPk-AMhp-JC1F-1fi2-DecHRl

   --- Physical Segments ---
   Physical extent 0 to 655359:
     Logical volume      /dev/delta/home_r
     Logical extents     0 to 655359
   Physical extent 655360 to 917503:
     Logical volume      /dev/delta/data_r
     Logical extents     16120362 to 16382505
   Physical extent 917504 to 17037865:
     Logical volume      /dev/delta/data_r
     Logical extents     0 to 16120361
   Physical extent 17037866 to 17431081:
     Logical volume      /dev/delta/home_r
     Logical extents     655360 to 1048575
   Physical extent 17431082 to 18909199:
     Logical volume      /dev/delta/data_r
     Logical extents     16382506 to 17860623
   Physical extent 18909200 to 19076597:
     Logical volume      /dev/delta/home_r
     Logical extents     1048576 to 1215973


Full log: http://onse.fi/pvmove/delta-pvmove.txt

vgcfgbackup: http://onse.fi/pvmove/delta-backup.txt


-- 
Anssi Hannula
