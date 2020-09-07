Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C67769E9D
	for <linux-lvm@redhat.com>; Mon,  7 Sep 2020 19:56:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F0C3856DF1
	for <linux-lvm@redhat.com>; Mon,  7 Sep 2020 19:56:16 +0000 (UTC)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 7 Sep 2020 21:56:07 +0200
Message-Id: <99376C3F-DB70-4917-BA62-3A51A55F6DF5@gmail.com>
References: <4081c11e-d2b0-ebfa-d1a0-92a4efc79e81@redhat.com>
In-Reply-To: <4081c11e-d2b0-ebfa-d1a0-92a4efc79e81@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] exposing snapshot block device
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

hi 
I tried all these steps
but when I associated the snapshot cow device back to an empty origin, and typed the lvs command
the data% output shows 0% instead of 37% ?
so it looks like that the lvconvert -s vg1/lvsnap vg1/lv0 looses the cow data?

perhaps ypu can guide me how this can be done?

btw, just to emulate s full copy, I executed the 
dd if=/dev/vg0/lv0 of=/dev/vg1/lv0 
before the lvconvert -s, to make sure the last data is there

and than I tried to mount the vg1/lv0 which worked fine
but the data was not at snapshot view
even mounting vg1/lvsnap works fine
but with wrong data

confused over how and why vgmerge should be used as vgsplit does the work?

regards Tomas

Sent from my iPhone

> On 7 Sep 2020, at 18:42, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> 
> ﻿Dne 07. 09. 20 v 18:34 Tomas Dalebjörk napsal(a):
>> thanks for feedback
>> so if I understand this correctly
>> # fallocate -l 100M /tmp/pv1
>> # fallocate -l 100M /tmp/pv2
>> # fallocate -l 100M /tmp/pv3
>> # losetup —find —show /tmp/pv1
>> # losetup —find —show /tmp/pv2
>> # losetup —find —show /tmp/pv3
>> # vgcreate vg0 /dev/loop0
>> # lvcreate -n lv0 -l 1 vg0
>> # vgextend vg0 /dev/loop1
>> # lvcreate -s -l 1 -n lvsnap /dev/loop1
>> # vgchange -a n vg0
>> # lvconvert —splitsnapshot vg0/lvsnap
>> # vgreduce vg0 /dev/loop1
> 
> 
> Hi
> 
> Here you would need to use 'vgsplit' rather - otherwise you
> loose the mapping for whatever was living on /dev/loop1
> 
>> # vgcreate vg1 /dev/loop2
>> # lvcreate -n lv0 -l 1 vg1
>> # vgextend vg1 /dev/loop1
> 
> And  'vgmerge'
> 
> 
>> # lvconvert -s vg1/lvsnap vg1/lv0
>> not sure if the steps are correct?
> 
> 
> I hope you realize the content of vg1/lv0 must be exactly same
> as vg0/lv0.
> 
> As snapshot COW volume contains only 'diff chunks' - so if you
> would attach snapshot to 'different' lv - you would get only mess.
> 
> 
> Zdenek
> 
