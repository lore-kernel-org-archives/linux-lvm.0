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
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <45079be3-aa18-01f4-a663-7015c018e6f1@redhat.com>
Date: Thu, 21 Sep 2017 11:49:18 +0200
MIME-Version: 1.0
In-Reply-To: <e313e53f07abafead1713f03cf179542@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 20.9.2017 v 15:05 Xen napsal(a):
> Gionatan Danti schreef op 18-09-2017 21:20:
> 
>> Xen, I really think that the combination of hard-threshold obtained by
>> setting thin_pool_autoextend_threshold and thin_command hook for
>> user-defined script should be sufficient to prevent and/or react to
>> full thin pools.
> 
> I will hopefully respond to Zdenek's message later (and the one before that 
> that I haven't responded to),
> 
>> I'm all for the "keep it simple" on the kernel side.
> 
> But I don't mind if you focus on this,
> 
>> That said, I would like to see some pre-defined scripts to easily
>> manage pool fullness. (...) but I would really
>> like the standardisation such predefined scripts imply.
> 
> And only provide scripts instead of kernel features.
> 
> Again, the reason I am also focussing on the kernel is because:
> 
> a) I am not convinced it cannot be done in the kernel
> b) A kernel feature would make space reservation very 'standardized'.


Hi

Some more 'light' into the existing state as this is really not about what can 
and what cannot be done in kernel - as clearly you can do 'everything' in 
kernel - if you have the code for it...

I'm here explaining position of lvm2 - which is user-space project (since we 
are on lvm2 list) - and lvm2 is using  'existing'  dm  kernel target which 
provides  thin-provisioning (and has it's configurables). So this is kernel 
piece and differs from user-space lvm2 counterpart.

Surely there is cooperation between these two - but anyone else can write some 
other 'dm'  target - and lvm2 can extend support for given  target/segment 
type if such target is used by users.

In practice your 'proposal' is quite different from the existing target - 
essentially major rework if not a whole new re-implementation  - as it's not 
'a few line' patch extension  which you might possibly believe/hope into.

I can (and effectively I've already spent a lot of time) explaining the 
existing logic and why it is really hardly doable with current design, but we 
cannot work on support for 'hypothetical' non-existing kernel target from lvm2 
side - so you need to start from 'ground-zero' level on dm target design....
or you need to 'reevaluate' your vision to be more in touch with existing 
kernel target output...

However we believe our exiting solution in 'user-space' can cover most common 
use-cases and we might just have 'big-holes' in providing better documentation 
to explain reasoning and guide users to use existing technology in more 
optimal way.

> 
> The point is that kernel features make it much easier to standardize and to 
> put some space reservation metric in userland code (it becomes a default 
> feature) and scripts remain a little bit off to the side.

Maintenance/devel/support of kernel code is more expensive - it's usually very 
easy to upgrade small 'user-space' encapsulated package - compared with major 
changes on kernel side.

So that's where dm/lvm2 design gets from - do the 'minimum necessary' inside 
kernel and  maximize usage of user-space.

Of course this decision makes some tasks harder (i.e. there are surely 
problems which would not even exist if it would be done in kernel)  - but lots 
of other things are way easier - you really can't compare those....

Yeah - standards are always problem :)  i.e. Xorg & Wayland....
but it's way better to play with user-space then playing with kernel....

> However if we *can* standardize on some tag or way of _reserving_ this space, 
> I'm all for it.

Problems of a desktop user with 0.5TB SSD are often different with servers 
using 10PB across multiple network-connected nodes.

I see you call for one standard - but it's very very difficult...


> I think a 'critical' tag in combination with the standard autoextend_threshold 
> (or something similar) is too loose and ill-defined and not very meaningful.

We look for delivering admins rock-solid bricks.

If you make small house or you build a Southfork out of it is then admins' choice.

We have spend really lot of time thinking if there is some sort of 
'one-ring-to-rule-them-all' solution - but we can't see it yet - possibly 
because we know wider range of use-cases compared with individual user-focused 
problem.

> And I would prefer to set individual space reservation for each volume even if 
> it can only be compared to 5% threshold values.

Which needs 'different' kernel target driver (and possibly some way to 
kill/split page-cache to work on 'per-device' basis....)

And just as an illustration of problems you need to start solving for this design:

You have origin and 2 snaps.
You set different 'thresholds' for these volumes  -
You then overwrite 'origin'  and you have to maintain 'data' for OTHER LVs.
So you get into the position - when 'WRITE' to origin will invalidate volume 
that is NOT even active (without lvm2 being even aware).
So suddenly rather simple individual thinLV targets  will have to maintain 
whole 'data set' and cooperate with all other active thins targets in case 
they share some data.... - so in effect WHOLE data tree needs to be 
permanently accessed -  this could be OK when you focus for use of 3 volumes
with at most couple hundreds GiB of addressable space - but does not 'fit' 
well for 1000LVs and PB of addressable data.


Regards

Zdenek
