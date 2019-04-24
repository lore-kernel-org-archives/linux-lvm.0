Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04FCE1018A0E
	for <linux-lvm@redhat.com>; Wed, 24 Apr 2019 17:10:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC0BEC0B2A5C
	for <linux-lvm@redhat.com>; Wed, 24 Apr 2019 17:10:15 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t17so14478990wrr.4
	for <linux-lvm@redhat.com>; Wed, 24 Apr 2019 10:10:15 -0700 (PDT)
Received: from mail.onse.fi ([109.204.156.230])
	by smtp.gmail.com with ESMTPSA id
	d14sm2587383wre.78.2019.04.24.10.10.11 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 10:10:12 -0700 (PDT)
Received: from mail.onse.fi (delta.onse.fi [127.0.0.1])
	by mail.onse.fi (Postfix) with ESMTP id 3794440441
	for <linux-lvm@redhat.com>; Wed, 24 Apr 2019 20:10:11 +0300 (EEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 24 Apr 2019 20:10:11 +0300
From: Anssi Hannula <anssi.hannula@iki.fi>
In-Reply-To: <eacb8d5110c2c658fa83dbd589fd6fbf@iki.fi>
References: <eacb8d5110c2c658fa83dbd589fd6fbf@iki.fi>
Message-ID: <3ec9acca2f8161282341f561c3c7c988@iki.fi>
Subject: Re: [linux-lvm] Internal error: Referenced LV pvmove0 not listed in
	VG
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

Anssi Hannula kirjoitti 2019-04-24 02:06:
> Hi all,
> 
> I'm getting the following error when trying to run a pvmove command:
> 
> # pvmove -v /dev/md0:18122768-19076597
>     Cluster mirror log daemon not included in build.
>     Archiving volume group "delta" metadata (seqno 72).
>     Creating logical volume pvmove0
>     activation/volume_list configuration setting not defined: Checking
> only host tags for delta/home_r.
>     Moving 167398 extents of logical volume delta/home_r.
>     activation/volume_list configuration setting not defined: Checking
> only host tags for delta/data_r.
>   Internal error: Referenced LV pvmove0 not listed in VG delta.
> 
> This is with git master, but I see the same on 2.02.177.
[...]

Here is a short reproducer:

------clip------
#!/bin/sh

set -ex

mkdir -p lvmtestdir
mount -t tmpfs none lvmtestdir
cd lvmtestdir

truncate --size=$((156275497728*512)) testimg1
truncate --size=$((46883372928*512)) testimg2

dev1="$(losetup -f --show testimg1)"
dev2="$(losetup -f --show testimg2)"

pvcreate "$dev1"
pvcreate "$dev2"

vgcreate TESTVG "$dev1" "$dev2"

lvcreate --name=lv0 -l $((1048576+167398)) TESTVG \
	"$dev1":0+655360 \
	"$dev1":17037866+393216 \
	"$dev1":18909200+167398
lvcreate --name=lv1 -l $((16382506+1478118)) TESTVG \
	"$dev1":917504+16120362 \
	"$dev1":655360+262144 \
	"$dev1":17431082+1478118

# ERROR
pvmove -v "$dev1":18122768-19076597 || :

# cleanup
vgremove --force TESTVG
losetup -d "$dev1"
losetup -d "$dev2"
cd ..
sleep 1 # lvmtestdir busy?
umount lvmtestdir
------clip------


-- 
Anssi Hannula
