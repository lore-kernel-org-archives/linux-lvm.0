Date: Thu, 3 Aug 2000 21:26:02 +0200
From: Jens Benecke <jens@pinguin.conetix.de>
Subject: Re: [linux-lvm] Generic resize tool
Message-ID: <20000803212602.I11582@pinguin.conetix.de>
References: <20000802120457.E28254@pinguin.conetix.de> <200008021755.e72Ht2D29237@webber.adilger.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200008021755.e72Ht2D29237@webber.adilger.net>; from adilger@turbolinux.com on Wed, Aug 02, 2000 at 11:55:02AM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Andreas Dilger <adilger@turbolinux.com>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

On Wed, Aug 02, 2000 at 11:55:02AM -0600, Andreas Dilger wrote:
> Jens writes:
> > ... and then being stuck with not knowing how (and how much) to resize
> > the FS within.
> Actually, the resize tools for ext2 (resize2fs, ext2resize, ext2online)
> will all figure out the size of the device, so if you are resizing to the
> full device size (the most common case) then you don't need to specify
> the device size at all.

Yes, I realized that, but it doesn't SAY so anywhere.

See, I am trying to stay non-knowledgeable (or "semi-") for as long as
possible to be able to see beginner's problems and mistakes. If I really
dive into the stuff I will surely be able to solve any problem by
experimenting around, but that is not my short-term goal - rather, to
discover first-usage inconsistencies and misunderstandings and explain
them.

It's not functionality, its usability I'm worried about.
=20
> > Another question: If I shrink a LV, how do I know what PVs in the VG
> > get freed? i.e. I have  one big LV in VG00 =3D (hda1 hdb2 hdc1)  and I
> > want to remove hdb2 out of the VG.=20
> They are always taken from the end of the LV.  There is no other way to
> do it.  What you would need to do is shrink the lv(s) enough to have free
> PEs equal to the number of PEs on hdb2.  Then migrate any in-use PEs on
> hdb2 to the other PVs using pvmove.

Sounds logical. Thanks for pointing this out. :)

I guess in time, there will be a set of tools that allow you to point to a
PV and say "Remove this!" and everything else will be automagic. [just as
an example, of course there are just too many ways of combining the
available tools, to write a new tool for every specific task.]
=20

--=20
ciao, Jens (mailaddr im Header)                 http://www.pinguin.conetix.=
de
"Schiebe nie etwas auf Boshaftigkeit, was           http://www.hitch-hiker.=
de
ausreichend durch Dummheit erkl=EF=BF=BDrt werden kann."       http://www.l=
inuxfaq.de
