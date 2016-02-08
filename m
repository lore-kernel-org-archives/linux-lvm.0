Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u194luen015017
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 8 Feb 2016 23:47:56 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26]) by mx1.redhat.com (Postfix) with ESMTPS id 9C18B3298
	for <linux-lvm@redhat.com>; Tue,  9 Feb 2016 04:47:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id DF84F205F8
	for <linux-lvm@redhat.com>; Mon,  8 Feb 2016 23:42:38 -0500 (EST)
Received: from ebox.rath.org (ebox.rath.org [45.79.69.51])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8D9F16800E0
	for <linux-lvm@redhat.com>; Mon,  8 Feb 2016 23:42:38 -0500 (EST)
Received: from vostro.rath.org (vostro [192.168.12.4])
	by ebox.rath.org (Postfix) with ESMTPS id C3DE01CD0B3
	for <linux-lvm@redhat.com>; Tue,  9 Feb 2016 04:42:37 +0000 (UTC)
From: Nikolaus Rath <Nikolaus@rath.org>
In-Reply-To: <20160208091705.GA1612@rh-vpn> (Joe Thornber's message of "Mon, 8
	Feb 2016 09:17:06 +0000")
Date: Mon, 08 Feb 2016 14:05:24 -0800
References: <87a8nctl7x.fsf@vostro.rath.org> <20160208091705.GA1612@rh-vpn>
Message-ID: <87r3gm8pfn.fsf@vostro.rath.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvmcache performance
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
To: linux-lvm@redhat.com

On Feb 08 2016, Joe Thornber <thornber@redhat.com> wrote:
> On Sun, Feb 07, 2016 at 10:43:30AM -0800, Nikolaus Rath wrote:
>> Is that the wrong expectation? But even then, shouldn't I at least see
>> some improvement?
>
> Firstly, if you have the latest software, I suggest you switch to the
> smq cache policy which is generally out performing the old mq policy
> substantially.

Will try, thanks.


> Secondly, I think you may need to reset your expectations a bit.
> dm-cache is a slow moving cache.  It monitors IO, detectings hotspots
> on the disk and then 'promotes' those regions to the SSD.  You may
> find that the reads that occur during a boot, occur only infrequently
> once the system is booted.

Well, yes, but since in my case the cache is bigger than the origin,
shouldn't eventually *everything* end-up in the cache?

Is there a way to tell how often I need to access a block for it to be
promoted? I was hoping that the {read,write}_promote_adjustement
settings would actually cause promotion on the first access.


Best,
-Nikolaus

(No Cc on replies please, I'm reading the list)
-- 
GPG encrypted emails preferred. Key id: 0xD113FCAC3C4E599F
Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E 599F

             »Time flies like an arrow, fruit flies like a Banana.«
