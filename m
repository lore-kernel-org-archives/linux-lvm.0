References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<062fccc39afe128ef5950634309a01ea@assyoma.it>
	<783965ccb392bea2faded10436cdaf39@xenhideout.nl>
	<0658b33a7d4e5494de71231b7343a514@assyoma.it>
	<88a2badd9b77546407bba31778c00699@xenhideout.nl>
	<341979ccda1b2ee7cb5242006f1b03c8@assyoma.it>
	<9b5cd79f258fbb79b7d7e213970b1ae2@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <e88f9168-7426-f0d8-1e97-77ce36b3ffd2@redhat.com>
Date: Tue, 18 Apr 2017 12:17:09 +0200
MIME-Version: 1.0
In-Reply-To: <9b5cd79f258fbb79b7d7e213970b1ae2@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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

Dne 15.4.2017 v 23:48 Xen napsal(a):
> Gionatan Danti schreef op 14-04-2017 20:59:
> 
>> There is something similar already in place: when pool utilization is
>> over 95%, lvmthin *should* try a (lazy) umount. Give a look here:
>> https://www.redhat.com/archives/linux-lvm/2016-May/msg00042.html
>>
>> Monitoring is a great thing; anyway, a safe fail policy would be *very* nice...
> 
> This is the idea I had back then:
> 
> - reserve space for calamities.
> 
> - when running out of space, start informing the filesystem(s).
> 
> - communicate individual unusable blocks or simple a number of unavailable 
> blocks through some inter-layer communication system.
> 
> But it was said such channels do not exist or that the concept of a block 
> device (a logical addressing space) suddenly having trouble delivering the 
> blocks would be a conflicting concept.
> 
> If the concept of a filesystem needing to deal with disappearing space were to 
> be made live,
> 
> what you would get was.
> 
> that there starts to grow some hidden block of unusable space.
> 
> Supposing that you have 3 volumes of sizes X Y and Z.
> 
> With the constraint that currently individually each volume is capable of 
> using all space it wants,
> 
> now volume X starts to use up more space and the available remaining space is 
> no longer enough for Z.
> 
> The space available to all volumes is equivalent and is only constrained by 
> their own virtual sizes.
> 
> So saying that for each volume the available space = min( own filesystem 
> space, available thin space )
> 
> any consumption by any of the other volumes will see a reduction of the 
> available space by the same amount for the other volumes.
> 
> For the using volume this is to be expected, for the other volumes this is 
> strange.
> 
> each consumption turns into a lessening for all the other volumes including 
> the own.
> 
> this reduction of space is therefore a single number that pertains to all 
> volumes and only comes to be in any kind of effect if the real available space 
> is less than the (filesystem oriented, but rather LVM determined) virtual 
> space the volume thought it had.
> 
> for all volumes that are effected, there is now a discrepancy between virtual 
> available space and real available space.
> 
> this differs per volume but is really just a substraction. However LVM should 
> be able to know about this number since it is just about a number of extents 
> available and 'needed'.
> 
> Zdenek said that this information is not available in a live fashion because 
> the algorithms that find a new free extent need to go look for it first.

Already got lost in lots of posts.

But  there is tool  'thin_ls'  which can be used for detailed info about used 
space by every single  thin volume.

It's not support directly by 'lvm2' command (so not yet presented in shiny 
cool way via 'lvs -a') - but user can relatively easily run this command
on his own on life pool.


See for usage of


dmsetup message /dev/mapper/pool 0
     [ reserve_metadata_snap | release_metadata_snap ]

and 'man thin_ls'


Just don't forget to release snapshot of thin-pool kernel metadata once it's 
not needed...

> There are two ways: polling a number through some block device command or 
> telling the filesystem through a daemon.
> 
> Remounting the filesystem read-only is one such "through a daemon" command.
> 

Unmount of thin-pool has been dropped from upstream version >169.
It's now delegated to user script executed on % checkpoints
(see 'man dmeventd')

Regards

Zdenek
