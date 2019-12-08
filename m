Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13E0910AF9CF
	for <linux-lvm@redhat.com>; Sun,  8 Dec 2019 11:57:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 390F81006A90
	for <linux-lvm@redhat.com>; Sun,  8 Dec 2019 11:57:45 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 08 Dec 2019 12:57:36 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <alpine.LRH.2.21.1912071804540.9108@fairfax.gathman.org>
References: <1p3erjcoc4qsk3gplvduhoep.1575740265800@gmail.com>
	<alpine.LRH.2.21.1912071532450.27214@fairfax.gathman.org>
	<24044.11058.338208.602498@quad.stoffel.home>
	<alpine.LRH.2.21.1912071804540.9108@fairfax.gathman.org>
Message-ID: <4851bf1ac6d1dca625598bbfe3a28b8c@assyoma.it>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm]
	=?utf-8?q?Best_way_to_run_LVM_over_multiple_SW_RAIDs?=
	=?utf-8?q?=3F?=
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

Il 08-12-2019 00:14 Stuart D. Gathman ha scritto:
> On Sat, 7 Dec 2019, John Stoffel wrote:
> 
>> The biggest harm to performance here is really the RAID5, and if you
>> can instead move to RAID 10 (mirror then stripe across mirrors) then
>> you should be a performance boost.
> 
> Yeah, That's what I do.  RAID10, and use LVM to join together as JBOD.
> I forgot about the raid 5 bottleneck part, sorry.
> 
>> As Daniel says, he's got lots of disk load, but plenty of CPU, so the
>> single thread for RAID5 is a big bottleneck.
> 
>> I assume he wants to use LVM so he can create volume(s) larger than
>> individual RAID5 volumes, so in that case, I'd probably just build a
>> regular non-striped LVM VG holding all your RAID5 disks.  Hopefully
> 
> Wait, that's what I suggested!
> 
>> If you can, I'd get more SSDs and move to RAID1+0 (RAID10) instead,
>> though you do have the problem where a double disk failure could kill
>> your data if it happens to both halves of a mirror.
> 
> No worse than raid5.  In fact, better because the 2nd fault always
> kills the raid5, but only has a 33% or less chance of killing the
> raid10.  (And in either case, it is usually just specific sectors,
> not the entire drive, and other manual recovery techniques can come 
> into
> play.)

While I agree with both (especially regarding RAID10), I propose another 
setup: and MD RAID0 of the eight MD RAID5 arrays.
If I remember correctly, LVM striping code is based on device mapper 
rather than MD RAID code. Maybe the latter is more efficient at striping 
on fast NVMe drives?

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
