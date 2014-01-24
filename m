Message-ID: <52E283F4.70308@redhat.com>
Date: Fri, 24 Jan 2014 16:17:08 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <87zjmxzmga.fsf@red.mvo.lan>, <87y5265106.fsf@red.mvo.lan>,
	<52E269A8.9090707@redhat.com> <87vbx94ep0.fsf@red.mvo.lan>
In-Reply-To: <87vbx94ep0.fsf@red.mvo.lan>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Identifying useable block devices
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Peter Rajnoha <prajnoha@redhat.com>

Dne 24.1.2014 15:50, Marius Vollmer napsal(a):
> Peter Rajnoha <prajnoha@redhat.com> writes:
>
>> Thanks! Well, sorry for that, I've finally noticed the thing,
>> that was another bug, unfortunately. Should be solved now with
>> this git head in lvm2 upstream:
>>    89d77326170d020ebba6ae1c717c08ac4b07996a
>> (git.fedorahosted.org/git/lvm2.git)
>>
>> Thing is that the pool volume *should always* be marked
>> as private which also means DM_UDEV_DISABLE_OTHER_RULES_FLAG
>> is set.
>
> Nice, thanks!
>
> With this fixed, I have to ask again: Is _every_ situation where a block
> device goes from public to private with a "change" event a bug?
>
> I would say "yes", simply because I can't think of a situation where
> LVM2 doesn't know from the start whether the device is creates is gonna
> be public or private.
>
> If so, we just keep UDisks2 as it is, I'd say, and I file bugs when I
> find another public->private transition.


This is probably worth to put here this comment:

When lvm2 creates a complex device - it starts to build it from pieces.
However each individual piece is initially created as a visible plain LV.

The reason behind this is - whenever lvm2 fails to finish the command
(or someone just press Power-Off button) - it should leave metadata in the 
state, you can recover from with normal lvm2 command.

This means - even if the lvm2 fails to build complex targets - it should never 
leave metadata filled with  'private' LVs, which user cannot delete with 
lvremove command. Of course this is currently just a 'target' we try to reach 
and you are encourage to report bugs if you notice ordering problems here 
(i.e. raids are not compatible with this style).

So while TEMPORARY flag fixes the 'OK-path' here - it actually may introduce a 
problem of having a device with unknown content for udev in the case of lvm2 
command problem - but the assumption here is - the system has far more serious 
troubles in such failures than you should care about udev-db correctness...

And there is more scary part behind this - the current NOSCAN and TEMPORARY 
flags do work only non-clustered case.

Regards

Zdenek
