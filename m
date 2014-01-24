Message-ID: <52E28081.50308@redhat.com>
Date: Fri, 24 Jan 2014 16:02:25 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <87zjmxzmga.fsf@red.mvo.lan>, <52E269A8.9090707@redhat.com>,
	<52E26AD3.7080203@redhat.com> <87wqhp4f7d.fsf@red.mvo.lan>
In-Reply-To: <87wqhp4f7d.fsf@red.mvo.lan>
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

On 01/24/2014 03:39 PM, Marius Vollmer wrote:
> Peter Rajnoha <prajnoha@redhat.com> writes:
> 
>>> The flag (DM_UDEV_DISABLE_OTHER_RULES_FLAG) is here to direct
>>> udev processing to skip any scans - it's not actually saying
>>> everyone else should remove this device now. It's just saying
>>> "don't access/touch it" when this flag is set. If there was a
>>> situation where we really need to remove (deactivate) the device,
>>> we'd do that in lvm2 directly within processing of the device.
>>
>> ...simply, the event listener that gets the event with this flag
>> set should just consider this dm device as "private".
> 
> Yeah, that's what treating events with the flag as a "remove" event is
> meant to accomplish.
> 
> UDisks2 maintains objects on D-Bus corresponding to public udev block
> devices.  When a device changes from public to private, we should remove
> the corresponding object from D-Bus.  The code for that is the same as
> when UDisks2 receives a "remove" event for the device AFAICS, so we just
> jump into that code path by changing the event action early on.

Well, in that case I think it's OK to do that.

> 
> The alternative is to also create D-Bus objects for private udev block
> devices, but set UDISKS_IGNORE for them (and rely on its clients to dtrt
> with that).  I think that is what UDisks 1 used to do, but David has
> choosen not to do this for UDisks2.  I can't really judge which approach
> is better.  Do you have an opinion?
> 

To be honest, I don't like the idea with setting these variables, but
there's nothing else at the moment we could use in udev...

Thing with setting variables is that we need to rely on others to properly
check this variable - and each variable coming from different subsystems has
a different name. Would be really great if we have a more decent way
how to mark devices as private where with the "private" I mean that it can
be processed only by the subsystem that claims it. This would require a
solution hardwired directly to the way the devices are presented in the system,
maybe a common sysfs variable that would be used for all... Since there
may be numerous devices for which the first ADD/CHANGE event doesn't actually
mean the device is ready for use - some have extra configuration that follows
for it to be usable (the same applies for MD, loop devices) or they just
need to be marked as private for whatever reason.

For example, even systemd tries to gather this information from various
sources and sets SYSTEMD_READY=0/1 (see also https://github.com/systemd/systemd/blob/master/rules/99-systemd.rules.in)
(unfortunately, systemd is not the only one in the world, there are alternatives,
that's why having this info directly in sysfs would make more sense as it's
global).

This change is possible, but requires everybody to gather up and agree on
common solution...

-- 
Peter
