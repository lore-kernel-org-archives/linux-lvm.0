From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Error compilng tools on RH7.3
Message-Id: <20020426153434.A21305@sistina.com>
References: <43D959D3-58FC-11D6-9EF4-000393452E7E@jvm.de>
MIME-Version: 1.0
In-Reply-To: <43D959D3-58FC-11D6-9EF4-000393452E7E@jvm.de>; from
    stephan.budach@jvm.de on Fri, Apr 26, 2002 at 11:59:14AM +0200
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
Date: Fri Apr 26 08:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Stephan,

you need to pick a vanialla kernel 2.4.18 source and patch the LVM driver=
 in.
We don't support RH prepatched kernels.

Regards,
Heinz    -- The LVM Guy --


On Fri, Apr 26, 2002 at 11:59:14AM +0200, Stephan Budach wrote:
> Hi List,
>=20
> I wanted to try out the LVM with my new RH7.3, (okay, in fact its RH=20
> 7.2.93, but I don=B4t think that this is the problem). My linuy box is=20
> running the 2.4.18-0.13 kernel. I was able to apply the patch lvm-1.0.3=
=20
> and build the kernel.
>=20
> Now, when I try to compile the tools I get the following errors:
>=20
> make[1]: Wechsel in das Verzeichnis Verzeichnis=20
> ?/usr/local/src/LVM/1.0.3/tools/lib?
> make[2]: Wechsel in das Verzeichnis Verzeichnis=20
> ?/usr/local/src/LVM/1.0.3/tools/lib?
> gcc -c -pipe -g -O0 -Wall -DDEBUG -I../../tools/lib -I../../tools=20
> -I/usr/local/src/LVM/1.0.3/tools/lib -o basename.o basename.c
> In file included from ../../tools/lib/liblvm.h:59,
>                   from basename.c:34:
> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header include=
d=20
> in userspace
> make[2]: *** [basename.o] Fehler 1
> make[2]: Verlassen des Verzeichnisses Verzeichnis=20
> ?/usr/local/src/LVM/1.0.3/tools/lib?
> make[1]: *** [all] Fehler 2
> make[1]: Verlassen des Verzeichnisses Verzeichnis=20
> ?/usr/local/src/LVM/1.0.3/tools/lib?
> make[1]: Wechsel in das Verzeichnis Verzeichnis=20
> ?/usr/local/src/LVM/1.0.3/tools/man8?
> make[2]: Wechsel in das Verzeichnis Verzeichnis=20
> ?/usr/local/src/LVM/1.0.3/tools/man8?
> make[2]: Verlassen des Verzeichnisses Verzeichnis=20
> ?/usr/local/src/LVM/1.0.3/tools/man8?
> make[1]: Verlassen des Verzeichnisses Verzeichnis=20
> ?/usr/local/src/LVM/1.0.3/tools/man8?
> make[1]: Wechsel in das Verzeichnis Verzeichnis=20
> ?/usr/local/src/LVM/1.0.3/tools?
> gcc -c -pipe -g -O0 -Wall -DDEBUG -I../tools/lib -I../tools=20
> -I/usr/local/src/LVM/1.0.3/tools/lib -o e2fsadm.o e2fsadm.c
> In file included from ../tools/lib/liblvm.h:59,
>                   from ../tools/lvm_user.h:43,
>                   from e2fsadm.c:55:
> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header include=
d=20
> in userspace
> make[1]: *** [e2fsadm.o] Fehler 1
> make[1]: Verlassen des Verzeichnisses Verzeichnis=20
> ?/usr/local/src/LVM/1.0.3/tools?
> make: *** [all] Fehler 2
>=20
> Can anybody help me with this one?
>=20
> Thanks,
> Stephan
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

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
