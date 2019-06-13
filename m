Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2CB41001B0F
	for <linux-lvm@redhat.com>; Thu, 13 Jun 2019 09:46:17 +0000 (UTC)
Received: from m4a0040g.houston.softwaregrp.com
	(m4a0040g.houston.softwaregrp.com [15.124.2.86])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C60B30C0DED
	for <linux-lvm@redhat.com>; Thu, 13 Jun 2019 09:45:59 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0040g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Thu, 13 Jun 2019 09:46:14 +0000
From: Heming Zhao <heming.zhao@suse.com>
Date: Thu, 13 Jun 2019 07:41:54 +0000
Message-ID: <30658b04-07ec-0b28-a6ad-3d78a106010c@suse.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4507E6C789376C4A880AE6770F300D8E@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Question about filter behavior on pvcreate /dev/md0
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello List,

I created a md device, and used pvcreate to format it.
But the pvcreate was failed with filter rules.
the filter in /etc/lvm/lvm.conf:
```
filter = [ "r|/dev/.*/by-path/.*|", "r|/dev/.*/by-id/.*|", 
"r|/dev/fd.*|", "r|/dev/cdrom|" ]
```
if I remove the filter, pvcreate will be successful. why?

steps:
```
# rpm -qa | grep lvm2
lvm2-2.02.180-10.el7_6.7.x86_64
lvm2-libs-2.02.180-10.el7_6.7.x86_64
# dd if=/dev/zero of=/dev/sda bs=1M
   ... ...
# dd if=/dev/zero of=/dev/sdb bs=1M
   ... ...
# mdadm -C /dev/md0 -l 0 -n 2 -a yes /dev/sda /dev/sdb
mdadm: Defaulting to version 1.2 metadata
mdadm: array /dev/md0 started
# lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sda      8:0    0  256M  0 disk
└─md0    9:0    0  508M  0 raid0
sdb      8:16   0  256M  0 disk
└─md0    9:0    0  508M  0 raid0
vda    253:0    0   40G  0 disk
├─vda1 253:1    0    1G  0 part  /boot
├─vda2 253:2    0   38G  0 part  /
└─vda3 253:3    0    1G  0 part  [SWAP]
# pvcreate /dev/md0
   Device /dev/md0 excluded by a filter.
```

Thanks
zhm
