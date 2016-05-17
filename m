Received: from [10.40.200.16] (ovpn-200-16.brq.redhat.com [10.40.200.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4HJICbt026216
	for <linux-lvm@redhat.com>; Tue, 17 May 2016 15:18:13 -0400
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <119b520d472b019ced48357eff9fb389@dds.nl>
	<5739D494.2040103@redhat.com> <88ecf232d113c573e524088e67204c4f@dds.nl>
	<573AE7BD.3000008@redhat.com> <5751b613e8123d1c61ef8d08a5c01ea3@dds.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <57318838-1c71-f4e6-9869-a3f19df56a8b@redhat.com>
Date: Tue, 17 May 2016 21:18:12 +0200
MIME-Version: 1.0
In-Reply-To: <5751b613e8123d1c61ef8d08a5c01ea3@dds.nl>
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

On 17.5.2016 19:17, Xen wrote:
> Strange, I didn't get my own message.
>
>
> Zdenek Kabelac schreef op 17-05-2016 11:43:
>
>> There is no plan ATM to support boot from thinLV in nearby future.
>> Just use small boot partition - it's the safest variant - it just hold
>> kernels and ramdisks...
>
> That's not what I meant. Grub-probe will fail when the root filesystem is on
> thin, thereby making impossible the regeneration of your grub config files in
> /boot/grub.
>
> It will try to find the device for mounted /, and not succeed.
>
> Booting thin root is perfectly possible, ever since Kubuntu 14.10 at least (at
> least januari 2015).
>
>> We aim for a system with boot from single 'linear' with individual
>> kernel + ramdisk.
>>
>> It's simple, efficient and can be easily achieved with existing
>> tooling with some 'minor' improvements in dracut to easily allow
>> selection of system to be used with given kernel as you may prefer to
>> boot different thin snapshot of your root volume.
>
> Sure but won't happen if grub-update bugs on thin root.
>
> I'm not sure why we are talking about this now, or what I asked ;-).
>

The message behind is - bootting from 'linear' LVs, and no msdos partions...
So right from a PV.
Grub giving you 'menu' from bootable LVs...
BootableLV combined with selected 'rootLV'...

>> Complexity of booting right from thin is very high with no obvious benefit.
>
> I understand. I had not even been trying to achieve yet, although it has or
> might have principal benefit, the way doing away with partitions entirely
> (either msdos or gpt) has a benefit on its own.
>
> But as you indicate, you can place boot on non-thin LVM just fine, so there is
> not really that issue as you say.
>
>>> But for me, a frozen volume would be vastly superior to the system locking up.
>>
>> You miss the knowledge how the operating system works.
>>
>> Your binary is  'mmap'-ed for a device. When the device holding binary
>> freezes, your binary may freeze (unless it is mlocked in memory).
>>
>> So advice here is simple - if you want to run unfreezable system -
>> simply do not run this from a thin-volume.
>
> I did not run from a thin-volume, that's the point.
>
> In my test, the thin volumes were created on another harddisk. I created a
> small partition, put a thin pool in it, put 3 thin volumes in it, and then
> overfilled it to test what would happen.

It's the very same issue if you'd have used 'slow' USB device - you may slow 
down whole linux usage - or in similar way building 4G .iso image.

My advice - try lowering  /proc/sys/vm/dirty_ration -   I'm using '5'....


>> The best advice we have - 'monitor' fullness - when it's above - stop
>> using such system and ensure there will be more space -  there is
>> noone else to do this task for you - it's the price you pay for
>> overprovisioning.
>
> The point is that not only as an admin (for my local systems) but also as a
> developer, there is no point in continuing a situation that could be mitigated
> by designing tools for this purpose.
>
> There is no point for me if I can make this easier by automating tools for
> performing these tasks, instead of doing them by hand. If I can create tools
> or processes that do, what I would otherwise have needed to do by hand, then
> there is no point in continuing to do it by hand. That is the whole point of
> "automation" everywhere.

Policies are hard and it's not quite easy to have some universal,
that fits everyone needs here.

On the other hand it's relatively easy to write some 'tooling' for your
particular needs - if you have nice 'walled' garden you could easily target it...

> "Monitoring" and "stop using" is a process or mechanism that may very well be
> encoded and be made default, at least for my own systems, but by extension, if
> it works for me, maybe others can benefit as well.

Yes - this part will be extended and improved over the time.
Already few BZ exists...
It just takes time....

>
> I am not clear why a forced lazy umount is better, but I am sure you have your
> reason for it. It just seems that in many cases, an unwritable but present
> (and accessible) filesystem is preferable to none at all.

Plain simplicity - umount is simple sys call, while 'mount -o remount,ro' is 
relatively complicated resource consuming process.  There are some technical 
limitation related to usage operations like this behind 'dmeventd' - so it 
needs some redesigning for these new needs....


> I do not mean any form of differentiation or distinction. I mean an overall
> forced read only mode on all files, or at least all "growing", for the entire
> volume (or filesystem on it) which would pretty much be the equivalent of
> remount,ro. The only distinction you could ever possibly want in there is to
> block "new growth" writes while allowing writes to existing blocks. That is
> the only meaningful distinction I can think of.
>
> Of course, it would be pretty much equivalent to a standard mount -o
> remount,ro, and would still depend on thin pool information.
>

To give some 'light' where is the 'core of problem'

Imaging you have few thin LVs.
and you operate on a single one - which is almost fully provisioned
and just a single chunk needs to be provisioned.
And you fail to write.  It's really nontrivial to decided what needs
to happen.

>> Worth to note here - you can set your thin-pool with 'instant'
>> erroring in case you know you do not plan to resize it (avoiding
>> 'freeze')
>>
>> lvcreate/lvchange --errorwhenfull  y|n
>
> Ah thank you, that could solve it. I will try again with the thin test the
> moment I feel like rebooting again. The harddrive is still available, haven't
> installed my system yet.
>
> Maybe that should be the default for any system that does not have autoextend
> configured.

Yep policies, policies, policies....

Regards

Zdenek
