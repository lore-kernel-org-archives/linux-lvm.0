Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9R95ogC019934
	for <linux-lvm@redhat.com>; Mon, 27 Oct 2014 05:05:50 -0400
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9R95l2n029934
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 27 Oct 2014 05:05:49 -0400
Received: by mail-la0-f41.google.com with SMTP id pn19so5470699lab.28
	for <linux-lvm@redhat.com>; Mon, 27 Oct 2014 02:05:47 -0700 (PDT)
Received: from [10.34.130.202] (nat-pool-brq-t.redhat.com. [209.132.186.34])
	by mx.google.com with ESMTPSA id ug3sm2004027lac.33.2014.10.27.02.05.46
	for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Oct 2014 02:05:46 -0700 (PDT)
Message-ID: <544E0AE8.7080804@gmail.com>
Date: Mon, 27 Oct 2014 10:05:44 +0100
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CACaajQsU_z8pwUGMHfD1y2dVkP_gKgajM6bBV1wFpxpF_7m1nA@mail.gmail.com>	<544B9ADD.6040607@redhat.com>	<CACaajQsG+2hPqp93yU77TBTOwy2EA_zHbV=pNqiq8dpsqPXzfw@mail.gmail.com>	<544C05A2.8090004@redhat.com>	<CACaajQtQ+h2NBhiH=Y-zET1cK7PE=5=PFoeSgLQqwnr9PiY0Cw@mail.gmail.com>	<544C2897.6020708@redhat.com>
	<CADxRZqxDOZ4Usyp3bnWN9pvzyGD_C0tME1KGPZ1n+7mg8yoa8A@mail.gmail.com>
In-Reply-To: <CADxRZqxDOZ4Usyp3bnWN9pvzyGD_C0tME1KGPZ1n+7mg8yoa8A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 27.10.2014 v 07:58 Anatoly Pugachev napsal(a):
> On Sun, Oct 26, 2014 at 1:47 AM, Zdenek Kabelac <zkabelac@redhat.com
> <mailto:zkabelac@redhat.com>> wrote:
>  >
>  > Dne 25.10.2014 v 22:53 Vasiliy Tolstov napsal(a):
>  >>
>  >> 2014-10-26 0:18 GMT+04:00 Zdenek Kabelac <zkabelac@redhat.com
> <mailto:zkabelac@redhat.com>>:
>  >>>
>  >>> There is 'internal' metadata archive then -
>  >>>
>  >>> dd if=/dev/your_pv_volume  of=/tmp/1st.megabyte   bs=1M count=1
>  >>>
>  >>> It's will capture first megabyte of your PV where are embedded
>  >>> metadata of your Volume group.
>  >>>
>  >>> If you are not skilled enough - tar.gz and send this file to me.
>  >>
>  >>
>  >>
>  >> I'm do dd and send it. While i'm break thin pool i'm try to restore volume
> 2657.
>  >> But i don't stop lvm thin pool =(.
>  >>
>  >
>  >
>  > From the metadata  something bad was going one:
>  >
>  > Fri Oct 24 17:03:04 2014
>  >
>  > transaction_id = 120  - create = "3695"
>  >
>  > And suddenly on Fri Oct 24 18:07:23 2014
>  > pool is back on older transaction_id
>  >
>  > transaction_id = 114
>  >
>  >
>  > Is that the time of your vgcfgrestore?
>  >
>  > I'm attaching those metadata which you likely should put back to get in sync
>  > with your kernel metadata (assuming you have not modified those in any way)
>
> Zdenek,
>
> can you please describe (possibly in details) what have you done with tar.gz
> sent to you, so everyone would know what to do next time?
>
> Thanks a lot!


Any Google query on lvm2 metadata recovery will disclose this - I've picked 
randomly this one:
http://microdevsys.com/wp/linux-lvm-recovering-a-lost-volume/


In this case however provided data by user were just too short since he 
created 300M metadata space - so I've asked to resend 4M on my email - so you 
will not exactly find the info above in the initial tar.gz file (there
are just older versions) - but if you open  file in 'vi' editor - you will see 
those metadata yourself.

Zdenek
