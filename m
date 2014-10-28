Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9SEUHx7012194
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2014 10:30:17 -0400
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9SEUE5P007849
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2014 10:30:14 -0400
Received: by mail-qc0-f179.google.com with SMTP id o8so571707qcw.38
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2014 07:30:13 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
In-Reply-To: <20141028140905.GA16396@debian>
References: <CACaajQsU_z8pwUGMHfD1y2dVkP_gKgajM6bBV1wFpxpF_7m1nA@mail.gmail.com>
	<544B9ADD.6040607@redhat.com>
	<CACaajQsG+2hPqp93yU77TBTOwy2EA_zHbV=pNqiq8dpsqPXzfw@mail.gmail.com>
	<544C05A2.8090004@redhat.com>
	<CACaajQtQ+h2NBhiH=Y-zET1cK7PE=5=PFoeSgLQqwnr9PiY0Cw@mail.gmail.com>
	<544C2897.6020708@redhat.com>
	<CACaajQtovTJHJQCh1uR7jojxyrpsjcrbO65qngyO6DvuDnYHWw@mail.gmail.com>
	<544E0D43.6010606@gmail.com>
	<CACaajQtS00j9wwTXePVA5qi3cb9PwXDukVnPktxZGOR_XtFAdQ@mail.gmail.com>
	<20141028140905.GA16396@debian>
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Tue, 28 Oct 2014 18:29:58 +0400
Message-ID: <CACaajQub-F9OrfVgDdWVScarq-_RoJw0N=W1bP0-ic0C-xnsXA@mail.gmail.com>
Subject: Re: [linux-lvm] [dm-devel] fix corrupted thin pool
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
To: LVM general discussion and development <linux-lvm@redhat.com>

2014-10-28 17:09 GMT+03:00 Joe Thornber <thornber@redhat.com>:
> thin_dump spits just spits out xml, it doesn't change the device it's
> reading.  So the process is either:
>
> thin_dump --repair <dev> > metadata.xml
> thin_restore -i metadata.xml -o <dev>
>


As i understand - if thin_dump --repair not displays volumes i can't
do restore...

> or you can use the thin_repair tool which does both of these
> processes.
>
>> <superblock uuid="" time="27" transaction="120" data_block_size="128"
>> nr_data_blocks="7290880">
>> </superblock>
>
> This is worrying, you seem to have no volumes in your pool?


No, as i email before, i have many volumes:
lvs vg1
  LV         VG   Attr       LSize   Pool Origin Data%  Move Log
Cpy%Sync Convert
  2679_751   vg1  Vwi---tz-k  20.00g tp1
  2735       vg1  Vwi---tz--  20.00g tp1
  2749       vg1  Vwi---tz--  20.00g tp1
  2799       vg1  Vwi---tz--  20.00g tp1
  2937_785   vg1  Vwi---tz-k 160.00g tp1
  3119       vg1  Vwi---tz--  20.00g tp1
  3435       vg1  Vwi---tz--  20.00g tp1
  3471       vg1  Vwi---tz--  20.00g tp1
  3547       vg1  Vwi---tz-- 160.00g tp1
  3645       vg1  Vwi---tz--  20.00g tp1
  3647       vg1  Vwi---tz--  20.00g tp1
  3695       vg1  Vwi---tz--  20.00g tp1
  tp1        vg1  twi---tz-- 445.00g
  tp1_tmeta0 vg1  -wi------- 620.00m

-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru
