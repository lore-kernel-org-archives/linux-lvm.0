Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAFMRLYr026363
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 17:27:21 -0500
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFMR95r024608
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 17:27:09 -0500
Received: by eye27 with SMTP id 27so3360083eye.33
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 14:27:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20101115214735.GF20084@barkeeper1-xen.linbit>
References: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
	<20101115214735.GF20084@barkeeper1-xen.linbit>
Date: Mon, 15 Nov 2010 17:27:08 -0500
Message-ID: <AANLkTikuW27+C17HwxRa6WGm1Dtq3QiTWGUi6M7zLLj3@mail.gmail.com>
From: Stirling Westrup <swestrup@gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Move pvmove questions Was: Need help with a
 particular use-case for pvmove.
Reply-To: swestrup@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 15, 2010 at 4:47 PM, Lars Ellenberg
<lars.ellenberg@linbit.com> wrote:
> On Mon, Nov 15, 2010 at 02:53:29PM -0500, Stirling Westrup wrote:
>> On Sun, Nov 14, 2010 at 6:52 PM, Stirling Westrup <swestrup@gmail.com> w=
rote:
>> >>
>> > Thanks for going through all those steps. It does make the procedure a
>> > lot clearer in my mind, and it does look like dd_rescue is the way to
>> > go then. I'm going to head off to try it now.
>> >
>>
>> Okay, I've tried the dd_rescue method that was outlined for me, and it
>> failed, although not for any reasons inherent in the method. It seems
>> that what is wrong with my 'flakey' drive is not that it has bad
>> sectors, but that it has a tendency to heat up when used, and then
>> fail all operations until its cooled down.
>
> You can hook up your old drive to the external sata,
> and point a fan right at it,
> or even use a long eSATA cable and put it in the fridge. =EF=BF=BDNo joke=
, this
> has been done to successfully recover data from failing drives.

I don't have a cable long enough to try the fridge trick, but I'm
going to try a fan, and maybe rest it on a metal container full of
ice. If it works, this might make the rest of my questions a bit
redundant, but still...

> I find useful:
> # lvs -o +seg_pe_ranges
>
Aha! Thanks. That's just what I was hoping for. Again, I was looking
for a pv_ option, not an lg_ one, as I assumed that PEs were the
purview of the physical volume layer.


>> 2) how often are checkpoints made, and can you control that in any way?
>
> IIRC, pvmove does one PE at a time,
> and will checkpoint each of these.
> Depending on wether or not you set the PE size explicitly on vgcreate
> time, this frequent checkpointing every few MB may slow down things.

I didn't set my PE size explicitly, so I checked in /etc/lvm/backup
and it looks like I have 4mb extents. This should mean that I'm making
significant progress every time I attempt to continue the pvmove.

Now, is there any way to monitor that progress? Every time I issued a
bare 'pvmove' to continue the operation, it starts counting from 0%
again. I'm assuming (hoping!) this is a percentage of the amount LEFT
to move, not the total amount that needs to be moved, but I'd love
some way to verify this.

> pvmove /dev/sda:7-9 /dev/sde:7-9

Okay. What if I don't care where the PE's end up? Can I just say:

pvmove /dev/sda:1000-1500 /dev/sdb

and assume it will do something reasonable? I currently don't have any
fragmentation anywhere, so I would hope this would just work.

> Does that make sense?

Yes, it does. You've been extremely helpful so far.

--=20
Stirling Westrup
Programmer, Entrepreneur.
https://www.linkedin.com/e/fpf/77228
http://www.linkedin.com/in/swestrup
http://technaut.livejournal.com
