From: "Raynaud frederic" <raynaud.f@ifrance.com>
Subject: RE: [linux-lvm] problem to compile lvm-1.0.1.rc4
Date: Wed, 17 Oct 2001 17:27:48 +0200
Message-ID: <000b01c15720$47f76490$7b02a8c0@bor1mp0999>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <000001c1571f$91f28f80$6c88e289@tweety>
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

use kgcc instead of gcc.
i have compile lvm-1.0.1.rc4 this afternoon with kgcc (the compilation
failed with gcc 2.96)

ciao

-----Message d'origine-----
De : linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]De
la part de Christoph Berger
Envoy� : mercredi 17 octobre 2001 17:23
� : linux-lvm@sistina.com
Objet : [linux-lvm] problem to compile lvm-1.0.1.rc4


Hello,
i've tried to compile a newer version of LVM.
I followed the instructions in INSTALL. After patching my kernel 2.4.10,
i tried to compile LVM, but i get the following error message:

:/usr/src/LVM/1.0.1-rc4 # make
make[1]: Entering directory `/usr/src/LVM/1.0.1-rc4/tools'
make[2]: Entering directory `/usr/src/LVM/1.0.1-rc4/tools/lib'
make[3]: Entering directory `/usr/src/LVM/1.0.1-rc4/tools/lib'
gcc -c -pipe -g -O2 -Wall -pg -DDEBUG -I../../tools/lib -I../../tools
-I/usr/src/LVM/1.0.1-rc4/tools/lib -o basename.o basename.c
In file included from basename.c:34:
../../tools/lib/liblvm.h:50: linux/autoconf.h: No such file or directory
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

i have configured LVM with "--with-kernel_dir=/usr/src/linux/".

Can anyone help me?
Thanks for all
Christoph


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

 
______________________________________________________________________________
ifrance.com, l'email gratuit le plus complet de l'Internet !
vos emails depuis un navigateur, en POP3, sur Minitel, sur le WAP...
http://www.ifrance.com/_reloc/email.emailif
