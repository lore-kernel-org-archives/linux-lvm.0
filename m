Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qAFB1Fex005024
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2012 06:01:17 -0500
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAFB1DVw005613
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2012 06:01:13 -0500
Received: by mail-vc0-f174.google.com with SMTP id fk26so1771664vcb.33
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2012 03:01:13 -0800 (PST)
Message-ID: <50A4CB76.3020403@gmail.com>
Date: Thu, 15 Nov 2012 12:01:10 +0100
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <20121114151612.GD14396@jajo.eggsoft> <50A4B14F.5050700@gmail.com>
	<20121115100852.GA19632@jajo.eggsoft>
In-Reply-To: <20121115100852.GA19632@jajo.eggsoft>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Why do lvcreate with clvmd insist on VG being
 available on all nodes?
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jacek Konieczny <jajcus@jajcus.net>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 15.11.2012 11:08, Jacek Konieczny napsal(a):
> On Thu, Nov 15, 2012 at 10:09:35AM +0100, Zdenek Kabelac wrote:
>>> work properly, as I would expect (make the volume available/unavailable
>>> on the node). But an attempt to create a new volume:
>>>
>>> lvcreate -n new_volume -L 1M shared_vg
>>>
>>> fails with:
>>>
>>> Error locking on node 1: Volume group for uuid not found: Hlk5NeaVF0qhDF20RBq61EZaIj5yyUJgGyMo5AQcLfZpJS0DZUcgj7QMd3QPWICL
>>>
>>
>>
>> Haven't really tried to understand what are you trying to achieve,
>> but if you want to have node being activated only on one cluster node,
>> you may easily use    lvcreate -aey  option.
>>
>> If you are using default clustered operation - it's not surprising,
>> the operation is refused if other nodes are not responding.
>
> Hmmm didn't though about the initial activation. In fact, I don't need
> that volume activated as soon as it is created. You are right, I should
> try 'lvcreate -aey' or 'lvcreate -an'.
>
> My stupid mistake, indeed.
>
> 'lvcreate -an -Z n' and 'lvcreate -aey' do work in such case.
>
> Though, LVM have some problems with tracking the exclusive activations
> later…

If you know about any such bug - just open rhbz with full description of such 
erroneous case.



>>> Indeed, the VG is not available at the standby node at that moment. But,
>>> as it is not available there, I see no point in locking it there.
>>
>> Well - you would need to write your own type of locking with support
>> of 'standby'  currently clvmd doesn't work with such state (and it's not
>> quite clear to me how it actually should even work).
>> So far either node is in cluster or is fenced.
>
> I will try to make this work somehow… I don't think a node in standby
> (or when one of the VGs is not available there) should be quite
> different that one fenced.
>
>>> When clvmd is stopped on the inactive node and 'clvmd -S' has been run
>>> on the active node, then both 'lvchange' and 'lvcreate' work as
>>> expected, but that doesn't look like a graceful switch-over. And another
>>> 'clvmd -S' stopped clvmd all together (this seems like a bug to me)
>>>
>>> And one more thing bothers me… my system would be very scalable to many
>>> nodes, where only two share active storage (when using DRBD). But this
>>> won't work if LVM would refuse some operations when any VG is not
>>> available on all nodes.
>>
>> Obviously using clustered VG in non-clustered environment isn't smart plan.
>> What you could do - is to   disable clustering support on VG
>
> Clusters do not have to be symmetrical. Cluster when different nodes
> have a bit different set of resources available are still clusters.

You want to support different scheme - thus you need to probably write your 
own clvmd-like daemon to cover all new cases you bring in with non-symmetrical 
cases.

> I do need clustering locking – in case a volume group is available on
> a few nodes it must not be possible to more than one node use any of the
> logical volumes there.

clvmd typical use case is  'vg' used on couple cluster nodes.

While you are probably trying to use  N:M mapping of vg and clustered nodes.

>
>> Note - you may always go around any locking problem with the above config
>> option - just do not report then problems with broken disk content and badly
>> activated volumes on cluster nodes.
>
> I am aware of the risks. That is why I do use clvmd. I don't quite
> understand some of the clvmd behaviour and I wrote here to know if there
> are some other risks taken into account by clvmd that I am not aware of.
>
> It seem I still need some work and learning to make it work properly.

You could surely create something to support your specific use case,
however clvmd needs to have some predictable behaviour in many error-case 
scenarios - and this is when you would need to start to think hard, how to 
resolve them in your non-symmetrical case.

Zdenek
