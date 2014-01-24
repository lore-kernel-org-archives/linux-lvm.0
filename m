Message-ID: <52E269A8.9090707@redhat.com>
Date: Fri, 24 Jan 2014 14:24:56 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <87zjmxzmga.fsf@red.mvo.lan>, <874n4w5q0y.fsf@red.mvo.lan>,
	<52E1000A.3060000@redhat.com> <87y5265106.fsf@red.mvo.lan>
In-Reply-To: <87y5265106.fsf@red.mvo.lan>
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
Content-Type: text/plain; charset="us-ascii"
To: Marius Vollmer <marius.vollmer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 01/23/2014 01:35 PM, Marius Vollmer wrote:
> Peter Rajnoha <prajnoha@redhat.com> writes:
> 
>> On 01/22/2014 10:23 AM, Marius Vollmer wrote:
>>
>>> Is it guaranteed (modulo bugs) that the DM_UDEV_DISABLE_*_RULES flags
>>> are only ever removed from a node, and are never added to it over it's
>>> lifetime between add/remove events?
>>
>> No, we don't have this restriction generally
> 
> Ok.
> 
>>> This isn't true right now, and UDisks fails to handle it correctly
>>> when a flag is added in a "change" event.  I am asking to figure out
>>> where the fix should go.
>>
>> Well, udisks should always check the DM_UDEV_DISABLE_OTHER_RULES_FLAG
>> and if it's set, skip its processing. It already has:
>>
>> # honor the flag that device-mapper sets if the device should be ignored
>> ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", GOTO="udisks_end"
>>
>> ..in 80-udisks.rules. So it should be already following this.
> 
> That's from UDisks 1, I am concerned with UDisks2, which is a quite
> different beast, I think.  Sorry for not making this clear.
> 
> The problem with UDisks2, as I see it, is that it ignores a "change" or
> "add" event that has DM_UDEV_DISABLE_OTHER_RULES_FLAG set, while I think
> it should treat it as a "remove" event.
> 
> I have proposed this patch:
> 
>     https://bugs.freedesktop.org/attachment.cgi?id=92577&action=edit

Well, I don't quite agree with this statement from the patch:
 "We treat the uevent as "remove" if the device-mapper layer
  requests that other rules ignore this uevent".

The flag (DM_UDEV_DISABLE_OTHER_RULES_FLAG) is here to direct
udev processing to skip any scans - it's not actually saying
everyone else should remove this device now. It's just saying
"don't access/touch it" when this flag is set. If there was a
situation where we really need to remove (deactivate) the device,
we'd do that in lvm2 directly within processing of the device.

Also:
 "It's somewhat nasty to do this but it avoids all kinds of
  race-conditions caused by the design of device-mapper
  (such as temporary-cryptsetup nodes and cleartext devices
  without ID_FS properties properly set)."

The only reason we have these flags is that there's no way in
udev to declare the device as being private. The ID_FS_*
properties are the result of the blkid scan. And that's
exactly what we need to avoid! (...one of the reasons is
that such a private device could contain garbage since it's
not yet initialized fully). So it's actually the other way
round...

> 
>> Hmm, could you please send the whole log.
> 
> Sure, attached.
> 

Thanks! Well, sorry for that, I've finally noticed the thing,
that was another bug, unfortunately. Should be solved now with
this git head in lvm2 upstream:
  89d77326170d020ebba6ae1c717c08ac4b07996a
(git.fedorahosted.org/git/lvm2.git)

Thing is that the pool volume *should always* be marked
as private which also means DM_UDEV_DISABLE_OTHER_RULES_FLAG
is set.
-- 
Peter
