Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 977855D9C3
	for <linux-lvm@redhat.com>; Mon,  1 Jul 2019 06:33:01 +0000 (UTC)
Received: from m4a0040g.houston.softwaregrp.com
	(m4a0040g.houston.softwaregrp.com [15.124.2.86])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 248CC3086268
	for <linux-lvm@redhat.com>; Mon,  1 Jul 2019 06:32:39 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0040g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Mon,  1 Jul 2019 06:32:37 +0000
From: Gang He <GHe@suse.com>
Date: Mon, 1 Jul 2019 06:31:52 +0000
Message-ID: <CH2PR18MB32067F038B414DF8CFAD779BCFF90@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Can't remove the snap LV of root volume on multipath
	disk PV
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

I am using lvm2-2.02.180 on SLES12SP4, I cannot remove the snap LV of root volume, which is based on multipath disk PV.
e.g. 
linux-kkay:/ # lvremove /dev/system/snap_root
  WARNING: Reading VG system from disk because lvmetad metadata is invalid.
Do you really want to remove active logical volume system/snap_root? [y/n]: y
  device-mapper: reload ioctl on  (254:3) failed: Invalid argument
  Failed to refresh root without snapshot.

But, I can remove the snap LV of data volume successfully, e.g.
linux-kkay:/ # lvremove /dev/system/data_snap
  WARNING: Reading VG system from disk because lvmetad metadata is invalid.
Do you really want to remove active logical volume system/data_snap? [y/n]: y
  Logical volume "data_snap" successfully removed

If I use the ordinary disk as PV (rather than multipath disk), I cannot encounter this problem (both snap LVs can be removed).

The disk layout is as below,
linux-kkay:/ # lsblk
NAME                       MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sda                          8:0    0   30G  0 disk
��sda1                       8:1    0   30G  0 part
��mpd_root                 254:0    0   30G  0 mpath
  ��mpd_root-part1         254:1    0   30G  0 part
    ��system-root-real     254:2    0   10G  0 lvm
    � ��system-root        254:3    0   10G  0 lvm   /
    � ��system-snap_root   254:5    0   10G  0 lvm
    ��system-snap_root-cow 254:4    0    5G  0 lvm
    � ��system-snap_root   254:5    0   10G  0 lvm
    ��system-swap          254:6    0    2G  0 lvm   [SWAP]
    ��system-data-real     254:8    0    4G  0 lvm
    � ��system-data        254:7    0    4G  0 lvm   /data
    � ��system-data_snap   254:10   0    4G  0 lvm
    ��system-data_snap-cow 254:9    0  840M  0 lvm
      ��system-data_snap   254:10   0    4G  0 lvm
sdb                          8:16   0   30G  0 disk
��sdb1                       8:17   0   30G  0 part
��mpd_root                 254:0    0   30G  0 mpath
  ��mpd_root-part1         254:1    0   30G  0 part
    ��system-root-real     254:2    0   10G  0 lvm
    � ��system-root        254:3    0   10G  0 lvm   /
    � ��system-snap_root   254:5    0   10G  0 lvm
    ��system-snap_root-cow 254:4    0    5G  0 lvm
    � ��system-snap_root   254:5    0   10G  0 lvm
    ��system-swap          254:6    0    2G  0 lvm   [SWAP]
    ��system-data-real     254:8    0    4G  0 lvm
    � ��system-data        254:7    0    4G  0 lvm   /data
    � ��system-data_snap   254:10   0    4G  0 lvm
    ��system-data_snap-cow 254:9    0  840M  0 lvm
      ��system-data_snap   254:10   0    4G  0 lvm

Thanks
Gang
