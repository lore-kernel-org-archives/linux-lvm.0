References: <20190725184901.24234-1-julian.klode@canonical.com>
	<e14a2033-893a-0e0a-4e32-0a62883a9d25@redhat.com>
	<20190730151223.jfxvd2qwaf5jdjsm@jak-t480s>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <01707c6d-1fe3-f52e-47de-b8b13502fd0c@redhat.com>
Date: Wed, 31 Jul 2019 11:21:10 +0200
MIME-Version: 1.0
In-Reply-To: <20190730151223.jfxvd2qwaf5jdjsm@jak-t480s>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] Detect systemd at run-time in
	69-dm-lvm-metad.rules
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
To: Julian Andres Klode <julian.klode@canonical.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 30. 07. 19 v 17:12 Julian Andres Klode napsal(a):
> On Tue, Jul 30, 2019 at 05:02:44PM +0200, Zdenek Kabelac wrote:
>> Dne 25. 07. 19 v 20:49 Julian Andres Klode napsal(a):
>>> systems might have systemd as their normal init systems, but
>>> might not be using it in their initramfs; or like Debian, support
>>> different init systems.
>>>
>>> Detect whether we are running on systemd by checking for /run/systemd/system
>>> and then change the behavior accordingly.
>>>
>>
>>
>> Wouldn't it be better to simply disable compiling/using lvmetad on such systems ?
> 
> I don't see how this has anything to do with lvmetad. There is no lvmetad
> anymore.

The whole point of 'service' for 'pvscan' is to postone activation of DM 
devices outside of udev rule processing.

So whatever is replacing systemd service in your's systemd-less system must 
provide similar functionality.

There is currently no way to accept autoactivation capability within udev-rule 
processing.

>> HEAD of 2.03 already dropped lvmetad anyway.
>>
>> Do you need any sort of autoactivation in ramdisk ?
> 
> Of course we need the PV to be scanned automatically so we can then find
> the root partition. The root device finding is event-based, we have a tool
> that listens to udev and waits for 30s for the device to appear, and relies
> on the events being triggered correctly.

There is nothing for finding - if you pass root LV into your ramdisk the 
proper command to activate such LV  is   'lvchange -ay vgname/lvname'

Dracut uses pretty 'navive' algorithm to run such command with whenever any 
new device is found - it's added into lvm2 filters of visible device - once it 
succeeds - it can proceed....
For the 'initramdisk' functionality this is IMHO good enough.
(Although there are several very ugly hacks in this code we would like to drop...)


>> There is probably higher complexity.

Activating 'root' LV via autoactivation mechanism is very complex.
IMHO some of them are really very very hard to resolve.

>> pvscan was not moved into systemd service just for fun - there have been at
>> least 2 major mandatory points why  'pvscan' with autoactivation MUST NOT be
>> executed from udev rule directly (udev timeout)
>>
>> So the proposed patch must be NAC-ked as it is - as it probably causing way
>> more troubles then it solves.
> 
> The alternative would be to disable the systemd integration entirely in
> Debian and Ubuntu, as Debian requires support for non-systemd inits, and
> Ubuntu requires event-based root device finding in initramfs. Surely that's
> worse.

Can't really speak for any other distros.

I'm only commenting proposed patch for moving background pvscan into direct 
udev-rule is not acceptable workaround (as it simply can't work)

The system without systemd needs to provide some other mechanism how to fire 
background job.

Note - there is upcoming SID work that can supposedly resolve some of these 
issue - but the release date and it's integration into distributions like 
Debian is a topic for another debate...

Regards

Zdenek
