Message-ID: <B8E11CED6182E246A9A427A68A9F640670E596@OA4-SERVER.oa.oclc.org>
From: "Fought,Tom" <foughtt@oclc.org>
Subject: RE: [linux-lvm] problem to compile lvm-1.0.1.rc4
Date: Wed, 17 Oct 2001 12:04:26 -0400
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

autoconf.h is in /usr/src/linux/include/linux
somehow your path to the source includes is inaccurate.
I have downloaded rc4... and followed all directions
with  the only problem being the -O2 optimization switch
which needed to be changed to -O0. (thanks heinz). compiled
with gcc 2.96.

-----Original Message-----
From: Raynaud frederic [mailto:raynaud.f@ifrance.com]
Sent: Wednesday, October 17, 2001 11:28 AM
To: linux-lvm@sistina.com
Subject: RE: [linux-lvm] problem to compile lvm-1.0.1.rc4


use kgcc instead of gcc.
i have compile lvm-1.0.1.rc4 this afternoon with kgcc (the compilation
failed with gcc 2.96)

ciao

-----Message d'origine-----
De : linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]De
la part de Christoph Berger
Envoy=E9 : mercredi 17 octobre 2001 17:23
=C0 : linux-lvm@sistina.com
Objet : [linux-lvm] problem to compile lvm-1.0.1.rc4


Hello,
i've tried to compile a newer version of LVM.
I followed the instructions in INSTALL. After patching my kernel =
2.4.10,
i tried to compile LVM, but i get the following error message:

:/usr/src/LVM/1.0.1-rc4 # make
make[1]: Entering directory `/usr/src/LVM/1.0.1-rc4/tools'
make[2]: Entering directory `/usr/src/LVM/1.0.1-rc4/tools/lib'
make[3]: Entering directory `/usr/src/LVM/1.0.1-rc4/tools/lib'
gcc -c -pipe -g -O2 -Wall -pg -DDEBUG -I../../tools/lib -I../../tools
-I/usr/src/LVM/1.0.1-rc4/tools/lib -o basename.o basename.c
In file included from basename.c:34:
../../tools/lib/liblvm.h:50: linux/autoconf.h: No such file or =
directory
make[3]: *** [basename.o] Error 1
make[3]: Leaving directory `/usr/src/LVM/1.0.1-rc4/tools/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/usr/src/LVM/1.0.1-rc4/tools/lib'
make[2]: Entering directory `/usr/src/LVM/1.0.1-rc4/tools/man8'
make[3]: Entering directory `/usr/src/LVM/1.0.1-rc4/tools/man8'
make[3]: Leaving directory `/usr/src/LVM/1.0.1-rc4/tools/man8'
make[2]: Leaving directory `/usr/src/LVM/1.0.1-rc4/tools/man8'
make[2]: Entering directory `/usr/src/LVM/1.0.1-rc4/tools'
gcc -c -pipe -g -O2 -Wall -pg -DDEBUG -I../tools/lib -I../tools
-I/usr/src/LVM/1.0.1-rc4/tools/lib -o e2fsadm.o e2fsadm.c
In file included from ../tools/lvm_user.h:41,
                 from e2fsadm.c:53:
../tools/lib/liblvm.h:50: linux/autoconf.h: No such file or directory
make[2]: *** [e2fsadm.o] Error 1
make[2]: Leaving directory `/usr/src/LVM/1.0.1-rc4/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/usr/src/LVM/1.0.1-rc4/tools'
make[1]: Entering directory `/usr/src/LVM/1.0.1-rc4'
/bin
**********************************
There were errors in your compile.
**********************************

make[1]: *** [.touchbuilt] Error 1
make[1]: Leaving directory `/usr/src/LVM/1.0.1-rc4'
make: *** [all] Error 2

i have configured LVM with "--with-kernel_dir=3D/usr/src/linux/".

Can anyone help me?
Thanks for all
Christoph


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=20
________________________________________________________________________=
____
__
ifrance.com, l'email gratuit le plus complet de l'Internet !
vos emails depuis un navigateur, en POP3, sur Minitel, sur le WAP...
http://www.ifrance.com/_reloc/email.emailif



_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
