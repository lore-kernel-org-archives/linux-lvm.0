References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<aca4355a-d7f3-c116-fc7b-7379f269a21a@assyoma.it>
	<B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
	<f2e24a01b1e548b6b15db6d30596208b@xenhideout.nl>
	<595ff1d4-3277-ca5e-a18e-d62eaaf0b1a0@redhat.com>
	<9aa2d67c38af3e4042bd3f37559b799d@xenhideout.nl>
	<eb24f4de-2b58-38a4-9c8d-950a36530ed7@redhat.com>
	<2d1025d7784ab44cbc03cfe7f6778599@xenhideout.nl>
	<58f99204-d978-3f6a-9db8-b7122b30575e@redhat.com>
	<458d105938796d90f4e426bc458e8cc4@xenhideout.nl>
	<f7665fc3546d23200e9b08c6cdb67d2e@xenhideout.nl>
	<67e57de26f65447bde9e55bcf9a99ccc@xenhideout.nl>
	<d4b39ca6a299eb609f27f99e24eb7e26@assyoma.it>
	<e313e53f07abafead1713f03cf179542@xenhideout.nl>
	<45079be3-aa18-01f4-a663-7015c018e6f1@redhat.com>
	<5a579d450c0b079c3bc635eeb70e7c62@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <943c9d2c-0dd6-5d9a-ce98-6b30d12824fc@redhat.com>
Date: Thu, 21 Sep 2017 15:02:25 +0200
MIME-Version: 1.0
In-Reply-To: <5a579d450c0b079c3bc635eeb70e7c62@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: Xen <list@xenhideout.nl>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 21.9.2017 v 12:22 Xen napsal(a):
> Hi,
> 
> thank you for your response once more.
> 
> Zdenek Kabelac schreef op 21-09-2017 11:49:
> 
>> Hi
>>
>> Of course this decision makes some tasks harder (i.e. there are surely
>> problems which would not even exist if it would be done in kernel)� -
>> but lots of other things are way easier - you really can't compare
>> those....
> 
> I understand. But many times lack of integration of shared goal of multiple 
> projects is also big problem in Linux.

And you also have project that do try to integrate shared goals like btrfs.


>>> However if we *can* standardize on some tag or way of _reserving_ this 
>>> space, I'm all for it.
>>
>> Problems of a desktop user with 0.5TB SSD are often different with
>> servers using 10PB across multiple network-connected nodes.
>>
>> I see you call for one standard - but it's very very difficult...
> 
> I am pretty sure that if you start out with something simple, it can extend 
> into the complex.

We hope community will provide some individual scripts...
Not a big deal to integrate them into repo dir...

>> We have spend really lot of time thinking if there is some sort of
>> 'one-ring-to-rule-them-all' solution - but we can't see it yet -
>> possibly because we know wider range of use-cases compared with
>> individual user-focused problem.
> 
> I think you have to start simple.

It's mostly about what can be supported 'globally'
and what is rather 'individual' customization.


> You can never come up with a solution if you start out with the complex.
> 
> The only thing I ever said was:
> - give each volume a number of extents or a percentage of reserved space if 
> needed

Which can't be deliver with current thinp technology.
It's simply too computational invasive for our targeted performance.

The only deliverable we have is - you create a 'cron' job that does hard 
'computing' once in a while - and makes some 'action' when individual 
'volumes' goes out of their preconfigured boundaries.  (often such logic is 
implemented outside of lvm2 - in some DB engine - since   lvm2 itself is 
really NOT a high performing DB - the ascii format has it's age....)

You can't get this 'percentage' logic online in kernel (aka while you update 
individual volume).


> - for all the active volumes in the thin pool, add up these numbers
> - when other volumes require allocation, check against free extents in the pool

I assume you possibly missed this logic of thin-p:

When you update origin - you always allocate FOR origin, but allocated chunk
remains claimed by snapshots (if there are any).

So if snapshot shared all pages with the origin at the beginning (so basically 
consumed only some 'metadata' space and 0% real exclusive own space)  - after 
full rewrite of the origin your snapshot suddenly 'holds' all the old chunks 
(100% of its size)

So when you 'write' to ORIGIN - your snapshot which becomes bigger in terms of 
individual/exclusively owned chunks - so if you have i.e. configured snapshot 
to not  consume more then  XX% of your pool - you would simply need to recalc 
this with every update on shared chunks....

And as has been already said - this is currently unsupportable 'online'

Another aspect here is - thin-pool has  no idea about 'history' of volume 
creation - it doesn't not know  there is volume X being snapshot of volume Y - 
this all is only 'remembered' by lvm2 metadata  -  in kernel - it's always 
like  -  volume X  owns set of chunks  1...
That's all kernel needs to know for a single thin volume to work.

You can do it with 'reasonable' delay in user-space upon 'triggers' of global 
threshold  (thin-pool fullness).

> - possibly deny allocation for these volumes


Unsupportable in 'kernel' without rewrite and you can i.e. 'workaround' this 
by placing 'error' targets in place of less important thinLVs...

Imagine you would get pretty random 'denials' of your WRITE request depending 
on interaction with other snapshots....


Surely if use 'read-only' snapshot you may not see all related problems, but 
such a very minor subclass of whole provisioning solution is not worth a 
special handling of whole thin-p target.



> I did not know or did not realize the upgrade paths of the DM module(s) and 
> LVM2 itself would be so divergent.

lvm2 is  volume manager...

dm is implementation layer for different 'segtypes' (in lvm2 terminology).

So i.e. anyone can write his own 'volume manager'  and use 'dm'  - it's fully 
supported - dm is not tied to lvm2 and is openly designed  (and used by other 
projects)....


> So my apologies for that but obviously I was talking about a full-system 
> solution (not partial).

yep - 2 different worlds....

i.e. crypto, multipath,...



>> You have origin and 2 snaps.
>> You set different 'thresholds' for these volumes� -
> 
> I would not allow setting threshold for snapshots.
> 
> I understand that for dm thin target they are all the same.
> 
> But for this model it does not make sense because LVM talks of "origin" and 
> "snapshots".
> 
>> You then overwrite 'origin'� and you have to maintain 'data' for OTHER LVs.
> 
> I don't understand. Other LVs == 2 snaps?

yes - other LVs are snaps in this example...


> 
>> So you get into the position - when 'WRITE' to origin will invalidate
>> volume that is NOT even active (without lvm2 being even aware).
> 
> I would not allow space reservation for inactive volumes.

You are not 'reserving' any space as the space already IS assigned to those 
inactive volumes.

What you would have to implement is to TAKE the space FROM them to satisfy 
writing task to your 'active' volume and respect prioritization...

If you will not implement this 'active' chunk 'stealing' - you are really ONLY 
shifting 'hit-the-wall' time-frame....  (worth possibly couple seconds only of 
your system load)...

In other words - tuning 'thresholds' in userspace's 'bash' script will give 
you very same effect as if you are focusing here on very complex 'kernel' 
solution.


Regards

Zdenek
