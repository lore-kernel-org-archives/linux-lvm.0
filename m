Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8UNEcYR004511
	for <linux-lvm@redhat.com>; Mon, 30 Sep 2013 19:14:38 -0400
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8UNEbgw014073
	for <linux-lvm@redhat.com>; Mon, 30 Sep 2013 19:14:37 -0400
Received: by mail-ie0-f177.google.com with SMTP id qd12so11645466ieb.22
	for <linux-lvm@redhat.com>; Mon, 30 Sep 2013 16:14:37 -0700 (PDT)
From: "Gregory Powiedziuk" <gpowiedziuk@gmail.com>
References: <CADfj0ArxrmGA56dWiyjTPCL8z=iAdHtQV7NHEqEvZbuPd+4_VQ@mail.gmail.com>
	<1380531247.6385.YahooMailNeo@web181503.mail.ne1.yahoo.com>
In-Reply-To: <1380531247.6385.YahooMailNeo@web181503.mail.ne1.yahoo.com>
Date: Mon, 30 Sep 2013 17:14:34 -0600
Message-ID: <02f801cebe32$d436da90$7ca48fb0$@gmail.com>
MIME-Version: 1.0
Content-Language: en-us
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] combined linear + striped
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
Content-Type: text/plain; charset="iso-8859-1"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-
> bounces@redhat.com] On Behalf Of matthew patton
> Sent: Monday, September 30, 2013 2:54 AM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] combined linear + striped
>=20
> >I have 400 disks over here. All these disks live on 4 separate raids 5
> >(ibm ds6000). So stripping across disks within a raid doesn't make any
sens.
>=20
> you don't give the SAN administrators of the US Census Bureau enough
> credit. ;-)
>=20
> >But, what I'd like to do is to stripe it across separate raids.
> >
> >This is how I see it
> >
> >Raid a - disks 1001-1100
> >Raid b - disks 2001-2100
> >Raid c - disks 3001-3100
> >Raid d - disks 4001-3100
> >
> >Stripping would be across every set of 4 disks: 1001,2001,3001,4001 +
> 1002,2002,3002,4002 ... and so on.
> >
> >And all stripped sets would be combined in to one big LV.
> >Is it even possible?
>=20
>=20
> Of course. but I still wouldn't do it en-mass like that. Unless (and even
then)
> you have exactly one workload defined that you want all 400 disks to
> participate in, you'll be FAR better off assigning different workloads to
> different spindle sets (ie. raids). I would go farther and recommend those
> raid sets be broken into much smaller sets of spindles, say 8+P at most.
> Unless you've been handed 100 x 4 "disks" because your SAN admin thought
> it was a brilliant idea to cap the size of each LUN at some silly number
like
> 25GB (yes, EMC used to advocate for such foolishness) and thus they
> represent increasing offsets on the same spindle set.
>=20

Well, I am also a SAN admin here but I have a good explanation :) =20
It is a DS6000 + IBM Mainframe and we are limited to 3390 CKD disks which
are pretty small.
But it is not a big deal. Most of our data live on FCP disks (different
storage system) where size is not an issue.=20
This 'old guy' (DS6000)  is going to be used for backups only. So one big
LVM  makes things much easier.=20

> All that said, lets assume you assigned all 400 LUNs to a single Linux LVM
> Volume Group. Then when you LVCREATE just specify the list of PV (or
> extents therein) you want to use and the order. So,
>=20
> =EF=BF=BD # lvcreate -L ... -n ... vgname pv1001 pv2001 pv3001 pv4001 pv1=
002
pv2002 ...
>=20
>=20

Perfect! That is exactly what I wanted. After doing it this way, performance
seems to be about 3.5 times better!=20
And I can see when I write data to this device, that at the beginning only
1001, 2001, 3001, 4001 are being used and after certain number of gigabytes
it switches to 1002,2002,3002,4002 and so on. Awesome!

> Frankly I'd also look at using the LVcreate Interleave directives to
"stripe" a
> bit more effectively.

I am already happy here  - 3,5x boost from one simple idea and few hours of
work made my day.=20

>=20
>=20
> >I know that I can just create a stripped volume across all 400 volumes
> >but it doesn't really make sens in this set up does it?
>=20
>=20
> Probably not unless you're doing just massive streaming reads or writes. I
> think your first stop should be the SAN admin's cube. Bring a nice, maple
clue
> bat and practice your follow-through. Perfect form is important after
all...

As I said, it is 'just' for backups. It's of course nice when it is fast as
much it is possible but currently, with the new striped LVM setup, the
source won't be able to push the data faster than we can write it here.
Maple clue bat you say... I am glad I do both here - sys admin and san admin
... but there are developers out there so it still may happen ;)

Thank you!=20
Gregory P

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
