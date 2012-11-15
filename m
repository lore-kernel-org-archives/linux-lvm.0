Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qAFGkrRa018917
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2012 11:46:53 -0500
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAFGko34014455
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2012 11:46:51 -0500
Received: by mail-ee0-f46.google.com with SMTP id b15so1247610eek.33
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2012 08:46:50 -0800 (PST)
Message-ID: <50A51AEC.3090707@gmail.com>
Date: Thu, 15 Nov 2012 17:40:12 +0100
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <20121114151612.GD14396@jajo.eggsoft> <50A4B14F.5050700@gmail.com>
	<20121115100852.GA19632@jajo.eggsoft> <50A4CB76.3020403@gmail.com>
	<20121115133014.GB19632@jajo.eggsoft>
In-Reply-To: <20121115133014.GB19632@jajo.eggsoft>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Jacek Konieczny <jajcus@jajcus.net>

Dne 15.11.2012 14:30, Jacek Konieczny napsal(a):
> On Thu, Nov 15, 2012 at 12:01:10PM +0100, Zdenek Kabelac wrote:
>> Dne 15.11.2012 11:08, Jacek Konieczny napsal(a):
>>> On Thu, Nov 15, 2012 at 10:09:35AM +0100, Zdenek Kabelac wrote:
>>>>> work properly, as I would expect (make the volume available/unavailable
>>>>> on the node). But an attempt to create a new volume:
>>>>>
>>>>> lvcreate -n new_volume -L 1M shared_vg
>>>>>
>>>>> fails with:
>>>>>
>>>>> Error locking on node 1: Volume group for uuid not found: Hlk5NeaVF0qhDF20RBq61EZaIj5yyUJgGyMo5AQcLfZpJS0DZUcgj7QMd3QPWICL
>>>>>
>
>>>> Haven't really tried to understand what are you trying to achieve,
>>>> but if you want to have node being activated only on one cluster node,
>>>> you may easily use    lvcreate -aey  option.
>>>>
>>> My stupid mistake, indeed.
>>>
>>> 'lvcreate -an -Z n' and 'lvcreate -aey' do work in such case.
>
>
>>> Though, LVM have some problems with tracking the exclusive activations
>>> later…
>>
>> If you know about any such bug - just open rhbz with full description of such
>> erroneous case.
>
> It was just another mistake of mine. LVM properly tracks the exclusive
> locks – the volumes were being deactivated by something else.
>
>>> Clusters do not have to be symmetrical. Cluster when different nodes
>>> have a bit different set of resources available are still clusters.
>>
>> You want to support different scheme - thus you need to probably write your
>> own clvmd-like daemon to cover all new cases you bring in with non-symmetrical
>> cases.
>
> I think this will not be needed.
>
>> clvmd typical use case is  'vg' used on couple cluster nodes.
>
> I see.
>
>> While you are probably trying to use  N:M mapping of vg and clustered nodes.
>
> Exactly. But it seems it should not be a problem in my case.
>
>
> After knowing my mistake I can see LVM already provides the
> On Thu, Nov 15, 2012 at 12:01:10PM +0100, Zdenek Kabelac wrote:
>> Dne 15.11.2012 11:08, Jacek Konieczny napsal(a):
>>> On Thu, Nov 15, 2012 at 10:09:35AM +0100, Zdenek Kabelac wrote:
>>>>> work properly, as I would expect (make the volume available/unavailable
>>>>> on the node). But an attempt to create a new volume:
>>>>>
>>>>> lvcreate -n new_volume -L 1M shared_vg
>>>>>
>>>>> fails with:
>>>>>
>>>>> Error locking on node 1: Volume group for uuid not found: Hlk5NeaVF0qhDF20RBq61EZaIj5yyUJgGyMo5AQcLfZpJS0DZUcgj7QMd3QPWICL
>>>>>
>
>>>> Haven't really tried to understand what are you trying to achieve,
>>>> but if you want to have node being activated only on one cluster node,
>>>> you may easily use    lvcreate -aey  option.
>>>>
>>> My stupid mistake, indeed.
>>>
>>> 'lvcreate -an -Z n' and 'lvcreate -aey' do work in such case.
>
>
>>> Though, LVM have some problems with tracking the exclusive activations
>>> later…
>>
>> If you know about any such bug - just open rhbz with full description of such
>> erroneous case.
>
> It was just another mistake of mine. LVM properly tracks the exclusive
> locks – the volumes were being deactivated by something else.
>
>>> Clusters do not have to be symmetrical. Cluster when different nodes
>>> have a bit different set of resources available are still clusters.
>>
>> You want to support different scheme - thus you need to probably write your
>> own clvmd-like daemon to cover all new cases you bring in with non-symmetrical
>> cases.
>
> I think this will not be needed.
>
>> clvmd typical use case is  'vg' used on couple cluster nodes.
>
> I see.
>
>> While you are probably trying to use  N:M mapping of vg and clustered nodes.
>
> Exactly. But it seems it should not be a problem in my case.
>
> After knowing my mistake I can see LVM already provides the
> functionality I need.
>
> To summarize:
>
> - The default LV activation mode is '-ay', which means, for clustered
>    volume groups, that the volume is to be active on every node in the
>    cluster.
>
> – The activation is not always explicit. 'lvcreate' uses '-ay' when no
>    other '-a' option is given.
>
> – The '-ay' activation won't work if any node in the cluster cannot
>    access the volume group (e.g. when the DRBD device holding it is
>    Secondary or not configured at that node).
>
> – However, my use case doesn't need more than one node using any of the
>    volumes at any time. In fact, it is very important that only a single
>    machine uses each LV at a time.
>
> – For this scenario '-aey' should be always used.
>
> – Explicitly using '-aey' with 'lvcreate' fixes the 'Volume group for
>    uuid not found' for me.
>
> – Other tests made showed that the locking works as expected when
>    a volume group becomes available and unavailable on various cluster
>    nodes. A node having access to a VG can create and/or activate LVs
>    there in exclusive node and all other nodes will comply with that
>    lock whenever they gain access to this VG.
>
> So, it seems that clvmd is not that bound to the 'symmetrical cluster'
> scenario, provided no more than one node needs to access a volume at
> a time.
>
> Does this make sense?
>

I'm still somewhat confused with your term  'stand-by' cluster node.
But it looks like -aey mostly fixes your problems.

Zdenek
