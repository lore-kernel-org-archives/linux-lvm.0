Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 380DA2156A37
	for <linux-lvm@redhat.com>; Tue, 29 Sep 2020 08:46:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FDD2185A78B
	for <linux-lvm@redhat.com>; Tue, 29 Sep 2020 08:46:32 +0000 (UTC)
From: Gang He <GHe@suse.com>
Date: Tue, 29 Sep 2020 08:46:25 +0000
Message-ID: <HE1PR0402MB3514DC4297C272DF86ECB70FCF320@HE1PR0402MB3514.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvresize cannot refresh LV size on on other hosts when
 extending LV with a shared lock
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello List,

I am using lvm2 v2.03.10(or v2.03.05), I setup a lvm2-lockd based (three nodes) cluster.
I created PV, VG and LV, formated LV with a cluster file system (e.g. ocfs2).
So far, all the things work well, I can write the files from each node.
Next, I extended the online LV from node1, e.g.
ghe-tw-nd1# lvresize -L+1024M vg1/lv1
  WARNING: extending LV with a shared lock, other hosts may require LV refresh.
  Size of logical volume vg1/lv1 changed from 13.00 GiB (3328 extents) to 14.00 GiB (3584 extents).
  Logical volume vg1/lv1 successfully resized.
  Refreshing LV /dev//vg1/lv1 on other hosts...

But, the other nodes cannot aware this LV size was changed, e.g.
2020-09-29 16:01:48  ssh ghe-tw-nd3 lsblk
load pubkey "/root/.ssh/id_rsa": invalid format
NAME        MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
vda         253:0    0  40G  0 disk
��vda1      253:1    0   8M  0 part
��vda2      253:2    0  38G  0 part /
��vda3      253:3    0   2G  0 part [SWAP]
vdb         253:16   0  80G  0 disk
��vdb1      253:17   0  10G  0 part
��vdb2      253:18   0  20G  0 part
� ��vg1-lv1 254:0    0  13G  0 lvm  /mnt/shared   <<== here
��vdb3      253:19   0  50G  0 part

2020-09-29 16:01:49  ssh ghe-tw-nd2 lsblk
load pubkey "/root/.ssh/id_rsa": invalid format
NAME        MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
vda         253:0    0  40G  0 disk
��vda1      253:1    0   8M  0 part
��vda2      253:2    0  38G  0 part /
��vda3      253:3    0   2G  0 part [SWAP]
vdb         253:16   0  80G  0 disk
��vdb1      253:17   0  10G  0 part
��vdb2      253:18   0  20G  0 part
� ��vg1-lv1 254:0    0  13G  0 lvm  /mnt/shared   <<== here
��vdb3      253:19   0  50G  0 part

2020-09-29 16:01:49  ssh ghe-tw-nd1 lsblk
load pubkey "/root/.ssh/id_rsa": invalid format
NAME        MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
vda         253:0    0  40G  0 disk
��vda1      253:1    0   8M  0 part
��vda2      253:2    0  38G  0 part /
��vda3      253:3    0   2G  0 part [SWAP]
vdb         253:16   0  80G  0 disk
��vdb1      253:17   0  10G  0 part
��vdb2      253:18   0  20G  0 part
� ��vg1-lv1 254:0    0  14G  0 lvm  /mnt/shared  <<== LV size was changed on node1
��vdb3      253:19   0  50G  0 part

This behavior breaks our cluster high availability, we have to de-activate/activate LV to get LV size refresh.
Is this behavior by-design? 
Could we extend the online LV automatically on each node (when any node triggers a LV resize command)?


Thanks
Gang
