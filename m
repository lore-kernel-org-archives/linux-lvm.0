Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9PIfvDp004290
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 14:41:57 -0400
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9PIfttn018323
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 14:41:55 -0400
Received: by mail-qc0-f176.google.com with SMTP id r5so2158049qcx.21
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 11:41:54 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
In-Reply-To: <544B9ADD.6040607@redhat.com>
References: <CACaajQsU_z8pwUGMHfD1y2dVkP_gKgajM6bBV1wFpxpF_7m1nA@mail.gmail.com>
	<544B9ADD.6040607@redhat.com>
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Sat, 25 Oct 2014 22:41:39 +0400
Message-ID: <CACaajQsG+2hPqp93yU77TBTOwy2EA_zHbV=pNqiq8dpsqPXzfw@mail.gmail.com>
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
To: device-mapper development <dm-devel@redhat.com>
Cc: LVM <linux-lvm@redhat.com>

2014-10-25 16:43 GMT+04:00 Zdenek Kabelac <zkabelac@redhat.com>:
> I'm not sure how you could do that 'by a mistake' since LVM is printing
> pretty BIG WARNING that any vgcfgrestore with thin should be done after big
> thinking and requires even extra --force option.
>
> But anyway -  if you have  /etc/lvm/archive - you should probably be able to
> find the 'right' version of lvm2 metadata for your kernel metadata.
>
> However 'normally' you could be off the sequence number only by one! so
> I'm quite curious what you've been able to make such big difference.
>
> If you could - package /etc/lvm/archive  so I could get closer look where
> the lvm2 has holes to allow such operations ?
>
> Which version of lvm2 and kernel is here in use ?
>
> Have you been manipulating with  thin-pool's metadata in any way ?
>
> Regards
>
> Zdenek


I can't provide old archive data =(, Now i only have this error..
Also in lvm conf i have issue_discards =1

-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru
