Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C89E30012A7
	for <linux-lvm@redhat.com>; Tue, 17 Jul 2018 07:50:45 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35B9B4E918
	for <linux-lvm@redhat.com>; Tue, 17 Jul 2018 07:50:44 +0000 (UTC)
Message-Id: <5B4D9FC7020000F900029F14@prv1-mh.provo.novell.com>
Date: Tue, 17 Jul 2018 01:50:31 -0600
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Subject: [linux-lvm] vgchange command can not activate mirrored LV in VG
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

Hello List,

I encountered a problem with the source code 2.02.178,  
vgchange command did not activate mirrored LV in VG, the error messages were as below,

NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sr0     11:0    1 1024M  0 rom
vda    254:0    0   40G  0 disk
├─vda1 254:1    0    4G  0 part [SWAP]
├─vda2 254:2    0 23.6G  0 part /
└─vda3 254:3    0 12.4G  0 part /home
vdb    254:16   0   40G  0 disk
vdc    254:32   0   40G  0 disk
tb0307-nd1:~ # vgchange -aay cluster-vg2
  Error locking on node a431337: Shared cluster mirrors are not available. <<= here
  2 logical volume(s) in volume group "cluster-vg2" now active
tb0307-nd1:~ # lsblk
NAME                     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sr0                       11:0    1 1024M  0 rom
vda                      254:0    0   40G  0 disk
├─vda1                   254:1    0    4G  0 part [SWAP]
├─vda2                   254:2    0 23.6G  0 part /
└─vda3                   254:3    0 12.4G  0 part /home
vdb                      254:16   0   40G  0 disk
└─cluster--vg2-test--lv3 253:1    0   10G  0 lvm
vdc                      254:32   0   40G  0 disk
└─cluster--vg2-test--lv  253:0    0   10G  0 lvm

But, I built the lvm2 related rpms with the same code (include configure options ), 
vgchange command can work well, 
tb0307-nd2:/ # vgchange -aay cluster-vg2
  3 logical volume(s) in volume group "cluster-vg2" now active
tb0307-nd2:/ # lsblk
NAME                              MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sr0                                11:0    1  3.9G  0 rom  /run/media/ghe/openSUSE-Tumbleweed-DVD-x86_6423
vda                               254:0    0   40G  0 disk
├─vda1                            254:1    0    4G  0 part [SWAP]
├─vda2                            254:2    0 23.6G  0 part /
└─vda3                            254:3    0 12.4G  0 part /home
vdb                               254:16   0   40G  0 disk
├─cluster--vg2-test--lv2_mimage_0 253:2    0    8G  0 lvm
│ └─cluster--vg2-test--lv2        253:4    0    8G  0 lvm
└─cluster--vg2-test--lv3          253:5    0   10G  0 lvm
vdc                               254:32   0   40G  0 disk
├─cluster--vg2-test--lv           253:0    0   10G  0 lvm
├─cluster--vg2-test--lv2_mlog     253:1    0    4M  0 lvm
│ └─cluster--vg2-test--lv2        253:4    0    8G  0 lvm
└─cluster--vg2-test--lv2_mimage_1 253:3    0    8G  0 lvm
  └─cluster--vg2-test--lv2        253:4    0    8G  0 lvm

Do you know the root cause? what is the possible reason?

Thanks
Gang
