Subject: Re: [linux-lvm] Error compilng tools on RH7.3
From: Jeremy Katz <katzj@redhat.com>
In-Reply-To: <B86C6678-594A-11D6-AE50-000393452E7E@jvm.de>
References: <B86C6678-594A-11D6-AE50-000393452E7E@jvm.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1019850846.2773.21.camel@mordor.devel.redhat.com>
MIME-Version: 1.0
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
Date: Fri Apr 26 14:54:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

This is intentional.  Userland apps should not be including these
headers and any that do are broken, so the header has #error in it so
that the broken apps can be found and fixed.

Cheers,

Jeremy

On Fri, 2002-04-26 at 15:20, Stephan Budach wrote:
> Yeah, that=B4s true, but note also that the provided autoconf.h in=20
> /usr/include/linux didn=B4t beared anything useful in it at all.
>=20
> Stephan
>=20
> Am Freitag den, 26. April 2002, um 20:19, schrieb Jeremy Katz:
>=20
> > No, the problem is that the LVM user-space tools are trying to use
> > kernel headers which should never be used from userland as they only
> > contain information which is useful for inside the kernel.
> >
> > Keep in mind that /usr/include/linux does not always contain the same
> > headers as the kernel being used, instead being the headers that glibc
> > was compiled with.
> >
> > IIRC, nothing is actually needed from linux/autoconf.h, so the proper
> > solution is that the file just shouldn't be included by liblvm.h
> >
> > Cheers,
> >
> > Jeremy
> >
> > On Fri, 2002-04-26 at 11:36, Stephan Budach wrote:
> >> Oh well,
> >>
> >> i have managed to get this running with RH. Simply link the provides
> >> autoconfig.h from /usr/src/linux-2.4.18/include/linux/autoconfig to
> >> /usr/include/linux and off we go.
> >>
> >> Just tested with some pv/lv stuff and it worked great.
> >>
> >> It=B4s=B4pretty easy to use and straightforward in its design.
> >>
> >> Thanks,
> >> Stephan
> >>
> >> Am Freitag den, 26. April 2002, um 15:34, schrieb Heinz J .=20
> >> Mauelshagen:
> >>
> >>>
> >>> Stephan,
> >>>
> >>> you need to pick a vanialla kernel 2.4.18 source and patch the LVM
> >>> driver in.
> >>> We don't support RH prepatched kernels.
> >>>
> >>> Regards,
> >>> Heinz    -- The LVM Guy --
> >>>
> >>>
> >>> On Fri, Apr 26, 2002 at 11:59:14AM +0200, Stephan Budach wrote:
> >>>> Hi List,
> >>>>
> >>>> I wanted to try out the LVM with my new RH7.3, (okay, in fact its RH
> >>>> 7.2.93, but I don=B4t think that this is the problem). My linuy box =
is
> >>>> running the 2.4.18-0.13 kernel. I was able to apply the patch=20
> >>>> lvm-1.0.3
> >>>> and build the kernel.
> >>>>
> >>>> Now, when I try to compile the tools I get the following errors:
> >>>>
> >>>> make[1]: Wechsel in das Verzeichnis Verzeichnis
> >>>> ?/usr/local/src/LVM/1.0.3/tools/lib?
> >>>> make[2]: Wechsel in das Verzeichnis Verzeichnis
> >>>> ?/usr/local/src/LVM/1.0.3/tools/lib?
> >>>> gcc -c -pipe -g -O0 -Wall -DDEBUG -I../../tools/lib -I../../tools
> >>>> -I/usr/local/src/LVM/1.0.3/tools/lib -o basename.o basename.c
> >>>> In file included from ../../tools/lib/liblvm.h:59,
> >>>>                   from basename.c:34:
> >>>> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header
> >>>> included
> >>>> in userspace
> >>>> make[2]: *** [basename.o] Fehler 1
> >>>> make[2]: Verlassen des Verzeichnisses Verzeichnis
> >>>> ?/usr/local/src/LVM/1.0.3/tools/lib?
> >>>> make[1]: *** [all] Fehler 2
> >>>> make[1]: Verlassen des Verzeichnisses Verzeichnis
> >>>> ?/usr/local/src/LVM/1.0.3/tools/lib?
> >>>> make[1]: Wechsel in das Verzeichnis Verzeichnis
> >>>> ?/usr/local/src/LVM/1.0.3/tools/man8?
> >>>> make[2]: Wechsel in das Verzeichnis Verzeichnis
> >>>> ?/usr/local/src/LVM/1.0.3/tools/man8?
> >>>> make[2]: Verlassen des Verzeichnisses Verzeichnis
> >>>> ?/usr/local/src/LVM/1.0.3/tools/man8?
> >>>> make[1]: Verlassen des Verzeichnisses Verzeichnis
> >>>> ?/usr/local/src/LVM/1.0.3/tools/man8?
> >>>> make[1]: Wechsel in das Verzeichnis Verzeichnis
> >>>> ?/usr/local/src/LVM/1.0.3/tools?
> >>>> gcc -c -pipe -g -O0 -Wall -DDEBUG -I../tools/lib -I../tools
> >>>> -I/usr/local/src/LVM/1.0.3/tools/lib -o e2fsadm.o e2fsadm.c
> >>>> In file included from ../tools/lib/liblvm.h:59,
> >>>>                   from ../tools/lvm_user.h:43,
> >>>>                   from e2fsadm.c:55:
> >>>> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header
> >>>> included
> >>>> in userspace
> >>>> make[1]: *** [e2fsadm.o] Fehler 1
> >>>> make[1]: Verlassen des Verzeichnisses Verzeichnis
> >>>> ?/usr/local/src/LVM/1.0.3/tools?
> >>>> make: *** [all] Fehler 2
> >>>>
> >>>> Can anybody help me with this one?
> >>>>
> >>>> Thanks,
> >>>> Stephan
> >>>> --
> >>>> Stephan Budach
> >>>>
> >>>> Jung von Matt/Services
> >>>>
> >>>> Glash=FCttenstrasse 38   			20357 Hamburg
> >>>> Telefon: +49-40-4321-1353    		Fax: +49-40-4321-1114
> >>>> eMail: stephan.budach@jvm.de	Internet: http://www.jvm.de
> >>>>
> >>>>
> >>>> _______________________________________________
> >>>> linux-lvm mailing list
> >>>> linux-lvm@sistina.com
> >>>> http://lists.sistina.com/mailman/listinfo/linux-lvm
> >>>> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >>>
> >>> *** Software bugs are stupid.
> >>>     Nevertheless it needs not so stupid people to solve them ***
> >>>
> >>> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
> >>> -=3D
> >>> -=3D-=3D-
> >>>
> >>> Heinz Mauelshagen                                 Sistina Software=20
> >>> Inc.
> >>> Senior Consultant/Developer                       Am Sonnenhang 11
> >>>                                                   56242 Marienrachdor=
f
> >>>                                                   Germany
> >>> Mauelshagen@Sistina.com                           +49 2626 141200
> >>>                                                        FAX 924446
> >>> =3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
> >>> -=3D
> >>> -=3D-=3D-
> >>>
> >>> _______________________________________________
> >>> linux-lvm mailing list
> >>> linux-lvm@sistina.com
> >>> http://lists.sistina.com/mailman/listinfo/linux-lvm
> >>> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >>>
> >> --
> >> Stephan Budach
> >>
> >> Jung von Matt/Services
> >>
> >> Glash=FCttenstrasse 38   			20357 Hamburg
> >> Telefon: +49-40-4321-1353    		Fax: +49-40-4321-1114
> >> eMail: stephan.budach@jvm.de	Internet: http://www.jvm.de
> >>
> >>
> >> _______________________________________________
> >> linux-lvm mailing list
> >> linux-lvm@sistina.com
> >> http://lists.sistina.com/mailman/listinfo/linux-lvm
> >> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> --
> Stephan Budach
>=20
> Jung von Matt/Services
>=20
> Glash=FCttenstrasse 38   			20357 Hamburg
> Telefon: +49-40-4321-1353    		Fax: +49-40-4321-1114
> eMail: stephan.budach@jvm.de	Internet: http://www.jvm.de
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
