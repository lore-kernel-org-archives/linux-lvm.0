Return-Path: <silva@athenea.ort.edu.uy>
From: Ernesto Silva <silva@athenea.ort.edu.uy>
Subject: RE: [linux-lvm] K=2.4.3 - LVM0.9.1.B7 compiling problem.
Date: Tue, 24 Apr 2001 15:37:45 -0300
References: <1D15D20781EB404E9EA6129359E0243909784E@sp1email.optiglobe.com.br>
In-Reply-To: <1D15D20781EB404E9EA6129359E0243909784E@sp1email.optiglobe.com.br>
MIME-Version: 1.0
Message-Id: <01042415450706.07748@pc-silva>
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Sorry HugZ,
	I just did it but I'm still getting the same garbage.....

	Does anyone have another idea????

	WOUUW, I let it compile, with all the warnings and it worked, I just
run vgscan and it found something.
	I'll let you know what happends next......

Ernesto.


On Tue, 24 Apr 2001, Paulo Fessel wrote:
>=20
> I've run into problems trying to compile 2.4.3 on Mandrake 7.2 with 2.4.3
> (Linus) and 2.4.3-8mdk (Mandrake customized kernel). So I've copied the
> files from lvm "kernel" directory to their proper places and everything
> worked out smoothly. Try to do the same thing...
>=20
> HugZ
>=20
> Paulo Afonso Graner Fessel
> Suporte de Sistemas
> OptiGlobe Telecom, Ltda. - The Internet Lives Here
> R.Bento Branco de Andrade Filho, 621
> S=EF=BF=BDo Paulo, SP, 04757-000
> Brasil
> http://www.optiglobe.com.br
>=20
> Tel.:+55 11 3365-4478
> Fax:+55 11 3365-4445
> Cel.:+55 11 9198-9985
> E-mail: paulo_fessel@optiglobe.com.br
>=20
>=20
>=20
> > -----Original Message-----
> > From: Ernesto Silva [mailto:silva@athenea.ort.edu.uy]
> > Sent: Tuesday, April 24, 2001 12:20 PM
> > To: linux-lvm@sistina.com
> > Subject: [linux-lvm] K=3D2.4.3 - LVM0.9.1.B7 compiling problem.
> >=20
> >=20
> > Hi,
> >=20
> > 	In order to make things right I downloaded the 2.4.3 kernel and
> > compiled it (i386).
> >=20
> > 	With the new kernel running (lvm-mod load ok) I'm=20
> > trying to compile lvm
> > tools, but there are lots of warinigs, all the same thing,=20
> > the first of them is:
> > -----------------------------------------------------------
> > gcc -c -pipe -g -O2 -Wall -DDEBUG -I ../../tools/lib -I=20
> > ../../tools - debug.o
> > debug.c
> > In file included from ../../tools/lib/liblvm.h:97
> > 		from basename.c:34
> > ../../tools/lib/lvm_log.h:47:59: warning: nothing can be=20
> > pasted after this token
> > ../../tools/lib/lvm_log.h:48:59: warning: nothing can be=20
> > pasted after this token
> > ../../tools/lib/lvm_log.h:49:59: warning: nothing can be=20
> > pasted after this token
> > ../../tools/lib/lvm_log.h:52:39: warning: nothing can be=20
> > pasted after this token
> > gasename.c:41:69: warning: pasting would not give a valid=20
> > preprocessing token
> > gasename.c:59:68: warning: pasting would not give a valid=20
> > preprocessing token
> > ----------------------------------------------------------
> >  This messages repeats several times.
> >=20
> > Does anyone had a problem like this before???
> >=20
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >=20
>=20

----------------------------------------
Content-Type: text/html; name=3D"unnamed"
Content-Transfer-Encoding: quoted-printable
Content-Description:=20
----------------------------------------
