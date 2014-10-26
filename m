Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9QJl3xa017661
	for <linux-lvm@redhat.com>; Sun, 26 Oct 2014 15:47:03 -0400
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9QJl01v015586
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sun, 26 Oct 2014 15:47:01 -0400
Received: by mail-qa0-f45.google.com with SMTP id dc16so2968415qab.18
	for <linux-lvm@redhat.com>; Sun, 26 Oct 2014 12:47:00 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
In-Reply-To: <544C2897.6020708@redhat.com>
References: <CACaajQsU_z8pwUGMHfD1y2dVkP_gKgajM6bBV1wFpxpF_7m1nA@mail.gmail.com>
	<544B9ADD.6040607@redhat.com>
	<CACaajQsG+2hPqp93yU77TBTOwy2EA_zHbV=pNqiq8dpsqPXzfw@mail.gmail.com>
	<544C05A2.8090004@redhat.com>
	<CACaajQtQ+h2NBhiH=Y-zET1cK7PE=5=PFoeSgLQqwnr9PiY0Cw@mail.gmail.com>
	<544C2897.6020708@redhat.com>
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Sun, 26 Oct 2014 23:46:45 +0400
Message-ID: <CACaajQtovTJHJQCh1uR7jojxyrpsjcrbO65qngyO6DvuDnYHWw@mail.gmail.com>
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

2014-10-26 2:47 GMT+04:00 Zdenek Kabelac <zkabelac@redhat.com>:
> From the metadata  something bad was going one:
>
> Fri Oct 24 17:03:04 2014
>
> transaction_id = 120  - create = "3695"
>
> And suddenly on Fri Oct 24 18:07:23 2014
> pool is back on older transaction_id
>
> transaction_id = 114
>
>
> Is that the time of your vgcfgrestore?
>
> I'm attaching those metadata which you likely should put back to get in sync
> with your kernel metadata (assuming you have not modified those in any way)


Hm yes, i miss that one vg created in this time, thanks. As i
understand transaction id needs to be changed? Or something other?
But i have error:

lvchange -ay vg1/2735
  Check of thin pool vg1/tp1 failed (status:1). Manual repair required
(thin_dump --repair /dev/mapper/vg1-tp1_tmeta)!

-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru
