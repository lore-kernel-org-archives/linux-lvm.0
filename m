References: <20190725184901.24234-1-julian.klode@canonical.com>
	<e14a2033-893a-0e0a-4e32-0a62883a9d25@redhat.com>
	<20190730151223.jfxvd2qwaf5jdjsm@jak-t480s>
	<01707c6d-1fe3-f52e-47de-b8b13502fd0c@redhat.com>
	<20190731093920.pdu3zvxlo7i55gda@jak-t480s>
	<37de8264-a02e-a1b9-e297-c64ac35833fb@redhat.com>
	<20190731104134.7jsaxfaywjoutm7o@jak-t480s>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <95c3fd73-b3ca-2382-7916-315c6d201423@redhat.com>
Date: Wed, 31 Jul 2019 13:09:51 +0200
MIME-Version: 1.0
In-Reply-To: <20190731104134.7jsaxfaywjoutm7o@jak-t480s>
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

Dne 31. 07. 19 v 12:41 Julian Andres Klode napsal(a):
> On Wed, Jul 31, 2019 at 12:22:38PM +0200, Zdenek Kabelac wrote:
>> Dne 31. 07. 19 v 11:39 Julian Andres Klode napsal(a):
>>>>> I don't see how this has anything to do with lvmetad. There is no lvmetad
>>>>> anymore.
>>>>
>>>> The whole point of 'service' for 'pvscan' is to postone activation of DM
>>>> devices outside of udev rule processing.
>>>>
>>>> So whatever is replacing systemd service in your's systemd-less system must
>>>> provide similar functionality.
>>>>
>>>> There is currently no way to accept autoactivation capability within
>>>> udev-rule processing.
>>>
>>> This has nothing to do with the part of the message you are replying too, and
>>> is nonsense. The code to run pvscan directly is shipped, the change just moves
>>> the decision whether to do that from compile-time to run-time.
>>
>> As long as 'pvscan' is executed with 'auto-activation' option - it can't be
>> run from udev rule.   Any proposal for this needs to first resolve,
>> how to ensure udev will not try to kill running command in the middle of work.
>>
>> Until this is resolved - proposal of this can't be accepted upstream.
> 
> Again: The code is already there. I'm just moving the decision what to pick from
> compile-time to run-time. This is entirely orthogonal to whether the existing code
> works well or not.


So how about making  2 set of  lvm2 packages for Debian.

1st. set build with dependency on systemd libraries.
2nd. is build without dependency on systemd libraries (thus installable for 
non-systemd users)


lvm2 is not (ATM) build with runtime detection of systemd -  it's either 
compiled to work with systemd (expect all the services to be there).

2nd. mode is compilation without systemd world (provided mostly for older
distros).

We do not test 'hybrid' - where lvm2 would be adapting to presence of  systemd 
binaries (and we don't have capacity to test all these combinations)


Regards

Zdenek
