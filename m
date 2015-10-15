Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9F9OhGt016012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2015 05:24:43 -0400
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mx1.redhat.com (Postfix) with ESMTPS id 24531C0BB289
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2015 09:24:43 +0000 (UTC)
Received: by wijp11 with SMTP id p11so19805463wij.0
	for <linux-lvm@redhat.com>; Thu, 15 Oct 2015 02:24:42 -0700 (PDT)
References: <561EB8A1.10806@windriver.com>
	<90c8e9f78fb27d380b22d2afdd6225be@alukardd.org>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <561F70D7.7040302@gmail.com>
Date: Thu, 15 Oct 2015 11:24:39 +0200
MIME-Version: 1.0
In-Reply-To: <90c8e9f78fb27d380b22d2afdd6225be@alukardd.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] unexpected behaviour of "lvresize" with sparse
	volumes
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Chris Friesen <chris.friesen@windriver.com>

Dne 15.10.2015 v 09:13 Alexey napsal(a):
> Hello,
>
> If you look at the output of `lvs myvg`, then you will understand whats happens.
> When you create thin LV without specifying option `-T`, lvm automatically
> created TP for you with size equal to -L option.
> And when you resize your sparsevol, your TP (auto name lvol1) still have old
> size.
>

Mixing 2 things together.

Newer lvm2 tools (then reported 2.02.98)  are now creating sparse volumes
as a thin volume in thin-pool.

Old behavior with /dev/zero snapshot is thought still available
either with lvm.conf settings  or using  --type snapshot.

Now back to the  original problem - yep you cannot resize it with tool ATM.

There will be likely added support  for    'lvresize -V+'
(it will work for thin volumes & these sparse snapshot)

Basically adding 'virtual size'.

But it has lower priority ATM (as you may resize thin volumes
with -L, and thus users do not have much troubles with it,
expect the logical meaning looks 'wrong' - as resize of thin
volume does not really 'eat' extents from VG.

If you 'urgently' need  bigger size -

- make sure  modified LVs are rather deactivated.
- 'vgcfgbackup' your vg
- take your favourite text editor (e.g.  vi)
- edit size for your '_vorigin' LV (extent_count = ....)
- edit size for respective hidden 'snapshot0' LV (extent_count = ....)
   (if you have more then one -
    find properly numbered one, the one referencing your _vorigin! -
    those 2 LVs should have equal size)
- 'vgcfgrestore'  your updated metadata
- activate now bigger sized _vorigin
- check  blockdev --getsize64  /dev/vg/sparsevol has new correct size
- enjoy

Regards

Zdenek
