Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6JLCZma004756
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 17:12:36 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6JLCQeh011752
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 17:12:26 -0400
Received: by iwn7 with SMTP id 7so6724408iwn.33
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 14:12:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <512034.66107.qm@web137320.mail.in.yahoo.com>
References: <AANLkTiknRBZed0bWdmqb17og_i474Dvz-MNkmuSOUG_6@mail.gmail.com>
	<512034.66107.qm@web137320.mail.in.yahoo.com>
Date: Mon, 19 Jul 2010 17:12:25 -0400
Message-ID: <AANLkTilGmL8ExwUf53KYV83dzXsbi-VzIstmy9QdjWy4@mail.gmail.com>
From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] COW store
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jul 19, 2010 at 3:06 PM, andiket a <truly_linux@yahoo.co.in> wrote:
>
> Greg,
>
> You got absolutely right.
> That is exactly what I actually wanted to ask.
>
> I didn't know about this pv stuff for original LVs n snapshot LVs.
> Let me look at the lvcreate once again.
>
> I want the cow store to go on to a separate physical device.
>

You can create new LVs on the PVs you want by simply adding a PV param
at the end of the lvcreate line.  (See the man page).

But assuming you already have LVs created:

Use "lvdisplay -m" to show you which PVs your current LVs are on.

Assuming the LVs are not on the PVs you want them to be on, then you
can use pvmove to move the LV extents off of one PV and onto another.
I believe that can be done without disabling the LV, but I don't
recall testing it.

In my case I have 2 PVs:

PV /dev/sdb1 is for my main data and PV /dev/sda3 is for my snapshots.

If I just want to move all the LV extents off a PV so you can dedicate
it to snapshots, you can simply:

pvmove /dev/sda3               where /dev/sda3  would be the PV I'm
trying to free up.

So when setting things up I could have done "pvmove /dev/sda3" to
ensure my PV wasn't used for normal LVs.

Then one of my nightly scripts has this in it:

lvcreate --snapshot -L 45g --name data_snap /dev/TruStore-Data/data /dev/sda3

I believe that says "create a 45GB snapshot named data_snap of the
main LV on the PV /dev/sda3".  (I set that up years ago, and I admit
to not testing it recently.)

And since I setup /dev/TruStore-Data/data to be on /dev/sdb1, I know
the main LV and snapshot LV are on different PVs.

Again, at any point I can run "lvdisplay -m" to double check things
are the way I want them.

Hope that helps
Greg
