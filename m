Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Segment Failure ,while doing lvcreate
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF0178FF94@mailsrv.linkvest.com>
From: "Jean-Eric Cuendet" <Jean-Eric.Cuendet@linkvest.com>
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
Date: Fri Oct 26 08:02:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have this same problem.
Could you made a summary of the thread? Is it fixed? In RH7.2 compiler?
In LVM tools? Is -O0 sufficient to fix?
Another solution would be to use kgcc instead of gcc (kgcc is egcs
v1.1.2 or gcc 2.91 and used to build the kernel)

-jec


> -----Original Message-----
> From: Eric M. Hopper [mailto:hopper@omnifarious.org]
> Sent: vendredi, 26. octobre 2001 14:57
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Segment Failure ,while doing lvcreate
>=20
>=20
> On Thu, Oct 25, 2001 at 08:49:18AM -0400, Jason Edgecombe wrote:
> > "Eric M. Hopper" wrote:
> > >         If gcc-2.96-96 doesn't have the problem, RH 7.2=20
> should work just
> > > fine.
> >=20
> > I suspect that the problem will be in RH 7.2 also.
> >=20
> >  I was reading the roswell archive and someone from redhat=20
> said that all
> > 7.x release will be binary compatible, i.e. they all have that buggy
> > gcc.
> >=20
> > I may be wrong on this though.
>=20
> 	Just because it's 2.96 doesn't mean it's buggy.  Apparently
> their latest version happens to have the same bug, but that didn't
> necessarily have to be true.  I doubt the bug is an inherent 'feature'
> of their calling conventions.
>=20
> 	I've actually had a lot of luck with gcc 2.96 fixing problems
> for me.  But, I'm a C++ developer.  :-)
>=20
> Have fun (if at all possible),
> --=20
> "It does me no injury for my neighbor to say there are twenty=20
> gods or no God.
> It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
> "Go to Heaven for the climate, Hell for the company."  -- Mark Twain
> -- Eric Hopper (hopper@omnifarious.org =20
http://www.omnifarious.org/~hopper) --
