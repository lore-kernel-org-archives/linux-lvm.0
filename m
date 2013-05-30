Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4UL2eLk009646
	for <linux-lvm@redhat.com>; Thu, 30 May 2013 17:02:40 -0400
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4UL2dcF018268
	for <linux-lvm@redhat.com>; Thu, 30 May 2013 17:02:39 -0400
Received: by mail-pb0-f51.google.com with SMTP id jt11so1024786pbb.24
	for <linux-lvm@redhat.com>; Thu, 30 May 2013 14:02:39 -0700 (PDT)
Received: from [10.10.102.70] (207.47.42.180.static.nextweb.net.
	[207.47.42.180])
	by mx.google.com with ESMTPSA id v7sm43395189pbq.32.2013.05.30.14.02.38
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 14:02:38 -0700 (PDT)
Message-ID: <51A7BE6D.3090609@gmail.com>
Date: Thu, 30 May 2013 14:02:37 -0700
From: Christian Lahti <clahti@gmail.com>
MIME-Version: 1.0
References: <51A79EEE.6020308@gmail.com>
In-Reply-To: <51A79EEE.6020308@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] file-based locking initialization failed after pvresize
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

Hello all:

I have a VMWare virtual CentOS 6 server with the following disk layout:

/dev/sda 15GB
/dev/sdb 100GB

Standard CentOS LVM setup

on sda1
/dev/vg_centos6/lv_root mounted on /
/dev/vg_centos6/lv_swap

on sdb1
/dev/vg_centos6/lv_var mounted on /var

I was starting to run low on disk space for /var, so I shut down the
machine gracefully, extended the disk in VMWare to 250G and rebooted in
single user mode. I then ran the following two commands:

pvresize --setphysicalvolumesize 250G /dev/sdb1
lvresize -L250G /dev/vg_centos6/lv_var

I then rebooted expecting the /var to now be 250G instead of 100G. What
I got was:

No such file or directory trying to open /dev/vg_centos6/lv_var

After dropping to a maintenance shell I could not run any pv* or lv*
commands, always resulting in the error:

File-based locking initialization failed

After Googling forever I found some lv* and pv* commands take
--ignorelockingfailure as a parameter, so now I can "see" the pv and lv
information but I do not know how to recover this partition:

pvdisplay --ignorelockingfailure /dev/sdb1
File-based locking initialization failed
--- Physical volume ---
PV Name /dev/sdb1
VG Name vg_centos6
PV Size 250 GiB / not useable 3.00 MiB
Allocatable yes
PE Size 4.00 MiB
Total PE 63999
Free PE 25599
Allocated PE 38400

lvdisplay --ignorelockingfailure /dev/vg_centos6/lv_var
File-based locking initialization failed
--- Logical volume ---
LV Path /dev/vg_centos6/lv_var
LV Name lv_var
VG Name vg_centos6
LV Write Access read/write
LV Status suspended
# open 0
LV Size 150.00 GiB
Current LE 38400
Segments 1
Allocation inherit
Read ahead sectors auto
- currently set to 256
Block device 253:2

I cannot mount this, I cannot fsck, /dev/mapper/vg_centos6/lv_var does
not even get created. This is a critical server, can anyone please tell
me how to reverse this or at least recover the data?

Thanks!

/Christian
