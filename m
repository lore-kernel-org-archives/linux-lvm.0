Message-ID: <39F9ADBB.B938E21A@imim.es>
Date: Fri, 27 Oct 2000 18:30:51 +0200
From: Xavi Fustero <xfustero@imim.es>
MIME-Version: 1.0
Subject: [linux-lvm] Problems compiling LVM
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM group <linux-lvm@msede.com>

I have Red Hat 6.2 with kernel 2.2.17 patched with mosix. I downloaded:
lvm_0.8-pre02.10.1999.tar.gz  and  patch-2.2.13-LVM-0.8i.gz

I patched the kernel and it went right. Mosix still works properly and I
can load lvm modules.
However, I can not compile the LVM application. I try to understand and
modify the makefile but I did not success. I report my error messages to
see if anybody can help me because I do not see the light !!!!

>make

make[1]: Entering directory `/root/src/LVM/0.8-pre02.10.1999/tools'
make[2]: Entering directory `/root/src/LVM/0.8-pre02.10.1999/tools/lib'
make[3]: Entering directory `/root/src/LVM/0.8-pre02.10.1999/tools/lib'
cc -c -pipe -Wall -I/root/src/LVM/0.8-pre02.10.1999 /tools
-I/root/src/LVM/0.8-pre02.10.1999 /tools/lib
-I/root/src/LVM/0.8-pre02.10.1999 /kernel -D__KERNEL__ -O2 -DDEBUG -o
basename.o basename.c
cc: cannot specify -o with -c or -S and multiple compilations
make[3]: *** [basename.o] Error 1
make[3]: Leaving directory `/root/src/LVM/0.8-pre02.10.1999/tools/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/root/src/LVM/0.8-pre02.10.1999/tools/lib'
make[2]: Entering directory `/root/src/LVM/0.8-pre02.10.1999/tools/man8'

make[3]: Entering directory `/root/src/LVM/0.8-pre02.10.1999/tools/man8'

make[3]: Leaving directory `/root/src/LVM/0.8-pre02.10.1999/tools/man8'
make[2]: Leaving directory `/root/src/LVM/0.8-pre02.10.1999/tools/man8'
make[2]: Entering directory `/root/src/LVM/0.8-pre02.10.1999/tools'
cc -c -pipe -Wall -I/root/src/LVM/0.8-pre02.10.1999 /tools
-I/root/src/LVM/0.8-pre02.10.1999 /tools/lib
-I/root/src/LVM/0.8-pre02.10.1999 /kernel -D__KERNEL__ -O2 -DDEBUG -o
e2fsadm.o e2fsadm.c
cc: cannot specify -o with -c or -S and multiple compilations
make[2]: *** [e2fsadm.o] Error 1
make[2]: Leaving directory `/root/src/LVM/0.8-pre02.10.1999/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/root/src/LVM/0.8-pre02.10.1999/tools'
make: *** [all] Error 2

I do not see how to fix it !!!!! If anybody can help me I would
appreciate his/her help so much.
Thanks in advance,
yours sincerely,
Xavi !

--
Xavi Fustero Benavent
Institut Municipal d'Investigacio Medica (IMIM)
Departament Genome Informatics
Tel.: +34-93-221 10 09    Ext: 2016
