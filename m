Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Date: Fri, 8 Jun 2001 04:26:20 +0200
References: <NBBBKLKHMJHIJLHOGAOJGECDIPAA.steve.wray@the.net.nz>
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJGECDIPAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Message-Id: <01060804262004.26916@lyta>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Steve Wray <steve.wray@the.net.nz>

On Thursday 07 June 2001 23:52, Steve Wray wrote:
> > From: linux-lvm-admin@sistina.com
> > [mailto:linux-lvm-admin@sistina.com]On Behalf Of Steven Lembark
> >
> > > Tell me, what is wrong with having /tmp as a mount point
> > > for a LV?
> >
> > LV are generally slower than other types of storage.  Since the
> > boot partition is generally cyl 0 it's on the fastest storage
> > available (short of tmpfs).
>
> Proportionally, how much slower is it? 50%? 25%? 12%?
> less than 1% slower?
> Does it really matter?

See my Bonnie++ web page, particularly the ZCAV part.  The graph shows=20
the start of the disk being ~80% faster than the end.  Try it out on your=
=20
own drives!

This isn't an LVM issue, it's a disk geometry layout issue.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
