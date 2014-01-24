From: Marius Vollmer <marius.vollmer@redhat.com>
References: <87zjmxzmga.fsf@red.mvo.lan>, <52E269A8.9090707@redhat.com>,
	<52E26AD3.7080203@redhat.com>
In-reply-to: <52E26AD3.7080203@redhat.com>
Date: Fri, 24 Jan 2014 16:39:02 +0200
Message-ID: <87wqhp4f7d.fsf@red.mvo.lan>
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Peter Rajnoha <prajnoha@redhat.com> writes:

>> The flag (DM_UDEV_DISABLE_OTHER_RULES_FLAG) is here to direct
>> udev processing to skip any scans - it's not actually saying
>> everyone else should remove this device now. It's just saying
>> "don't access/touch it" when this flag is set. If there was a
>> situation where we really need to remove (deactivate) the device,
>> we'd do that in lvm2 directly within processing of the device.
>
> ...simply, the event listener that gets the event with this flag
> set should just consider this dm device as "private".

Yeah, that's what treating events with the flag as a "remove" event is
meant to accomplish.

UDisks2 maintains objects on D-Bus corresponding to public udev block
devices.  When a device changes from public to private, we should remove
the corresponding object from D-Bus.  The code for that is the same as
when UDisks2 receives a "remove" event for the device AFAICS, so we just
jump into that code path by changing the event action early on.

The alternative is to also create D-Bus objects for private udev block
devices, but set UDISKS_IGNORE for them (and rely on its clients to dtrt
with that).  I think that is what UDisks 1 used to do, but David has
choosen not to do this for UDisks2.  I can't really judge which approach
is better.  Do you have an opinion?
