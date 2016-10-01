Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u91COjJA008481
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 1 Oct 2016 08:24:45 -0400
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56C377F08B
	for <linux-lvm@redhat.com>; Sat,  1 Oct 2016 12:24:44 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id n189so56160507qke.0
	for <linux-lvm@redhat.com>; Sat, 01 Oct 2016 05:24:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE-HYsNRAsN8LoJCj5Yjkt6Xhoe+NKgHs16TNR-A-0JD1TkYQw@mail.gmail.com>
References: <CAE-HYsPY0yWvQKYwbm74+pVp2+rr9zard+myAPXzUi+TZ4w1qw@mail.gmail.com>
	<CAE-HYsOLGU-ZxahjYApMhnLiKnvXu=6ekFLiyn0KgqVwe7jS8g@mail.gmail.com>
	<CAE-HYsNPzk7QWZ0Uf5HTXyvfMFh2tCZ4pJUbshscptLu=D5ZWQ@mail.gmail.com>
	<CAE-HYsNRAsN8LoJCj5Yjkt6Xhoe+NKgHs16TNR-A-0JD1TkYQw@mail.gmail.com>
From: Giuliano Procida <giuliano.procida@gmail.com>
Date: Sat, 1 Oct 2016 13:24:23 +0100
Message-ID: <CAE-HYsN7Gc=mQ2iga_SZ96qnFrq9RHDCn03-G8UAy3nHnk1ddg@mail.gmail.com>
Subject: Re: [linux-lvm] LVM RAID repair trouble
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
To: linux-lvm@redhat.com

One additional issue.

6. Once the PV metadata ring has been used a lot, pvck finds few or
zero metadata regions, often not including the current one.

This should be straightforward to reproduce. Here's what I currently see.

# pvck -v /dev/sdb2 # the replacement disk
    Scanning /dev/sdb2
  Found label on /dev/sdb2, sector 1, type=LVM2 001
  Found text metadata area: offset=4096, size=1044480
    Found LVM2 metadata record at offset=481280, size=22016, offset2=0 size2=0
    Found LVM2 metadata record at offset=459264, size=22016, offset2=0 size2=0
    Found LVM2 metadata record at offset=437248, size=22016, offset2=0 size2=0
    Found LVM2 metadata record at offset=415232, size=22016, offset2=0 size2=0
    Found LVM2 metadata record at offset=392704, size=22528, offset2=0 size2=0
    Found LVM2 metadata record at offset=370176, size=22528, offset2=0 size2=0
    Found LVM2 metadata record at offset=347136, size=23040, offset2=0 size2=0
    Found LVM2 metadata record at offset=324608, size=22528, offset2=0 size2=0
    Found LVM2 metadata record at offset=302080, size=22528, offset2=0 size2=0
    Found LVM2 metadata record at offset=279040, size=23040, offset2=0 size2=0
    Found LVM2 metadata record at offset=256512, size=22528, offset2=0 size2=0
    Found LVM2 metadata record at offset=233984, size=22528, offset2=0 size2=0
    Found LVM2 metadata record at offset=210944, size=23040, offset2=0 size2=0
    Found LVM2 metadata record at offset=188416, size=22528, offset2=0 size2=0
    Found LVM2 metadata record at offset=165888, size=22528, offset2=0 size2=0
    Found LVM2 metadata record at offset=142848, size=23040, offset2=0 size2=0
    Found LVM2 metadata record at offset=119296, size=23552, offset2=0 size2=0
    Found LVM2 metadata record at offset=95744, size=23552, offset2=0 size2=0
    Found LVM2 metadata record at offset=72704, size=23040, offset2=0 size2=0
    Found LVM2 metadata record at offset=50176, size=22528, offset2=0 size2=0
    Found LVM2 metadata record at offset=27136, size=23040, offset2=0 size2=0

# .../parse_pv_meta /dev/sdb2 | wc
/dev/sdb2
Found label at 512 of type LVM2 001 with CRC 668745670
PV header for UUID UTRUfMiTVIWpuGbVMYbRh8te3c2QvuSE with device_size
1999861972992
data area at 1048576 size 0
metadata area at 4096 size 1044480
reading metadata at 4096 of size 1044480
metadata header looks OK
region at 499200 rsize 21907 rflags 0 and CRC 3460382297
   1532    3190   21906

# pvck -v /dev/sda2 # an older disk
    Scanning /dev/sda2
  Found label on /dev/sda2, sector 1, type=LVM2 001
  Found text metadata area: offset=4096, size=1044480
    Found LVM2 metadata record at offset=935936, size=22016, offset2=0 size2=0

# .../parse_pv_meta /dev/sda2 | wc # my utility
/dev/sda2
Found label at 512 of type LVM2 001 with CRC 3061781507
PV header for UUID 9WMRxLdsD6Or0ehN0xuRsRqmiprfdJtK with device_size
1999860997632
data area at 1048576 size 0
metadata area at 4096 size 1044480
reading metadata at 4096 of size 1044480
metadata header looks OK
region at 953856 rsize 21907 rflags 0 and CRC 3460382297
   1532    3190   21906
