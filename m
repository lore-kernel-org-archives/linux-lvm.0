Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s99DKJ2o017858
	for <linux-lvm@redhat.com>; Thu, 9 Oct 2014 09:20:19 -0400
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s99DKFrr024332
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 9 Oct 2014 09:20:15 -0400
Received: by mail-qg0-f52.google.com with SMTP id q108so1907550qgd.39
	for <linux-lvm@redhat.com>; Thu, 09 Oct 2014 06:20:14 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
In-Reply-To: <CACaajQuvvGhXsAG9FUjJ3p_EbwZ6XovFuY_9eU-fhHppi_5_YQ@mail.gmail.com>
References: <CACaajQu+i6wu1z86wzWa-x=HN_wWy6ByZBnLHzPy7E5Etpj6jw@mail.gmail.com>
	<542ABFC3.4000909@redhat.com>
	<CACaajQut7caHMw6nc-ZUbb=1NuYMZu-untY3y6XdXkk==K7+WA@mail.gmail.com>
	<20140930154918.GB9925@redhat.com>
	<CACaajQuvvGhXsAG9FUjJ3p_EbwZ6XovFuY_9eU-fhHppi_5_YQ@mail.gmail.com>
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Thu, 9 Oct 2014 17:19:58 +0400
Message-ID: <CACaajQuyXg-=LUgwkFKEpH8mVc_CAyCkMUff3JAqxo_-Mg485A@mail.gmail.com>
Subject: Re: [linux-lvm] thin pool and discards
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
To: Vasiliy Tolstov <v.tolstov@selfip.ru>
Cc: Mike Snitzer <snitzer@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

2014-10-09 2:44 GMT+04:00 Vasiliy Tolstov <v.tolstov@selfip.ru>:
> Thanks! Rhel kernel works fine for me. Does it possible to send needed
> patches to stable for all other users ?=) As i see this commit does
> not in 3.10 stable now.


AS i see i have another issue. I don't know how created some thinp
volumes, but on some of them i'm able to get back space after discard,
but on some not. How can i debug this ?

on vg0 not works:
vgdisplay vg0/tp0
  --- Volume group ---
  VG Name               vg0
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  359
  VG Access             read/write
  VG Status             resizable
  MAX LV                10000
  Cur LV                6
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               449.70 GiB
  PE Size               4.00 MiB
  Total PE              115124
  Alloc PE / Size       114230 / 446.21 GiB
  Free  PE / Size       894 / 3.49 GiB
  VG UUID               7iCwdw-NTqg-W8dJ-4hTE-8D8J-r9Mv-8y4NVM

lvdisplay vg0/tp0
  --- Logical volume ---
  LV Name                tp0
  VG Name                vg0
  LV UUID                R4ioiK-PWnr-SLUp-8g0l-CTU0-nRn1-bKebI3
  LV Write Access        read/write
  LV Creation host, time cn07, 2014-08-13 19:54:22 +0400
  LV Pool transaction ID 173
  LV Pool metadata       tp0_tmeta
  LV Pool data           tp0_tdata
  LV Pool chunk size     64.00 KiB
  LV Zero new blocks     yes
  LV Status              available
  # open                 0
  LV Size                445.00 GiB
  Allocated pool data    2.97%
  Allocated metadata     1.34%
  Current LE             113920
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           254:39




on vg1 all works fine:

vgdisplay vg1
  --- Volume group ---
  VG Name               vg1
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  227
  VG Access             read/write
  VG Status             resizable
  MAX LV                10000
  Cur LV                9
  Open LV               3
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               449.70 GiB
  PE Size               4.00 MiB
  Total PE              115124
  Alloc PE / Size       114230 / 446.21 GiB
  Free  PE / Size       894 / 3.49 GiB
  VG UUID               zbDIA4-731p-3uCm-oHx1-txYu-YMd7-YLMCVj

lvdisplay vg1/tp1
  --- Logical volume ---
  LV Name                tp1
  VG Name                vg1
  LV UUID                aVJpg3-xDYo-0Tuz-fImd-kA3I-Qd3g-e3xRSR
  LV Write Access        read/write
  LV Creation host, time cn07, 2014-08-13 19:54:22 +0400
  LV Pool transaction ID 110
  LV Pool metadata       tp1_tmeta
  LV Pool data           tp1_tdata
  LV Pool chunk size     64.00 KiB
  LV Zero new blocks     yes
  LV Status              available
  # open                 0
  LV Size                445.00 GiB
  Allocated pool data    6.65%
  Allocated metadata     2.68%
  Current LE             113920
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           254:32


-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru
