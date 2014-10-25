Received: from [10.36.7.95] (vpn1-7-95.ams2.redhat.com [10.36.7.95])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9PKhokB031487
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 16:43:51 -0400
Message-ID: <544C0B85.209@redhat.com>
Date: Sat, 25 Oct 2014 22:43:49 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <544A8CA4.2030506@ib.pl> <544B9C87.9050501@gmail.com>
	<544BE01F.9080503@ib.pl>
In-Reply-To: <544BE01F.9080503@ib.pl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Virtualization and LVM data security
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

Dne 25.10.2014 v 19:38 IB Development Team napsal(a):
> W dniu 2014-10-25 o 14:50, Zdenek Kabelac pisze:
>
>>> Is there any way to make LVM2 tools wipe added/freed LV space or plans to add
>>> such functionality?
>
>> lvm.conf    devices { issue_discard = 1 }
>>
>> See it that fits your need ?
>> Note: when using this option - vg/lvremove becomes 'irreversible'operation.
>
> issue_discard seems to require "underlying storage support" which is probably
> not available in common RAID/SATA/SAS/DRBD scenarios. Universal, open (source)
> solution would be better here probably (with hardware alternatives where
> possible).

Yes - this discard needs to be implemented by underlaying storage.

>
>>> When LVM based storage is used for guest virtual disks, it is possible that
>>> after resizing/snapshoting LV, disk data fragments from one guest will be
>>> visible to other guest, which may cause serious security problems if not wiped
>>> somehow[...]
>
>> thin provisioning with zeroing enabled for thin-pool -Zy is likely better
>> option.
>
> Sounds interesting. Is it stable solution for production systems? Does it
> perform not worse than "regular" preallocated LV?

Provisioning does not come for 'free' - so you pay some price when you zero 
provisioned blocks obviously - but blocks are zeroed on demand when they are 
going to be used.

For production system - do not over provision space - if you promise too much 
space and you don't have it - it currently require certain manual admin skills 
to proceed with overfilled pool volumes - it's not yet fully automated.

>> Note: you could obviously implement 'workaround' something like:
>>
>> lvcreate -l100%FREE -n trim_me vg
>> blkdiscard /dev/vg/trim_me
>> (or if disk doesn't support TRIM -   dd if=/dev/zero of=/dev/vg/trim_me....)
>> lvremove vg/trim_me
>
> If I understand correctly, in this scenario, guest data may still be present
> outside "cleaned" LV (i.e. data that was saved outside LV in snapshot LV
> during backups). If so - cleaning should be probably done transparently by LVM
> "software" layer, even without "underlying storage support".

There is no such support on lvm2 side - it's much easier to be implemented
on the user side.

Before you call 'lvremove' - just dd zero volume - if lvm would be zeroing
devices i.e. 1TB volume on lvremove - that would be timely insane operation.

Regards

Zdenek
