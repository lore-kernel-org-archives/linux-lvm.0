References: <20190725184901.24234-1-julian.klode@canonical.com>
	<e14a2033-893a-0e0a-4e32-0a62883a9d25@redhat.com>
	<20190730151223.jfxvd2qwaf5jdjsm@jak-t480s>
	<01707c6d-1fe3-f52e-47de-b8b13502fd0c@redhat.com>
	<20190731093920.pdu3zvxlo7i55gda@jak-t480s>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <37de8264-a02e-a1b9-e297-c64ac35833fb@redhat.com>
Date: Wed, 31 Jul 2019 12:22:38 +0200
MIME-Version: 1.0
In-Reply-To: <20190731093920.pdu3zvxlo7i55gda@jak-t480s>
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

Dne 31. 07. 19 v 11:39 Julian Andres Klode napsal(a):
>>> I don't see how this has anything to do with lvmetad. There is no lvmetad
>>> anymore.
>>
>> The whole point of 'service' for 'pvscan' is to postone activation of DM
>> devices outside of udev rule processing.
>>
>> So whatever is replacing systemd service in your's systemd-less system must
>> provide similar functionality.
>>
>> There is currently no way to accept autoactivation capability within
>> udev-rule processing.
> 
> This has nothing to do with the part of the message you are replying too, and
> is nonsense. The code to run pvscan directly is shipped, the change just moves
> the decision whether to do that from compile-time to run-time.

As long as 'pvscan' is executed with 'auto-activation' option - it can't be 
run from udev rule.   Any proposal for this needs to first resolve,
how to ensure udev will not try to kill running command in the middle of work.

Until this is resolved - proposal of this can't be accepted upstream.

>> Dracut uses pretty 'navive' algorithm to run such command with whenever any
>> new device is found - it's added into lvm2 filters of visible device - once
>> it succeeds - it can proceed....
>> For the 'initramdisk' functionality this is IMHO good enough.
>> (Although there are several very ugly hacks in this code we would like to drop...)
> 
> That's a nasty hack.

Yes - we are aware it's ugly hack - but compared with complexity of properly
working event based activation - it's does not look so horrible...

Regards


Zdenek
