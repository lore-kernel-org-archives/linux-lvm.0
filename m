References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
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
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d28886d4-598d-b458-14dd-c9ea460eb330@redhat.com>
Date: Mon, 18 Sep 2017 10:56:14 +0200
MIME-Version: 1.0
In-Reply-To: <458d105938796d90f4e426bc458e8cc4@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 17.9.2017 v 00:33 Xen napsal(a):
> Zdenek Kabelac schreef op 15-09-2017 11:22:
>=20
>> lvm2 makes them look the same - but underneath it's very different
>> (and it's not just by age - but also for targeting different purpose).
>>
>> - old-snaps are good for short-time small snapshots - when there is
>> estimation for having low number of changes and it's not a big issue
>> if snapshot is 'lost'.
>>
>> - thin-snaps are ideal for long-time living objects with possibility
>> to take snaps of snaps of snaps and you are guaranteed the snapshot
>> will not 'just dissapear' while you modify your origin volume...
>>
>> Both have very different resources requirements and performance...
>=20
> Point being that short-time small snapshots are also perfectly served by =
thin...

if you take into account other the constrain - like necessity of planning=20
small chunk sizes for thin-pool to have reasonably efficient snapshots,
not so small memory footprint - there are cases where short lived
snapshot is simply better choice.

> My root volume is not on thin and thus has an "old-snap" snapshot. If the=
=20
> snapshot is dropped it is because of lots of upgrades but this is no bigg=
y;=20
> next week the backup will succeed. Normally the root volume barely change=
s.

And you can really have VERY same behavior WITH thin-snaps.

All you need to do is - 'erase' your inactive thin volume snapshot before=20
thin-pool switches to out-of-space mode.

You really have A LOT of time (60seconds) to do this - even when thin-pool =

hits 100% fullness.

All you need to do is to write your 'specific' maintenance mode that will=20
'erase' volumes tagged/named with some specific name, so you can easily fin=
d=20
those LVs and 'lvremove' them when thin-pool is getting out of the space.

That's the advantage of 'inactive' snapshot.

If you have snapshot 'active' - you need to kill 'holders' (backup software=
),
umount volume and remove it.

Again - quite reasonably simple task when you know all 'variables'.

Hardly doable at generic level....


> So it would be possible to reserve regular LVM space for thin volumes as =
well=20

'reserve'  can't really be 'generic'.
Everyone has different view on what is 'safe' reserve.
And you loose a lot of space in unusable reserves...

I.e. think about  2000LV in single thin-pool - and design reserves....
Start to 'think big' instead of focusing on 3 thinLVs...


>> Thin-pool still does not support shrinking - so if the thin-pool
>> auto-grows to big size - there is not a way for lvm2 to reduce the
>> thin-pool size...
>=20
> Ah ;-). A detriment of auto-extend :p.

Yep - that's why we have not enable 'autoresize' by default.

It's admin decision ATM whether the free space in VG should be used by=20
thin-pool or something else.

It would be better is  there would be shrinking support - but it's not yet =
here...

> No if you only kept some statistics that would not amount to all the mapp=
ing=20
> data but only to a summary of it.

Why should kernel be doing some complex statistic management ?

(Again 'think-big' - kernel is not supposed to be parsing ALL metadata ALL =
the=20
time -  really  - in this case we could 'drop' all the user-space :) and sh=
ift=20
everything to kernel - and we end with similar complexity of kernel code as=
=20
the btrfs has....


> Say if you write a bot that plays a board game. While searching for moves=
 the=20
> bot has to constantly perform moves on the board. It can either create ne=
w=20
> board instances out of every move, or just mutate the existing board and =
be a=20
> lot faster.

Such bot  KNOW all the combination.. - you are constantly forgetting  thin =

volume target maps very small portion of the whole metadatata set.

> A lot of this information is easier to update than to recalculate, that i=
s,=20
> the moves themselves can modify this summary information, rather than der=
ive=20
> it again from the board positions.


Maybe you should try to write a chess-player then - AFAIK it's purely based=
 on=20
brutal CPU power and massive library of know 'starts' & 'finish'....

Your simplification proposal 'with summary' seems to be quite innovative he=
re...


> This is what I mean by "updating the metadata without having to recalcula=
te it".

When you propose is very different thin-pool architecture - so you should t=
ry=20
to talk with it's authors -  I can only provide you with  'lvm2' abstractio=
n=20
level details.

I cannot change kernel level....

The ideal upstreaming mechanism for a new target is to provide some at leas=
t=20
basic implementation proving the concept can work.

And you should also show how is this complicated kernel code giving any bet=
ter=20
result then current user-space solution we provide.


> You wouldn't have to keep the mapping information in RAM, just the amount=
 of=20
> blocks attributed and so on. A single number. A few single numbers for ea=
ch=20
> volume and each pool.

It really means  - kernel would need to read ALL data,
and do ALL validation in kernel   (which is currently work made in use-spac=
e)

Hopefully it's finally cleat at this point.

> But if it's not active, can it still 'trace' another volume? Ie. it has t=
o get=20
> updated if it is really a snapshot of something right.

Inactive volume CANNOT change - so it doesn't need to be traced.

> If it doesn't get updated (and not written to) then it also does not allo=
cate=20
> new extents.

Allocation of new chunks always happen for an active thin LV.

> However volumes that see new allocation happening for them, would then al=
ways=20
> reside in kernel memory right.
>=20
> You said somewhere else that overall data (for pool) IS available. But no=
t for=20
> volumes themselves?

Yes -  kernel knows how many 'free' chunks are in POOL.
Kernel does NOT know  how many individual chunks belongs to single thinLVs.

> Regardless with one volume as "master" I think a non-ambiguous interpreta=
tion=20
> arises?

There is no 'master' volume.

All thinLVs   are equal - and present only set of mapped chunks.
Just some of them can be mapped by more then one thinLV...


> So is or is not the number of uniquely owned/shared blocks known for each=
=20
> volume at any one point in time?


Unless you parse all metadata and create a big data structures for this inf=
o,
you do not have this information available.

>> You can use only very small subset of 'metadata' information for
>> individual volumes.
>=20
> But I'm still talking about only summary information...

I'm wondering how would you be updating such summery information in case you
have just simple 'fstrim' information.

To update such info - you would need 'backtrace'  ALL the 'released' blocks=
=20
for your fstrimed thin volume - figure out how many OTHER thinLV (snapst) w=
ere=20
sharing same  blocks - and update all their summary information.

Effectively you again need pretty complex data processing (which is otherwi=
se=20
ATM happening at user-space level with current design) to be shifted into k=
ernel.

I'm not saying it cannot be done - surely you can reach the goal (just like=
=20
btrfs) - but it's simply different design requiring to write completely=20
different kernel target and all user-land app.

It's not something we can reach with few months of codding...

> However with the appropriate amount of user friendliness what was first o=
nly=20
> for experts can be simply for more ordinary people ;-).

I assume you overestimate how many people works on the project...
We do the best we can...

> I mean, kuch kuch, if I want some SSD caching in Microsoft Windows, kuch =
kuch,=20
> I right click on a volume in Windows Explorer, select properties, select =

> ReadyBoost tab, click "Reserve complete volume for ReadyBoost", click oka=
y,=20
> and I'm done.

Do you think it's fair to compare us with  MS capacity  :)  ??


> It literally takes some 10 seconds to configure SSD caching on such a mac=
hine.
>=20
> Would probably take me some 2 hours in Linux not just to enter the comman=
ds=20
> but also to think about how to do it.

It's the open source world...



> So it made no sense to have to "figure this out" on your own. An enterpri=
se=20
> will be able to do so yes.
>=20
> But why not make it easier...

All which needs to happen is -  someone sits and write the code :)
Nothing else is really needed ;)

Hopefully my time invested into this low-level explanation will motivate=20
someone to write something for users....


> Yes again, apologies, but I was basing myself on Kernel 4.4 in Debian 8 w=
ith=20
> LVM 2.02.111 which, by now, is three years old hahaha.

Well we are at 2.02.174 -  so I'm really mainly interested for complains=20
against upstream version of lvm2.

There is not much point in discussing 3 years history...


> If the monitoring script can fail, now you need a monitoring script to mo=
nitor=20
> the monitoring script ;-).

Maybe you start to see why  'reboot' is not such a bad option...

>> You can always use normal device - it's really about the choice and purp=
ose...
>=20
> Well the point is that I never liked BTRFS.

Do not take this as some  'advocating' for usage of btrfs.

But all you are proposing here is mostly 'btrfs' design.

lvm2/dm  is quite different solution with different goals.



> BTRFS has its own set of complexities and people running around and tumbl=
ing=20
> over each other in figuring out how to use the darn thing. Particularly w=
ith=20
> regards to the how-to of using subvolumes, of which there seem to be many=
=20
> different strategies.

It's been BTRFS 'solution' how to overcome problems...

> And then Red Hat officially deprecates it for the next release. Hmmmmm.

Red Hat simply can't do everything for everyone...

> Sometimes there is annoying stuff like not being able to change a volume =
group=20
> (name) when a PV is missing, but if you remove the PV how do you put it b=
ack=20

You may possibly miss the complexity behind those operations.

But we try to keep them at 'reasonable' minimum.

Again please try to 'think' big when you have i.e. hundreds of PVs attached=
=20
over network... used in clusters...

There are surely things, which do look over-complicated when you have just =
2=20
disks in your laptop.....

But as it has been said - we address issues on 'generic' level...

You have states - and transition between states is defined in some way and =

applies for systems states XYZ....


> I guess certain things are difficult enough that you would really want a =
book=20
> about it, and having to figure it out is fun the first time but after tha=
t a=20
> chore.

Would be nice if someone would have wrote a book about it ;)

> You mean use a different pool for that one critical volume that can't run=
 out=20
> of space.
>=20
> This goes against the idea of thin in the first place. Now you have to gi=
ve up=20
> the flexibility that you seek or sought in order to get some safety becau=
se=20
> you cannot define any constraints within the existing system without=20
> separating physically.

Nope - it's still well within.

Imagine you have  a VG with  1TB space,
You create  0.2TB  'userdata'  thin-pool with some thins
and you create 0.2TB  'criticalsystem'  thin-pool with some thins.

Then you orchestrate growth of those 2 thin-pools according to your rules a=
nd=20
needs -  i.e. always need  0.1TB of free space in VG to get some space for =

system thin-pool.   You may even start to remove 'userdata' thin-pool in ca=
se=20
you would like to get some space for 'cricticalsystem'  thin-pool

There is NO solution to protect you again running out of system space when =
are=20
overprovissiong.

It always end with having  1TB thin-pool with  2TB volume on it.

You can't fit 2TB into 1TB so at some point in time every overprovisioning =
is=20
going to hit dead-end....


> I get that... building a wall between two houses is easier than having to=
=20
> learn to live together.
>=20
> But in the end the walls may also kill you ;-).
>=20
> Now you can't share washing machine, you can't share vacuum cleaner, you =
have=20
> to have your own copy of everything, including bath rooms, toilet, etc.
>=20
> Even though 90% of the time these things go unused.

When you share - you need to HEAVILY plan for everything.

There is always some price paid.

In many cases it's better to leave your vacuum cleaner unused for 99% of it=
s=20
time, just to be sure you can take ANYTIME you need....

You may also drop usage of modern CPUs which are 99% left unused....

So of course it's cheaper to share  - but is it comfortable??
Does it payoff??

Your pick....


> I understand, but does this mean that the NUMBER of free blocks is also a=
lways=20
> known?

Thin-pool knows how many blocks are 'free'.


> So isn't the NUMBER of used/shared blocks in each DATA volume also known?

It's not known per volume.

All you now  is  - thin-pool has size X and has free Y blocks.
Pool does not know how many thin-devices are there - unless you scan metada=
ta.

All known info is visible with  'dmsetup status'

Status report exposes all known info for thin-pool and for thin volumes.

All is described in kernel documentation for these DM targets.


> What about the 'used space'. Could you, potentially, theoretically, set a=
=20
> threshold for that? Or poll for that?

Clearly used_space is  'whole_space -  free_space'



> IF you could change the device mapper, THEN could it be possible to reser=
ve=20
> allocation space for a single volume???

You probably need to start then discussion at more kernel oriented DM list.

> Logically there are only two conditions:
>=20
> - virtual free space for critical volume is smaller than its reserved spa=
ce
> - virtual free space for critical volume is bigger than its reserved space
>=20
> If bigger, then all the reserved space is necessary to stay free
> If smaller, then we don't need as much.

You can implement all this logic with existing lvm2 2.02.174.
Scripting gives you all the power to your hands.

>=20
> But it probably also doesn't hurt.
>=20
> So 40GB virtual volume has 5GB free but reserved space is 10GB.
>=20
> Now real reserved space also becomes 5GB.

Please try to stop thinking within your  'margins' and your 'conditions'=20
every user/customer has different view - sometimes you simply need to=20
'think-big' in TiB or PiB ;)....


> Many things only work if the user follows a certain model of behaviour.
>=20
> The whole idea of having a "critical" versus a "non-critical" volume is t=
hat=20
> you are going to separate the dependencies such that a failure of the=20
> "non-critical" volume will not be "critical" ;-).

Already explained few times...

>> With 'reboot' you know where you are -=EF=BF=BD it's IMHO fair condition=
 for this.
>>
>> With frozen FS and paralyzed system and your 'fsfreeze' operation of
>> unimportant volumes actually has even eaten the space from thin-pool
>> which may possibly been used better to store data for important
>> volumes....
>=20
> Fsfreeze would not eat more space than was already eaten.


If you 'fsfreeze' - the filesystem has to be put into consistent state -
so all unwritten 'data' & 'metadata' out of your page-cache has to pushed o=
n=20
your disk.

This will cause very hardly 'predictable' amount of provisioning on your=20
thin-pool.   You can possibly estimate 'maximum' number....

> If I freeze a volume only used by a webserver... I will only freeze the=20
> webserver... not anything else?

Number of system apps are doing  scans over entire system....
Apps are talking to each other and waiting for answers...
Of course lots it 'transiently' freezed apps would be, because other apps a=
re=20
not well written for parallel world...

Again - if you have set of constrains - like you have a 'special' volume fo=
r=20
web server which is ONLY used by web server,  you can a better decision.

In this case it would be likely better to kill 'web server' and umount volu=
me....



> We're going to prevent them from mapping new chunks ;-).
>=20

You can't prevent kernel from mapping new chunks....

But you can do ALL in userspace - though ATM you need to possibly use=20
'dmsetup' commands....

Regards

Zdenek
