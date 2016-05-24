MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 24 May 2016 18:16:27 +0200
From: Xen <xen@dds.nl>
In-Reply-To: <aeba9dc1-e51f-a68d-c0d9-28c606368eb6@redhat.com>
References: <d38a602864c07cd1ee5cd4d12a7d0383@dds.nl>
	<aeba9dc1-e51f-a68d-c0d9-28c606368eb6@redhat.com>
Message-ID: <54a610e7877911e94d1384c01cc3eac8@dds.nl>
Subject: Re: [linux-lvm] auto umount at thin meta 80%
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
Cc: Zdenek Kabelac <zkabelac@redhat.com>

Zdenek Kabelac schreef op 23-05-2016 10:40:

> At this moment -   any failure in  'lvresize' execution leads to
> immediate umount - tool went ballistic and so takes 'drastic' action
> to prevent further
> damage.

I was more worried about why a default sized (auto-created) meta volume 
would fill up almost completely after 3 hours of use.

> See here again:
> 
> https://www.redhat.com/archives/linux-lvm/2016-May/msg00064.html

That message is empty, there is nothing in it.

My computer automatically deletes it when messages such as these come 
by.

It's just a failsafe against time wasting and all that.

Maybe LVM could learn from it, but then it deletes volumes maybe too :p.

Regards lol.


> ATM there is some new code which unconditionally always connects to 
> lvmetad
> even it's not necessary at all - and it's potential source of many 
> other
> troubles - so fixes here are in progress  -   set 'use_lvmetad=0'  if
> it's still a problem in your case.

Right. Well I haven't been able to use my cache again, the SSD seems 
faulty. But. I haven't utilized it to the same extent yet. But. It's now 
at about 17% of the original value (I mean what was 100% back then). 
It's just 4x the size. I can't have stuff like this happening you know. 
I just created it at 4x the default size. Maybe it will work for a 
while.

Regards.
