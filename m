Received: from [10.36.7.186] (vpn1-7-186.ams2.redhat.com [10.36.7.186])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s777v9HW016776
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2014 03:57:10 -0400
Message-ID: <53E3314F.9060209@redhat.com>
Date: Thu, 07 Aug 2014 09:57:03 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAAN_kG2zpfi6iStRDmpGRJD7Wg-EX-P4Ok7Y9Uo5n8jnanEyuQ@mail.gmail.com>
	<CAAN_kG0s1NR8ZVSQy29qOWxP0T+6axwQXo34v4_iydn5yzFMfg@mail.gmail.com>
In-Reply-To: <CAAN_kG0s1NR8ZVSQy29qOWxP0T+6axwQXo34v4_iydn5yzFMfg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM thin pool discard_max_bytes reports 0
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

Dne 7.8.2014 07:03, Timur Alperovich napsal(a):
> I have managed to answer my own questions.
>
> On Wed, Aug 6, 2014 at 8:48 PM, Timur Alperovich <timur@maginatics.com
> <mailto:timur@maginatics.com>> wrote:
>
>     Hi there,
>
>     I was trying to understand why fstrim would fail on an LVM thin
>     provisioned volume and figured out that the discard_max_bytes is reported
>     as 0 in /sys/block/dm-N/queue/discard_max_bytes (I checked the device that
>     corresponded to the LVM pool that the volume is created within). The
>     discard options are also disabled for the thin volume itself. I'm
>     observing this issue on an Ubuntu 12.04 system, running kernel 3.8.0-32,
>     and LVM2 2.02.98 backported to Ubuntu 12.04
>     (https://launchpad.net/~timur-alperovich/+archive/ubuntu/ppa/+packages).
>
>     I did a small experiment where I created another LVM pool within the same
>     volume group and the discard value was set to 65536 for that device. I'm
>     not sure if it matters, but the system is an running on ESXi 5.0 host.
>     While I don't necessarily expect discard to propagate to the host, I was
>     hoping to reclaim the block in the thin pool itself.
>
>     Could anyone shed some light on why discard may be disabled on an LVM thin
>     pool device? I tried looking for any bugs specific to TRIM or discard
>     subsequent to 2.02.98, but could not find anything definitive.
>
>
> I noticed the following in the 2.02.98 changelog:
> "Reinstate correct default to ignore discards for thin metadata from old tools."
>
> and this looks like the associated commit:
> commit 109b3bb49b31d5fa7f6d0dd23345d703ab866ad6
> Author: Zdenek Kabelac <zkabelac@redhat.com <mailto:zkabelac@redhat.com>>
> Date:   Tue Aug 21 15:51:54 2012 +0200
>
>      thin: discard
> The commit changes the default discard value to "ignore" and this can be
> confirmed with lvs -o +discards
>
>
>     Also, is there a way to enable discard without having to recreate the thin
>     pool?
>
>
> Yes, it can be changed with lvchange --discards passdown (being mindful of
> https://bugzilla.redhat.com/show_bug.cgi?id=903411)
>
>
>     Thank you,
>     Timur


Be sure your kernel has this commit:

09869de57ed2728ae3c619803932a86cb0e2c4f8

Zdenek
