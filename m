MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 17 May 2016 22:43:18 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <57318838-1c71-f4e6-9869-a3f19df56a8b@redhat.com>
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <119b520d472b019ced48357eff9fb389@dds.nl>
	<5739D494.2040103@redhat.com> <88ecf232d113c573e524088e67204c4f@dds.nl>
	<573AE7BD.3000008@redhat.com> <5751b613e8123d1c61ef8d08a5c01ea3@dds.nl>
	<57318838-1c71-f4e6-9869-a3f19df56a8b@redhat.com>
Message-ID: <e3a1d746d1fc7279a7a9cd719cc3b4b4@dds.nl>
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
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

Zdenek Kabelac schreef op 17-05-2016 21:18:

> The message behind is - bootting from 'linear' LVs, and no msdos 
> partions...
> So right from a PV.
> Grub giving you 'menu' from bootable LVs...
> BootableLV combined with selected 'rootLV'...

I get it.

If that is the vision, I'm completely fine with that. I imagine everyone 
would. That would be rather nice.

I'm not that much of a snapshot person, but still, there is nothing 
really against it.

Andrei Borzenkov once told me on OpenSUSE list that there just (wasn't) 
support for thin yet at all in grub at that point (maybe a year ago that 
was?).

As I said I was working on an old patch to enable grub booting of PVs, 
but Andrei hasn't been responsive for more than a week. Maybe I'm just 
not very keen on all of this.

I don't know much about Grub, but I do know its lvm.c by heart now 
almost :p.

So yeah, anyway.

>> In my test, the thin volumes were created on another harddisk. I 
>> created a
>> small partition, put a thin pool in it, put 3 thin volumes in it, and 
>> then
>> overfilled it to test what would happen.
> 
> It's the very same issue if you'd have used 'slow' USB device - you
> may slow down whole linux usage - or in similar way building 4G .iso
> image.
> 
> My advice - try lowering  /proc/sys/vm/dirty_ration -   I'm using 
> '5'....

Yeah yeah, slow down. I first have to test the immediate failure and no 
waiting switch.


> Policies are hard and it's not quite easy to have some universal,
> that fits everyone needs here.

It depends on what people say they want.

In principle I don't think people would disagree with certain solutions 
if that was default.

One of the things I don't think people would disagree with would be 
having one of either of:

- autoextend and waiting with writes so nothing fails
- no autoextend and making stuff read-only.

I don't really think there are any other use cases. But like I 
indicated, any advanced system would only error on "growth writes?

> On the other hand it's relatively easy to write some 'tooling' for your
> particular needs - if you have nice 'walled' garden you could easily
> target it...

Sure and that's how every universal solution starts. But sometimes 
people just need to be convinced, and sometimes they need to convinced 
by seeing a working system and tests or statistics of whatever kind.


>> "Monitoring" and "stop using" is a process or mechanism that may very 
>> well be
>> encoded and be made default, at least for my own systems, but by 
>> extension, if
>> it works for me, maybe others can benefit as well.
> 
> Yes - this part will be extended and improved over the time.
> Already few BZ exists...
> It just takes time....

Alright. BugZilla is just for me not very amenable to /positive 
changes/, it seems so much geared towards /negative bugs/ if you know 
what I mean. Myself I would like to use more of Jira (Atlassian) but I 
did not say that ;-).



> Plain simplicity - umount is simple sys call, while 'mount -o
> remount,ro' is relatively complicated resource consuming process.
> There are some technical limitation related to usage operations like
> this behind 'dmeventd' - so it needs some redesigning for these new
> needs....

Okay. I thought it would be equivalent because both are called not as a 
system call, but it actually loads /bin/umount.

I guess that might mean you would need to trigger even another process, 
but you seem to be on top of it.

I would probably just blatantly get another daemon running, but I don't 
really have the skills for this yet. (I'm just approaching it from a 
quick & dirty perspective, as soon as I can get it running, at least I 
have a test system, proof of concept, or something that works).

> To give some 'light' where is the 'core of problem'
> 
> Imaging you have few thin LVs.
> and you operate on a single one - which is almost fully provisioned
> and just a single chunk needs to be provisioned.
> And you fail to write.  It's really nontrivial to decided what needs
> to happen.

First what I proposed would be for every thin volume to have a spare 
chunk. But maybe that's irrelevant here.

So there are two different cases as mentioned: existing block writes, 
and new block writes. What I was gabbing about earlier would be forcing 
a filesystem to also be able to distuinguish between them. You would 
have a filesystem-level "no extend" mode or "no allocate" mode that gets 
triggered. Initially my thought was to have this get triggered trough 
the FS-LVM interface. But, it could also be made operational not through 
any membrane but simply by having a kernel (module) that gets passed 
this information. In both cases the idea is to say: the filesystem can 
do what it wants with existing blocks, but it cannot get new ones.

When you say "it is nontrivial to decide what needs to happen" what you 
mean is: what should happen to the other volumes in conjunction to the 
one that just failed a write (allocation).

To begin with this is a problem situation to begin with, so programs, or 
system calls, erroring out, is expected and desirable, right.

So there are only three, four, five different cases:

- kernel informs VFS that all writes to all thin volumes should fail
- kernel informs VFS that all writes to new blocks on thin volumes 
should fail (not sure if it can know this)
- filesystem gets notified that new block allocation is not going to 
work, deal with it
- filesystem gets notified that all writes should cease (remount ro, in 
essence), deal with it.

Personally, I prefer the 3rd of these four.

Personally, I feel the condition of a filesystem getting into a "cannot 
allocate" state, is superior.

That would be a very powerful feature. Earlier I talked about all of 
this communication between the block layer and the filesystem layer 
right. But in this case it is just one flag, and it doesn't have the 
traverse the block-FS barrier.

However, it does mean the filesystem must know the 'hidden geometry' 
beneath its own blocks, so that it can know about stuff that won't work 
anymore.

However in this case it needs no other information. It is just a state. 
It knows: my block devices has 4M blocks (for instance), I cannot get 
new ones (or if I try, mayhem can ensue) and now I just need to 
indiscriminately fail writes that would require new blocks, try to 
redirect them to existing ones, let all existing-block writes continue 
as usual, and overall just fail a lot of stuff that would require new 
room.

Then of course your applications are still going to fail but that is the 
whole point. I'm not sure if the benefit is that outstanding as opposed 
to complete read-only, but it is very clear:



* In your example, the last block of the entire thin pool is now gone
* In your example, no other thin LV can get new blocks (extents, chunks)
* In your example, all thin LVs would need to start blocking writes to 
new chunks in case there is no autoextend, or possibly delay them if 
there is.

That seems pretty trivial. The mechanic for it may not. It is preferable 
in my view if the filesystem was notified about it and would not even 
*try* to write new blocks anymore. Then, it can immediately signal 
userspace processes (programs) about writes starting to fail.

Will mention that I still haven't tested --errorwhenfull yet.

But this solution does seem to indicate you would need to either get all 
filesystems to either plainly block all new allocations, or be smart 
about it. Doesn't make a big difference.

In principle if you had the means to acquire such a 
flag/state/condition, and the filesystem would be able to block new 
allocation wherever whenever, you would already have a working system. 
So what is then non-trivial?


The only case that is really nontrivial is that if you have autoextend. 
But even that you already have implemented.

It seems completely obvious that to me at this point, if anything from 
LVM (or e.g. dmeventd) could signal every filesystem on every affected 
thin volume, to enter a do-not-allocate state, and filesystems would be 
able to fail writes based on that, you would already have a solution 
right?

It would be a special kind of read-only. It would basically be a third 
state, after read-only, and read-write.

But it would need to be something that can take affect NOW. It would be 
a kind of degraded state. Some kind of emergency flag that says: sorry, 
certain things are going to bug out now. If the filesystem is very 
smart, it might still work for a while as old blocks are getting filled. 
If not, new allocations will fail and writes will ....somewhat randomly 
start to fail.

Certain things might continue working, others may not. Most applications 
would need to deal with that by themselves, which would normally have to 
be the case anyway. Ie. all over the field applications may start to 
fail. But that is what you want right. That is the only sensible thing.

If you have no autoextend.

That would normally mean that filesystem operations such as DELETE would 
still work, ie. you keep a running system on which you can remove files 
and make space.

That seems to be about as graceful as it can get. Right? Am I wrong?



>> Maybe that should be the default for any system that does not have 
>> autoextend
>> configured.
> 
> Yep policies, policies, policies....

Sounds like you could use a nice vacation in a bubble bath with nice 
champagne and good lighting, maybe a scented room, and no work for t 
least a week ;-).

And maybe some lovely ladies ;-) :P.

Personally I don't have the time for that, but I wouldn't say no to the 
ladies tbh.



Anyway let me just first test --errorwhenfull for you, or at least, for 
myself, to see if that completely solves the issue I had okay.

Regards and thanks for responding,

B.
