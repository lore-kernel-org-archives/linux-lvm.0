References: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
	<73d0ffcd-4ed5-38b1-0d17-a4b16c7863d6@redhat.com>
	<CAODnkUCkbfvyq8mUpK1OEx5C1jgfmjyYauHzjcA12aGnY6kLGA@mail.gmail.com>
	<c675a85e-9739-cda9-5588-654337783182@redhat.com>
	<CAODnkUDFLBsbhCOHcqza=mDagOR7HQ1GVCoVGr2pfM6v2h3wjQ@mail.gmail.com>
	<a5d9f6e1-ae4e-845f-f1d2-a119959b6548@redhat.com>
	<CAODnkUDWBtOUkwOKSpqjh2Jguc9K9+KQfnK_w7j=EVXKgOfuVQ@mail.gmail.com>
	<f09e1927-e44c-a1c6-757f-ffe1c0e6a0d5@redhat.com>
	<CAODnkUCc6r5kphRs27PE6azH-bDni+pTC02bN5XBhwRcY7+c5A@mail.gmail.com>
	<CAODnkUDFj8CB4UwquYmGkdG2O9E+uge-E6SFqu7=htOVECNShA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d572fdec-c2f1-b02a-7697-45ce932f9220@redhat.com>
Date: Tue, 29 Sep 2020 17:53:53 +0200
MIME-Version: 1.0
In-Reply-To: <CAODnkUDFj8CB4UwquYmGkdG2O9E+uge-E6SFqu7=htOVECNShA@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin: pool target too small
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
To: Duncan Townsend <duncancmt@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 29. 09. 20 v 16:33 Duncan Townsend napsal(a):
> On Sat, Sep 26, 2020, 8:30 AM Duncan Townsend <duncancmt@gmail.com 
> <mailto:duncancmt@gmail.com>> wrote:
> 
>>      > > There were further error messages as further snapshots were attempted,
>      > > but I was unable to capture them as my system went down. Upon reboot,
>      > > the "transaction_id" message that I referred to in my previous message
>      > > was repeated (but with increased transaction IDs).
>      >
>      > For better fix it would need to be better understood what has happened
>      > in parallel while 'lvm' inside dmeventd was resizing pool data.
> 

So the lvm2 has been fixed upstream to report more educative messages to
the user - although it still does require some experience in managing
thin-pool kernel metadata and lvm2 metadata.

>     To the best of my knowledge, no other LVM operations were in flight at
>     the time. The script that I use issues LVM commands strictly

In your case - dmeventd did 'unlocked' resize - while other command
was taking a snapshot - and it happened the sequence with 'snapshot' has
won - so until the reload of thin-pool - lvm2 has not spotted difference.
(which is simply a bad race cause due to badly working locking on your system)


>     Would it be reasonable to use vgcfgrestore again on the
>     manually-repaired metadata I used before? I'm not entirely sure what

You will need to vgcfgrestore - but I think you've misused my passed recoverd 
piece, where I've specifically asked to only replace specific segments of 
resized thin-pool within your latest VG metadata - since those likely have
all the proper mappings to thin LVs.

While you have taken the metadata from 'resize' moment - you've lost all
the thinLV lvm2 metadata for later created one.

I'll try to make one for you.

>     to look for while editing the XML from thin_dump, and I would very
>     much like to avoid causing further damage to my system. (Also, FWIW,
>     thin_dump appears to segfault when run with musl-libc instead of

Well - lvm2 is glibc oriented project - so users of those 'esoteric'
distribution need to be expert on its own.

If you can provide coredump or even better patch for crash - we might
replace the code with something better usable - but there is zero testing
with anything else then glibc...


Zdenek
