Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 846DDA2898
	for <linux-lvm@redhat.com>; Sat,  7 Dec 2019 23:14:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BFF9867471
	for <linux-lvm@redhat.com>; Sat,  7 Dec 2019 23:14:12 +0000 (UTC)
Received: from wiki.gathman.org ([IPv6:2001:470:8:809::2])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id xB7NE5k9000559
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 7 Dec 2019 18:14:08 -0500
Date: Sat, 7 Dec 2019 18:14:05 -0500 (EST)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <24044.11058.338208.602498@quad.stoffel.home>
Message-ID: <alpine.LRH.2.21.1912071804540.9108@fairfax.gathman.org>
References: <1p3erjcoc4qsk3gplvduhoep.1575740265800@gmail.com>
	<alpine.LRH.2.21.1912071532450.27214@fairfax.gathman.org>
	<24044.11058.338208.602498@quad.stoffel.home>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Best way to run LVM over multiple SW RAIDs?
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

On Sat, 7 Dec 2019, John Stoffel wrote:

> The biggest harm to performance here is really the RAID5, and if you
> can instead move to RAID 10 (mirror then stripe across mirrors) then
> you should be a performance boost.

Yeah, That's what I do.  RAID10, and use LVM to join together as JBOD.
I forgot about the raid 5 bottleneck part, sorry.

> As Daniel says, he's got lots of disk load, but plenty of CPU, so the
> single thread for RAID5 is a big bottleneck.

> I assume he wants to use LVM so he can create volume(s) larger than
> individual RAID5 volumes, so in that case, I'd probably just build a
> regular non-striped LVM VG holding all your RAID5 disks.  Hopefully

Wait, that's what I suggested!

> If you can, I'd get more SSDs and move to RAID1+0 (RAID10) instead,
> though you do have the problem where a double disk failure could kill
> your data if it happens to both halves of a mirror.

No worse than raid5.  In fact, better because the 2nd fault always
kills the raid5, but only has a 33% or less chance of killing the
raid10.  (And in either case, it is usually just specific sectors,
not the entire drive, and other manual recovery techniques can come into
play.)

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
