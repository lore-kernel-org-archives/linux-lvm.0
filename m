Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9IDhIcg025817
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2012 09:43:18 -0400
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9IDhHLb004187
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2012 09:43:17 -0400
Received: by mail-vc0-f174.google.com with SMTP id fk26so6290712vcb.33
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2012 06:43:16 -0700 (PDT)
Message-ID: <50800770.7080708@gmail.com>
Date: Thu, 18 Oct 2012 15:43:12 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CB12DB70-5C4F-4936-9EDE-BFF4096D064F@active.ee>
	<507FDA2E.8080301@redhat.com> <508003F1.8090308@shiftmail.org>
In-Reply-To: <508003F1.8090308@shiftmail.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] how to recover after thin pool metadata did fill up?
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
Cc: Andres Toomsalu <andres@active.ee>, Spelic <spelic@shiftmail.org>

Dne 18.10.2012 15:28, Spelic napsal(a):
> On 10/18/12 12:30, Zdenek Kabelac wrote:
>> Dne 17.10.2012 22:21, Andres Toomsalu napsal(a):
>>> Hi,
>>>
>>> I'm aware that thin provisioning is not yet production ready (no metadata
>>> resize) - but is there a way to recover from thin pool failure when pool
>>> metadata was filled up?
>>>
>>>
>>
>>
>> Unfortunately there is no 'easy' advice for now yet - you hit current
>> Achilles heel of thinp support in lvm2 - we are thinking how to make
>> recovery usable for user - but it's not easy task since many things are
>> making it very complex - so it still needs some month of work.
>>
>
> So, supposing one is aware of this problem beforehand, at pool creation
> can this problem be worked around by using --poolmetadatasize  to make a
> metadata volume much larger than the default?
>
> And if yes, do you have any advice on the metadata size we should use?
>

It really depends on the pool size and use-cases.

The max size is ~16GB for metadata.
The reasonable max size is probably within  4GB if you want to stay safe in 
the most possible conditions.

With 3.7 kernel and the next release of lvm2 (2.02.99) it's expected full 
support for live size extension of metadata device.

Zdenek
