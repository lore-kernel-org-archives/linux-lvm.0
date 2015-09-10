Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8ABTLwT018365
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2015 07:29:21 -0400
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mx1.redhat.com (Postfix) with ESMTPS id 254CF91C11
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2015 11:29:21 +0000 (UTC)
Received: by vkhf67 with SMTP id f67so700310vkh.1
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2015 04:29:20 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 10 Sep 2015 11:30:27 +0200
Message-ID: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
From: Stefan Ring <stefanrin@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Strange dm-cache activity at startup
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

I have a fairly simple dm-cache setup with one PV on an HDD partition
as the origin block device, and the cache LVs live on a partition on
an SSD. The cache is in writethrough mode. Since I have no prior
experience with this, I basically followed the lvmcache man page when
creating this setup a few months ago.

Every morning at startup, the system immediately starts prolonged
activity on the devices involved in the cache setup. iostat shows
reading activity from the cache device and constant write activity on
the HDD. The HDD is fully utilized, and this goes on for more than an
hour. After that, everything goes into what I would consider the
"normal" state with only the IO activity going on that I actively
throw at it.

Is this normal/expected? What does it do? Why does it write back huge
amounts of data to the HDD after each system start?

Kernel is currently 3.17.8-200.fc20.x86_64 (Fedora)
Userland has been upgraded to fc22 meanwhile

origin:
└─sda6                          8:6    0 894.6G  0 part
  └─vg_zfs-lv_zfsdisk_corig   253:2    0 894.6G  0 lvm
    └─vg_zfs-lv_zfsdisk       253:3    0 894.6G  0 lvm

cache:
└─sdb5                          8:21   0 233.7G  0 part
  ├─vg_zfs-lv_cachedata_cdata 253:0    0 213.1G  0 lvm
  │ └─vg_zfs-lv_zfsdisk       253:3    0 894.6G  0 lvm
  └─vg_zfs-lv_cachedata_cmeta 253:1    0   9.4G  0 lvm
    └─vg_zfs-lv_zfsdisk       253:3    0 894.6G  0 lvm

$ sudo dmsetup ls --tree
vg_zfs-lv_zfsdisk (253:3)
 ├─vg_zfs-lv_zfsdisk_corig (253:2)
 │  └─ (8:6)
 ├─vg_zfs-lv_cachedata_cdata (253:0)
 │  └─ (8:21)
 └─vg_zfs-lv_cachedata_cmeta (253:1)
    └─ (8:21)

$ sudo dmsetup table vg_zfs-lv_zfsdisk
0 1876041728 cache 253:1 253:0 253:2 128 1 writethrough mq 0
