MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Sep 2017 12:22:11 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <45079be3-aa18-01f4-a663-7015c018e6f1@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
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
Message-ID: <5a579d450c0b079c3bc635eeb70e7c62@xenhideout.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

thank you for your response once more.

Zdenek Kabelac schreef op 21-09-2017 11:49:

> Hi
> 
> Some more 'light' into the existing state as this is really not about
> what can and what cannot be done in kernel - as clearly you can do
> 'everything' in kernel - if you have the code for it...

Well thank you for that ;-).

> In practice your 'proposal' is quite different from the existing
> target - essentially major rework if not a whole new re-implementation
>  - as it's not 'a few line' patch extension  which you might possibly
> believe/hope into.

Well I understand that the solution I would be after would require 
modification to the DM target. I was not arguing for LVM alone; I 
assumed that since DM and LVM are both hosted in the same space there 
would be at least the idea of cooperation between the two teams.

And that it would not be too 'radical' to talk about both at the same 
time.

> Of course this decision makes some tasks harder (i.e. there are surely
> problems which would not even exist if it would be done in kernel)  -
> but lots of other things are way easier - you really can't compare
> those....

I understand. But many times lack of integration of shared goal of 
multiple projects is also big problem in Linux.

>> However if we *can* standardize on some tag or way of _reserving_ this 
>> space, I'm all for it.
> 
> Problems of a desktop user with 0.5TB SSD are often different with
> servers using 10PB across multiple network-connected nodes.
> 
> I see you call for one standard - but it's very very difficult...

I am pretty sure that if you start out with something simple, it can 
extend into the complex.

That's of course why an elementary kernel feature would make sense.

A single number. It does not get simpler than that.

I am not saying you have to.

I was trying to find out if your statements that something was 
impossible, was actually true.

You said that you need a completely new DM target from the ground up. I 
doubt that. But hey, you're the expert, not me.

I like that you say that you could provide an alternative to the regular 
DM target and that LVM could work with that too.

Unfortunately I am incapable of doing any development myself at this 
time (sounds like fun right) and I also of course could not myself test 
20 PB.

>> I think a 'critical' tag in combination with the standard 
>> autoextend_threshold (or something similar) is too loose and 
>> ill-defined and not very meaningful.
> 
> We look for delivering admins rock-solid bricks.
> 
> If you make small house or you build a Southfork out of it is then
> admins' choice.
> 
> We have spend really lot of time thinking if there is some sort of
> 'one-ring-to-rule-them-all' solution - but we can't see it yet -
> possibly because we know wider range of use-cases compared with
> individual user-focused problem.

I think you have to start simple.

You can never come up with a solution if you start out with the complex.

The only thing I ever said was:
- give each volume a number of extents or a percentage of reserved space 
if needed
- for all the active volumes in the thin pool, add up these numbers
- when other volumes require allocation, check against free extents in 
the pool
- possibly deny allocation for these volumes

I am not saying here you MUST do anything like this.

But as you say, it requires features in the kernel that are not there.

I did not know or did not realize the upgrade paths of the DM module(s) 
and LVM2 itself would be so divergent.

So my apologies for that but obviously I was talking about a full-system 
solution (not partial).

>> And I would prefer to set individual space reservation for each volume 
>> even if it can only be compared to 5% threshold values.
> 
> Which needs 'different' kernel target driver (and possibly some way to
> kill/split page-cache to work on 'per-device' basis....)

No no, here I meant to set it by a script or to read it by a script or 
to use it by a script.

> And just as an illustration of problems you need to start solving for
> this design:
> 
> You have origin and 2 snaps.
> You set different 'thresholds' for these volumes  -

I would not allow setting threshold for snapshots.

I understand that for dm thin target they are all the same.

But for this model it does not make sense because LVM talks of "origin" 
and "snapshots".

> You then overwrite 'origin'  and you have to maintain 'data' for OTHER 
> LVs.

I don't understand. Other LVs == 2 snaps?

> So you get into the position - when 'WRITE' to origin will invalidate
> volume that is NOT even active (without lvm2 being even aware).

I would not allow space reservation for inactive volumes.

Any space reservation is meant for safeguarding the operation of a 
machine.

Thus it is meant for active volumes.

> So suddenly rather simple individual thinLV targets  will have to
> maintain whole 'data set' and cooperate with all other active thins
> targets in case they share some data

I don't know what data sharing has to do with it.

The entire system only works with unallocated extents.
