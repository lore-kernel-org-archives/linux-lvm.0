From: Les Hazelton <seawolf@attglobal.net>
Subject: Re: [linux-lvm] Where can I get liblvm?
References: <200305281327.15326.seawolf@attglobal.net> <20030529132717.GA20900@www.13thfloor.at>
In-Reply-To: <20030529132717.GA20900@www.13thfloor.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200305291232.40342.seawolf@attglobal.net>
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
Date: Thu May 29 11:32:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com, Herbert Poetzl <herbert@13thfloor.at>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thursday 29 May 2003 09:27 am, Herbert Poetzl wrote:
> On Wed, May 28, 2003 at 01:27:07PM -0400, Les Hazelton wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > I just installed a fresh copy of Mandrake 9.1 on a formatted drive.  I
> > used the included LVM and reisersfs for most of the directory tree.
> >
> > I also installed the mondo/mindi backup packages. The problem is, when I
> > try to use them they are calling for a file called liblvm which I can't
> > locate in any of the packages included with the MDK 9.1 distro.  Search=
es
> > on google indicate that such a file used to be part of the LVM package.
> >
> > Can anyone help me locate liblvm or tell me what happened to it?
>
> hmm, guess they (re)moved it ...
>
> I had a similar issue, and decided to change the package
> now I use a self made lvm-1.0.7-1mdk which includes
>
> /lib/liblvm-10.so
> /lib/liblvm-10.so.1
> /lib/liblvm-10.so.1.0
>
> if you want, I can send it to you ...
>
> best,
> Herbert

I appreciate the offer.  Still, it would be good experience for me to build=
 it=20
myself.  I just installed the source rpm.  I will tinker with it for a whil=
e.

=2D --=20
Les Hazelton
=2D --- Registered Linux user # 272996 ---
The devil finds work for idle circuits to do.
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE+1jYjlFHS90xAwgwRAk4FAJ0VFzv3bVC4CM+X25l5sScjZrdnWwCfSW2n
nZ8+ylzYI/giz7ClngN26Jk=3D
=3DEWw5
=2D----END PGP SIGNATURE-----
