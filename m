Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s779xW2j011936
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2014 05:59:32 -0400
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s779xSeM010310
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2014 05:59:29 -0400
Received: by mail-qg0-f54.google.com with SMTP id z60so4179340qgd.13
	for <linux-lvm@redhat.com>; Thu, 07 Aug 2014 02:59:28 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Thu, 7 Aug 2014 13:59:13 +0400
Message-ID: <CACaajQvaWukP_LwMgs5Bcsc3-Pz+dfBU1FYHkT5GsLHHsXgj8Q@mail.gmail.com>
Subject: [linux-lvm] errors while creating thin pools
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
Content-Transfer-Encoding: 7bit
To: linux-lvm <linux-lvm@redhat.com>

Hello. I'm use lvm 2.02.106
vgdisplay:
  --- Volume group ---
  VG Name               vg5
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  95
  VG Access             read/write
  VG Status             resizable
  MAX LV                10000
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               449.70 GiB
  PE Size               4.00 MiB
  Total PE              115124
  Alloc PE / Size       0 / 0
  Free  PE / Size       115124 / 449.70 GiB
  VG UUID               DQaAEA-uCTo-B5Sp-BZXu-6nzd-5Nz2-RMfC0t

Why i can't create thin pool with size of near 449 Gb? Command like
lvcreate -L 445G --poolmetadatasize 620M --type thin-pool --thinpool
tp5 vg5 success
but if i increase size to 447Gb i'm failing
lvcreate -L 447G --poolmetadatasize 620M --type thin-pool --thinpool tp5 vg5

Increasing pool metadata size does not helps.

-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru
