From: Stefan Weigel <sw@global-linxs.de>
Subject: Re: [linux-lvm] Re: problem with lvm on root-fs
References: <200210170859.03682.sw@global-linxs.de> <20021017071524.GD20994@percy.comedia.it>
In-Reply-To: <20021017071524.GD20994@percy.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200210170935.12777.sw@global-linxs.de>
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
Date: Thu Oct 17 02:51:05 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Am Donnerstag, 17. Oktober 2002 09:15 schrieb Luca Berra:
> On Thu, Oct 17, 2002 at 08:59:03AM +0200, Stefan Weigel wrote:
> >Hi erveryone!
> >I'm a little bit closer now. I've create an initrd with lvmcreate_init=
rd.
> >In this initrd there was no module for my mylex-raid-controller. I've
> > fixed that problem, e.g. put the kernel module in it and changed linu=
xrc.
> > After rebooting there's another kernel panic, but on this time the sy=
stem
> > finds my volume groups. Output:
> >
> >kernel panic: no init found. Try passing init=3D to...
>
> this usually means it couldn't mount your root fs, or got it wrong
>
> L.

Hi,
that's right, but where's my problem ? I've used the howto from sistina.c=
om to=20
convert my root-fs. On a non lvm root partition there are no problems.=20
There's already the entry in /etc/fstab pointing to my root-fs on lvm. Al=
so=20
this is no problem. But when I changing lilo.conf (root=3D) to my root-fs=
 on=20
lvm I get this error. In the initrd there are all needed modules (RAID+lv=
m)=20
and it find my volume groups but still I got this kernel panic. There's a=
=20
/bin/sh, so why it is beefing ?

I'm very confused.

Greetings

Stefan
