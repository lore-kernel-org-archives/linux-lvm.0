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
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <58f99204-d978-3f6a-9db8-b7122b30575e@redhat.com>
Date: Fri, 15 Sep 2017 11:22:26 +0200
MIME-Version: 1.0
In-Reply-To: <2d1025d7784ab44cbc03cfe7f6778599@xenhideout.nl>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 15.9.2017 v 09:34 Xen napsal(a):
> Zdenek Kabelac schreef op 14-09-2017 21:05:
> 

>>> But if I do create snapshots (which I do every day) when the root and boot 
>>> snapshots fill up (they are on regular lvm) they get dropped which is nice,
>>
>> old snapshot are different technology for different purpose.
> 
> Again, what I was saying was to support the notion that having snapshots that 
> may grow a lot can be a problem.


lvm2 makes them look the same - but underneath it's very different (and it's 
not just by age - but also for targeting different purpose).

- old-snaps are good for short-time small snapshots - when there is estimation 
for having low number of changes and it's not a big issue if snapshot is 'lost'.

- thin-snaps are ideal for long-time living objects with possibility to take 
snaps of snaps of snaps and you are guaranteed the snapshot will not 'just 
dissapear' while you modify your origin volume...

Both have very different resources requirements and performance...

> I am not sure the purpose of non-thin vs. thin snapshots is all that different 
> though.
> 
> They are both copy-on-write in a certain sense.
> 
> I think it is the same tool with different characteristics.

That are cases where it's quite valid option to take  old-snap of thinLV and 
it will payoff...

Even exactly in the case you use thin and you want to make sure your temporary 
snapshot will not 'eat' all your thin-pool space and you want to let snapshot die.

Thin-pool still does not support shrinking - so if the thin-pool auto-grows to 
big size - there is not a way for lvm2 to reduce the thin-pool size...



> That's just the sort of thing that in the past I have been keeping track of 
> continuously (in unrelated stuff) such that every mutation also updated the 
> metadata without having to recalculate it...

Would you prefer to spend all you RAM to keep all the mapping information for 
all the volumes and put very complex code into kernel to parse the information 
which is technically already out-of-data in the moment you get the result ??

In 99.9% of runtime you simply don't need this info.

> But the purpose of what you're saying is that the number of uniquely owned 
> blocks by any snapshot is not known at any one point in time.

As long as 'thinLV' (i.e. your snapshot thinLV) is NOT active - there is 
nothing in kernel maintaining its dataset.  You can have lots of thinLV active 
and lots of other inactive.


> Well pardon me for digging this deeply. It just seemed so alien that this 
> thing wouldn't be possible.

I'd say it's very smart ;)

You can use only very small subset of 'metadata' information for individual 
volumes.
> 
> It becomes a rather big enterprise to install thinp for anyone!!!

It's enterprise level software ;)

> Because to get it running takes no time at all!!! But to get it running well 
> then implies huge investment.

In most common scenarios - user knows when he runs out-of-space - it will not 
be 'pleasant' experience - but users data should be safe.

And then it depends how much energy/time/money user wants to put into 
monitoring effort to minimize downtime.

As has been said - disk-space is quite cheap.
So if you monitor and insert your new disk-space in-time  (enterprise...)  you 
have less set of problems - then if you try to fight constantly with 100% full 
thin-pool...

You have still problems even when you have 'enough' disk-space ;)
i.e. you select small chunk-size and you want extend thin-pool data volume 
beyond addressable capacity -  each chunk-size has its final maximum data size....

> That means for me and for others that may not be doing it professionally or in 
> a larger organisation, the benefit of spending all that time may not weigh up 
> to the cost it has and the result is then that you keep stuck with a deeply 
> suboptimal situation in which there is little or no reporting or fixing, all 
> because the initial investment is too high.

You can always use normal device - it's really about the choice and purpose...


> 
> While personally I also like the bigger versus smaller idea because you don't 
> have to configure it.

I'm still proposing to use different pools for different purposes...

Sometimes spreading the solution across existing logic is way easier,
then trying to achieve some super-inteligent universal one...

>> Script is called at  50% fullness, then when it crosses 55%, 60%, ...
>> 95%, 100%. When it drops bellow threshold - you are called again once
>> the boundary is crossed...
> 
> How do you know when it is at 50% fullness?
> 
>> If you are proud sponsor of your electricity provider and you like the
>> extra heating in your house - you can run this in loop of course...
> 
>> Threshold are based on  mapped size for whole thin-pool.
>>
>> Thin-pool surely knows all the time how many blocks are allocated and free for
>> its data and metadata devices.
> 
> But didn't you just say you needed to process up to 16GiB to know this 
> information?

Of course thin-pool has to be aware how much free space it has.
And this you can somehow imagine as 'hidden' volume with FREE space...

So to give you this 'info' about  free blocks in pool - you maintain very 
small metadata subset - you don't need to know about all other volumes...

If other volume is releasing or allocation chunks - your 'FREE space' gets 
updated....

It's complex underneath and locking is very performance sensitive - but for 
easy understanding you can possibly get the picture out of this...

> 
> You may not know the size and attribution of each device but you do know the 
> overall size and availability?

Kernel support 1 setting for threshold - where the user-space (dmeventd) is 
waked-up when usage has passed it.

The mapping of value is lvm.conf autoextend threshold.

As a 'secondary' source - dmeventd checks every 10 second pool fullness with 
single ioctl() call and compares how the fullness has changed and provides you 
with callbacks for those  50,55...  jumps
(as can be found in  'man dmeventd')

So for autoextend theshold passing you get instant call.
For all others there is up-to 10 second delay for discovery.

>> In the single thin-pool  all thins ARE equal.
> 
> But you could make them unequal ;-).

I cannot ;)  - I'm lvm2 coder -   dm thin-pool is Joe's/Mike's toy :)

In general - you can come with many different kernel modules which take 
different approach to the problem.

Worth to note -  RH has now Permabit  in its porfolio - so there can more then 
one type of thin-provisioning supported in lvm2...

Permabit solution has deduplication, compression, 4K blocks - but no snapshots....


> 
> The goal was more to protect the other volumes, supposing that log writing 
> happened on another one, for that other log volume not to impact the other 
> main volumes.

IMHO best protection is different pool for different thins...
You can more easily decide which pool can 'grow-up'
and which one should rather be taken offline.

So your 'less' important data volumes may simply hit the wall hard,
while your 'strategically important' one will avoid using overprovisioning as 
much as possible to keep it running.

Motto: keep it simple ;)

> So you have thin global reservation of say 10GB.
> 
> Your log volume is overprovisioned and starts eating up the 20GB you have 
> available and then runs into the condition that only 10GB remains.
> 
> The 10GB is a reservation maybe for your root volume. The system (scripts) (or 
> whatever) recognises that less than 10GB remains, that you have claimed it for 
> the root volume, and that the log volume is intruding upon that.
> 
> It then decides to freeze the log volume.

Of course you can play with 'fsfreeze' and other things - but all these things 
are very special to individual users with their individual preferences.

Effectively if you freeze your 'data' LV - as a reaction you may paralyze the 
rest of your system - unless you know the 'extra' information about the user 
use-pattern.

But do not take this as something to discourage you to try it - you may come 
with perfect solution for your particular system  - and some other user may 
find it useful in some similar pattern...

It's just something that lvm2 can't give support globally.

But lvm2 will give you enough bricks for writing 'smart' scripts...

> Okay.. I understand. I guess I was deluded a bit by non-thin snapshot 
> behaviour (filled up really fast without me understanding why, and concluding 
> that it was doing 4MB copies).

Fast disks are now easily able to write gigabytes in second... :)

> 
> But attribution of an extent to a snapshot will still be done in extent-sizes 
> right?

Allocation unit in VG  is 'extent'   - ranges from 1sector to 4GiB
and default is 4M - yes....

> 
> So I don't think the problems of freezing are bigger than the problems of 
> rebooting.

With 'reboot' you know where you are -  it's IMHO fair condition for this.

With frozen FS and paralyzed system and your 'fsfreeze' operation of 
unimportant volumes actually has even eaten the space from thin-pool which may 
possibly been used better to store data for important volumes....
and there is even big danger you will 'freeze' yourself already during call of 
fsfreeze  (unless you of course put BIG margins around)


> 
> "System is still running but some applications may have crashed. You will need 
> to unfreeze and restart in order to solve it, or reboot if necessary. But you 
> can still log into SSH, so maybe you can do it remotely without a console ;-)".

Compare with  email:

Your system has run out-of-space, all actions to gain some more space has 
failed  - going to reboot into some 'recovery' mode

> 
> So there is no issue with snapshots behaving differently. It's all the same 
> and all committed data will be safe prior to the fillup and not change afterward.

Yes - snapshot is 'user-land' language  -  in kernel - all thins  maps chunks...

If you can't map new chunk - things is going to stop - and start to error 
things out shortly...

Regards

Zdenek
