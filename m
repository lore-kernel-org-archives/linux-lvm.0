From: Jeff Layton <jeffrey.b.layton@lmco.com>
Subject: Re: [linux-lvm] Re: Building LVM ona RH7.2 - errors
Message-Id: <3C6A9541.34A54984@lmco.com>
MIME-Version: 1.0
References: <E16awby-00059c-00@hermes.sistina.com>
    <1013616001.3175.26.camel@dirac.cids.ca>
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
Date: Wed Feb 13 10:32:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Daniel Savard wrote:

> le mer 13-02-2002 =E0 05:26, linux-lvm-request@sistina.com a =E9crit :
>
> >
> > (sorry about the length). sed is not my string point at all.
> > Any ideas what I'm doing wrong?
> >
> > TIA,
> >
> > Jeff
> >
>
> Jeff,
>
> 1st) Untar the kernel somewhere like: /usr/src/linux-2.4.17
> 2nd) Untar the LVM 1.0.2, it will create the sub-directory 1.0.2 in the
> current dir, for example: /usr/src/LVM/1.0.2
> 3rd) Create the directory /usr/src/LVM/build
> 4th) cd /usr/src/LVM/build
> 5th) ../1.0.2/configure --with-kernel-dir=3D/usr/src/linux-2.4.17
> 6th) Read instructions in /usr/src/LVM/1.0.2/PATCHES/README

Did all that.

I tested on a RH 7.1 box this morning and it worked fine. The
box I'm having trouble with is my home box which I'll try this
evening.

Thanks,

Jeff


>
>
> >From your description, it is not clear, but I guess you mixed LVM stuf=
f
> with Kernel stuff while building the patches and Makefile modifications
> may encountered problems with the Linux kernel Makefile.
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Daniel Savard
> Consultation Informatique Daniel Savard
> 551, boul. Sir-Wilfrid-Laurier
> suite 105
> Beloeil, (Qu=E9bec)
> Canada J3G 4J1
>
> T=E9l: (450) 467-8014
> Internet: dsavard@cids.ca
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
