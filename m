Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: How about ext3? (was RE: [linux-lvm] XFS and LVM)
Date: Wed, 23 May 2001 20:35:36 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJAEMPIOAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010523083432.3601F15CB5@mail.linux-new-media.de>
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

Any experience with ext3?
Is it shrinkable?


> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Harald Milz
> Sent: Wednesday, May 23, 2001 8:35 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] XFS and LVM
>
>
> In article <20010523010640.C2933@vestdata.no>, Ragnar Kj=EF=BF=BDrstad
> <lvm@ragnark.vestdata.no> wrote:
> >>
> >> It wouldn't mount afterward... It was only on /usr/local
> >> whuch was backed up.
>
> > Did you report it to reiserfs-list@namesys.com?
>
> That doesn't always help. I once had a ~1 meg file in the reiserfs root
> filesystem which wouldn't delete but I laways got a nice oops. I reported
> it to Hans and got a reply that someone would look at it bit that never
> actually happened (at least got no feedback).
>
> But that was just once. I still have everything on reiserfs on LVM on my
> machines, and just started to experiment with XFS. The fact that it is not
> shrinkable is a bit annoying though. Like AIX JFS. ...
>
> --
> Harald Milz           |     hm@linux-magazin.de     | If one studies too
> Linux Magazin         | phone  +49 (0) 89 993411-20 | zealously,
> one easily
> Stefan-George-Ring 24 | fax    +49 (0) 89 993411-99 | loses his pants. --
> D-81929 Muenchen      | http://www.linux-magazin.de | A. Einstein.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
