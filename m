Return-Path: <lda@winux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <15018.14466.195540.783117@nv.192.168.71.6>
Date: Sat, 10 Mar 2001 09:21:54 -0500
From: lvm@winux.com
Subject: Re: [linux-lvm] LVM X front end
In-Reply-To: <20010310142747.A1365@dardhal.mired.net>
References: <Pine.LNX.4.20.0103091926210.27453-100000@rdb.linux-help.org>
	<20010310142747.A1365@dardhal.mired.net>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Jos=E9 Luis Domingo L=F3pez writes:
>> Is there any other X front ends for LVM maintenance other than the o=
ne on
>> freshmeat.net?
>
> This is a recurring idea that comes to my mind very often: having a
> reasonably good user interface on top on lvm tools would be nice.
> ...
> Moreover, last Friday I saw the graphical user interface that Veritas=

> Volume Managar ships on Enterprise and higher-priced SCO Unixware
> licences. The UI seemed (IMHO) hardly useful,...

I used the Veritas software for a couple of years.  It was horrible.
The manuals were about 5 inches (13 cm) thick and were a morass of
self-referential jargon.  To understand anything, you had to understand=

something else first.  This was recursive.  I would frequently suffer
from brain-stack overflow and I'd have to reboot my head.

Their command line interface was complex to the point of absurdity but
their X interface was worse.  It made remote administration dreadfully
slow on my remote installations since I had to use PPP over a dialed
line to get into the remote facilities.  Any operation could take
several minutes.=20

> and taking into account that volume mangement is not precisely that
> kind of thing newbies tend to do, command line utilities are the
> best choice for now.

In some shops, everybody is a newbie.  I was a newbie in my first shop
(20+ years ago) but with the help of friends and e-mail (carried by UUC=
P,
no Internet) I could get the answers I needed to climb the learning cur=
ve.

In my opinion, the Linux LVM administrative interface is pretty well
done.  I was delighted to find the command line LVM interface to be
relatively clean, simple, and overlaid with a minimum of jargon.
At first glance, the command line arguments are a bit inconsistent
(e.g., when to use 'lv0' vs '/dev/vg0/lv0') but this is not such a
big problem given that most commands respond well to '--help' or 'man'.=


With faster remote access becoming more common, it's feasible to
consider using a graphical interface to the LVM of a remote system.
However, in that vein, I wouldn't divert from development and
enhancement of the core system for even one day.  As with most
"infrastructure" components, stability, reliability, and consistency
are of prime importance and have to come first.  The "pretty wrappers"
around that core can come later.

It's not yet a mature system but it's being pursued by a group of smart=
,
dedicated people who are genuinely interested in finding and fixing pro=
blems.
This is the most important ingredient and Linux LVM has it in abundance=


Larry
