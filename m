Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4H9hPlZ024198
	for <linux-lvm@redhat.com>; Tue, 17 May 2016 05:43:26 -0400
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <119b520d472b019ced48357eff9fb389@dds.nl>
	<5739D494.2040103@redhat.com> <88ecf232d113c573e524088e67204c4f@dds.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <573AE7BD.3000008@redhat.com>
Date: Tue, 17 May 2016 11:43:25 +0200
MIME-Version: 1.0
In-Reply-To: <88ecf232d113c573e524088e67204c4f@dds.nl>
Content-Transfer-Encoding: 7bit
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

On 16.5.2016 21:25, Xen wrote:
> Zdenek Kabelac schreef op 16-05-2016 16:09:
>
>> Behavior should be there for quite a while, but relatively recent fixes
>> in dmeventd has made it working more reliable in more circumstances.
>> I'd recommend to play at least with 142 - but since recent releases are
>> bugfix oriented - if you are compiling yourself - just take latest.
>
> I don't use my thin volumes for the system. That is difficult anyway because
> Grub doesn't allow it (although I may start writing for that at some point).

There is no plan ATM to support boot from thinLV in nearby future.
Just use small boot partition - it's the safest variant - it just hold kernels 
and ramdisks...

We aim for a system with boot from single 'linear' with individual kernel + 
ramdisk.

It's simple, efficient and can be easily achieved with existing tooling with 
some 'minor' improvements in dracut to easily allow selection of system to be 
used with given kernel as you may prefer to boot different thin snapshot of 
your root volume.

Complexity of booting right from thin is very high with no obvious benefit.

> But for me, a frozen volume would be vastly superior to the system locking up.

You miss the knowledge how the operating system works.

Your binary is  'mmap'-ed for a device. When the device holding binary 
freezes, your binary may freeze (unless it is mlocked in memory).

So advice here is simple - if you want to run unfreezable system - simply do 
not run this from a thin-volume.

> So while I was writing all of that ..material, I didn't realize that in my
> current system's state, the thing would actually cause the entire system to
> freeze. Not directly, but within a minute or so everything came to a halt.
> When I rebooted, all of the volumes were filled 100%, that is to say, all of
> the thin capacities added up to a 100% for the thin pool, and the pool itself
> was at 100%.
>
> I didn't check the condition of the filesystem. You would assume it would
> contain partially written files.

ATM there are some 'black holes' as filesystem were not deeply tested in all 
corner cases which now could be 'easily' hit with thin usage.
This is getting improved - but advice  "DO NOT" run thin-pool 100% still applies.


> If there is anything that would actually freeze the volume but not bring the
> system down, I would be most happy. But possibly it's the (ext) filesystem
> driver that makes trouble? Like we said, if there is no way to communicate
> space-fullness, what is it going to do right?

The best advice we have - 'monitor' fullness - when it's above - stop using 
such system and ensure there will be more space -  there is noone else to do 
this task for you - it's the price you pay for overprovisioning.


> So is that dmeventd supposed to do anything to prevent disaster? Would I need
> to write my own plugin/configuration for it?

dmeventd only monitors and calls command to try to resize, and may try to 
umount volumes in case disaster is approaching.

We plan to add more 'policy' logic - so you would be able to define what 
should happen when some fullness is reached - but that's just plan ATM.

If you need something 'urgently' now  -  you could i.e. monitor your syslog
message for 'dmeventd' report and run  i.e.  'reboot' in some case...

> It is not running on my system currently. Without further amendments of course
> the only thing it could possibly do is to remount a filesystem read-only, like
> others have indicated it possibly already could.

or instead of reboot   'mount -o remount,ro' - whatever fits...
Just be aware that relatively 'small' load on filesystem may easily provision
major portion of thin-pool quickly.

>
> Maybe it would even be possible to have a kernel module that blocks a certain
> kind of writes, but these things are hard, because the kernel doesn't have a
> lot of places to hook onto by design. You could simply give the filesystem (or
> actually the code calling for a write) write failures back.

There are no multiple write queues at dm level where you could select you want 
to store data from LibreOffice, but you want to throw out your Firefox files...

> what other people have said. That the system already does this (mounting
> read-only).
>
> I believe my test system just failed because the writes only took a few
> seconds to fill up the volume. Not a very good test, sorry. I didn't realize
> that, that it would check only in intervals.

dmeventd is quite quick when it 'detects' threshold (recent version of lvm2).

> I still wonder what freezes my system like that.

Your 'write' queue (amount of dirty-pages) could be simply full of write to 
'blocked' device, and without 'time-outing' writes (60sec) you can't write 
anything anywhere else...

Worth to note here - you can set your thin-pool with 'instant' erroring in 
case you know you do not plan to resize it (avoiding 'freeze')

lvcreate/lvchange --errorwhenfull  y|n


Regards

Zdenek
