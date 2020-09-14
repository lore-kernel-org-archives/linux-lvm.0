Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93C762028E91
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 21:44:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35C2C858286
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 21:44:29 +0000 (UTC)
Received: from plutone.assyoma.it (93.63.55.57) by mr011msb.fastweb.it
	(5.8.208) id 5F2418BD036B3E7C for linux-lvm@redhat.com;
	Mon, 14 Sep 2020 23:44:24 +0200
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTPA id ECC68E1FD19B
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 23:44:23 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 14 Sep 2020 23:44:23 +0200
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <3f51904f43c45f8c1259f1b050402358@assyoma.it>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvmcache with vdo - inconsistent block size
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,
I am testing lvmcache with VDO and I have issue with devices block size.

The big & slow VDO device is on top of a 4-disk MD RAID 10 device 
(itself on top of dm-integrity). Over the VDO device I created a 
thinpool and a thinvol [1]. When adding the cache device to the volume 
group via vgextend, I get an error stating "Devices have inconsistent 
logical block sizes (4096 and 512)." [2]

Now, I know why the error shows and what i means. However, I don't know 
how to force the cache device to act as a 4k sector device, and/if this 
is really required to cache a VDO device.

My current workaround is to set VDO with --emulate512=enabled, but this 
can be suboptimal and it is not recommended.

Any idea on what I am doing wrong?
Thanks.

[1] Output from lsblk -t:
[root@singularity dev]# lsblk -t | cut -c1-73
NAME                            ALIGNMENT  MIN-IO  OPT-IO PHY-SEC 
LOG-SEC
sda                                   0     512       0     512     512
├─sda1                                0     512       0     512     512
├─sda2                                0     512       0     512     512
│ ├─system-root                       0     512       0     512     512
│ └─system-swap                       0     512       0     512     512
├─sda3                                0     512       0     512     512
└─sda4                                0     512       0     512     512
sdb                                   0     512       0     512     512
└─sdb                                 0     512       0     512     512
   └─md200                             0  524288 1048576     512     512
     └─vdo1                            0    4096    4096    4096    4096
       ├─vg_kvm-thinpool_tmeta         0    4096    4096    4096    4096
       │ └─vg_kvm-thinpool-tpool       0 1048576 1048576    4096    4096
       │   ├─vg_kvm-thinpool           0 1048576 1048576    4096    4096
       │   └─vg_kvm-thinvol            0 1048576 1048576    4096    4096
       └─vg_kvm-thinpool_tdata         0    4096    4096    4096    4096
         └─vg_kvm-thinpool-tpool       0 1048576 1048576    4096    4096
           ├─vg_kvm-thinpool           0 1048576 1048576    4096    4096
           └─vg_kvm-thinvol            0 1048576 1048576    4096    4096
sdc                                   0     512       0     512     512
└─sdc                                 0     512       0     512     512
   └─md200                             0  524288 1048576     512     512
     └─vdo1                            0    4096    4096    4096    4096
       ├─vg_kvm-thinpool_tmeta         0    4096    4096    4096    4096
       │ └─vg_kvm-thinpool-tpool       0 1048576 1048576    4096    4096
       │   ├─vg_kvm-thinpool           0 1048576 1048576    4096    4096
       │   └─vg_kvm-thinvol            0 1048576 1048576    4096    4096
       └─vg_kvm-thinpool_tdata         0    4096    4096    4096    4096
         └─vg_kvm-thinpool-tpool       0 1048576 1048576    4096    4096
           ├─vg_kvm-thinpool           0 1048576 1048576    4096    4096
           └─vg_kvm-thinvol            0 1048576 1048576    4096    4096
sdd                                   0     512       0     512     512
└─sdd                                 0     512       0     512     512
   └─md200                             0  524288 1048576     512     512
     └─vdo1                            0    4096    4096    4096    4096
       ├─vg_kvm-thinpool_tmeta         0    4096    4096    4096    4096
       │ └─vg_kvm-thinpool-tpool       0 1048576 1048576    4096    4096
       │   ├─vg_kvm-thinpool           0 1048576 1048576    4096    4096
       │   └─vg_kvm-thinvol            0 1048576 1048576    4096    4096
       └─vg_kvm-thinpool_tdata         0    4096    4096    4096    4096
         └─vg_kvm-thinpool-tpool       0 1048576 1048576    4096    4096
           ├─vg_kvm-thinpool           0 1048576 1048576    4096    4096
           └─vg_kvm-thinvol            0 1048576 1048576    4096    4096
sde                                   0     512       0     512     512
└─sde                                 0     512       0     512     512
   └─md200                             0  524288 1048576     512     512
     └─vdo1                            0    4096    4096    4096    4096
       ├─vg_kvm-thinpool_tmeta         0    4096    4096    4096    4096
       │ └─vg_kvm-thinpool-tpool       0 1048576 1048576    4096    4096
       │   ├─vg_kvm-thinpool           0 1048576 1048576    4096    4096
       │   └─vg_kvm-thinvol            0 1048576 1048576    4096    4096
       └─vg_kvm-thinpool_tdata         0    4096    4096    4096    4096
         └─vg_kvm-thinpool-tpool       0 1048576 1048576    4096    4096
           ├─vg_kvm-thinpool           0 1048576 1048576    4096    4096
           └─vg_kvm-thinvol            0 1048576 1048576    4096    4096

[2] [root@singularity dev]# vgextend vg_kvm /dev/sda4
   Devices have inconsistent logical block sizes (4096 and 512).

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
