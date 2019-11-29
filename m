Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D4BE12EC20
	for <linux-lvm@redhat.com>; Fri, 29 Nov 2019 08:35:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA9AB85A320
	for <linux-lvm@redhat.com>; Fri, 29 Nov 2019 08:35:50 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Fri, 29 Nov 2019 08:33:03 +0000
From: Heming Zhao <heming.zhao@suse.com>
Date: Fri, 29 Nov 2019 08:35:12 +0000
Message-ID: <ae5c61f5-8872-6923-cc28-d1ebfb075111@suse.com>
Content-Language: en-US
Content-ID: <FE936BE675A32B42A0048CB35A1DE7A8@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Question about vgreduce on raid lvm cache
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
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello list,

I met a lvm cache issue recently.

The machine had an LVM VG configured with:
  dev1 + dev2 -> data_lv with raid 1 mirror
  dev3 + dev4 -> data_cache_lv with raid 1 mirror and type cache

These were assembled to a cached volume with:
"lvconvert --type cache --cachemode writeback --cachepool data/data_cache_lv data/data_lv"

The device dev4 then died and was removed from the system.

When attempting to remove the device using "vgreduce --removemissing", lvm removed both data_cache_lv and data_lv from the data vg.

This is unexpected behaviour, as dev1, dev2, dev3 were all still present.
The expected behaviour should:
```
vgreduce --removemissing
lvconvert -m0 system/lv
```

When it's a non-cached type, and you performe vgreduce, lvs are NOT removed.

the (reproduced) command list:
```
pvcreate /dev/mapper/dev1 /dev/mapper/dev2 /dev/mapper/dev3 /dev/mapper/dev4
vgcreate VG /dev/mapper/dev1 /dev/mapper/dev2 /dev/mapper/dev3 /dev/mapper/dev4
lvcreate --type raid1 -m 1 -L150 -n data_lv VG /dev/mapper/dev1 /dev/mapper/dev2
lvcreate --type raid1 -m 1 -L150 -n data_cache_lv VG /dev/mapper/dev3 /dev/mapper/dev4
lvconvert --type cache --cachemode writeback --cachepool VG/data_cache_lv VG/data_lv
dmsetup remove -f dev4
vgreduce --removemissing --force VG
```

Thanks.
