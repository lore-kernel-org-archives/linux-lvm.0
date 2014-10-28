Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9SDtVvP020925
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2014 09:55:31 -0400
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9SDtSem001249
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2014 09:55:29 -0400
Received: by mail-qc0-f179.google.com with SMTP id o8so541100qcw.10
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2014 06:55:28 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
In-Reply-To: <544E0D43.6010606@gmail.com>
References: <CACaajQsU_z8pwUGMHfD1y2dVkP_gKgajM6bBV1wFpxpF_7m1nA@mail.gmail.com>
	<544B9ADD.6040607@redhat.com>
	<CACaajQsG+2hPqp93yU77TBTOwy2EA_zHbV=pNqiq8dpsqPXzfw@mail.gmail.com>
	<544C05A2.8090004@redhat.com>
	<CACaajQtQ+h2NBhiH=Y-zET1cK7PE=5=PFoeSgLQqwnr9PiY0Cw@mail.gmail.com>
	<544C2897.6020708@redhat.com>
	<CACaajQtovTJHJQCh1uR7jojxyrpsjcrbO65qngyO6DvuDnYHWw@mail.gmail.com>
	<544E0D43.6010606@gmail.com>
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Tue, 28 Oct 2014 17:55:12 +0400
Message-ID: <CACaajQtS00j9wwTXePVA5qi3cb9PwXDukVnPktxZGOR_XtFAdQ@mail.gmail.com>
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

2014-10-27 12:15 GMT+03:00 Zdenek Kabelac <zdenek.kabelac@gmail.com>:
> If you would have latest lvm2 tools - you could have tried:
>
> lvconvert --repair  vg/pool
>
>
> With older tools - you need to go in these manual step:
>
> 4. swap deactivated repaired volume back to your thin-pool
> # lvchange -an vg/repaired
> # lvconvert --thinpool vg/pool --poolmetadata repaired
>
> try to activate pool -  if it doesn't work report more problems.

I'm can't activate volumes =(.
I'm run
lvconvert --repair vg1/tp1
lvchange -ay vg1/tp1_meta0

thin_dump --repair /dev/mapper/vg1-tp1_tmeta0
<superblock uuid="" time="27" transaction="120" data_block_size="128"
nr_data_blocks="7290880">
</superblock>

lvchange -an vg1/tp1_tmeta0

and finally

lvchange -ay vg1/3695
  Check of thin pool vg1/tp1 failed (status:1). Manual repair required
(thin_dump --repair /dev/mapper/vg1-tp1_tmeta)!


-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru
