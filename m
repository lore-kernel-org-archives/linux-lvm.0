From: "Martin Mosny, PosTel a.s." <mmosny@postel.sk>
Message-ID: <1611908674.20020731133430@postel.sk>
Subject: Re: [linux-lvm] Problem compiling LVM 1.0.5
In-Reply-To: <549012796.20020731132606@tnonline.net>
References: <549012796.20020731132606@tnonline.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed Jul 31 06:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Anders Widman <linux-lvm@sistina.com>

Hello Anders,

it's a very simple solution.

in the new RH, glibc-devel and the INCLUDE policy/tactics is to DO NOT
INCLUDE kernel header files to user space program.

you get this error:
#error Invalid kernel header included in userspace

this is only preprocessor directive-it's only to break make.

you can simple use the files from kernel include tree.

change the include path or overwrite the old one.

[root@gis2 root]# more /usr/include/linux/autoconf.h
#error Invalid kernel header included in userspace
[root@gis2 root]#
[root@gis2 root]# more /usr/src/linux/include/linux/autoconf.h
.....

it's save??????

for   now   yes,  all  programers  need  to  change  INCLUDE files for
COMPATIBLE INCLUDE TACTICS. this same problem has a lot of software.
if you want know all about it read some articles on the web! :))

have a nice day!


Martin



Wednesday, July 31, 2002, 1:26:06 PM, you wrote:


AW>    I have a problem with compiling LVM 1.0.5.

AW>    Configure works fine. but when I run make I get this message:


AW> [root@server 1.0.5]# make
AW> make[1]: Entering directory `/usr/src/LVM/1.0.5/tools'
AW> make[2]: Entering directory `/usr/src/LVM/1.0.5/tools/lib'
AW> make[3]: Entering directory `/usr/src/LVM/1.0.5/tools/lib'
AW> gcc -c -pipe -g -O0 -Wall -DDEBUG -I../../tools/lib -I../../tools -I/usr/src/LVM/1.0.5/tools/lib -o basename.o basename.c
AW> In file included from ../../tools/lib/liblvm.h:59,
AW>                  from basename.c:34:
AW> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in userspace
AW> make[3]: *** [basename.o] Error 1
AW> make[3]: Leaving directory `/usr/src/LVM/1.0.5/tools/lib'
AW> make[2]: *** [all] Error 2
AW> make[2]: Leaving directory `/usr/src/LVM/1.0.5/tools/lib'
AW> make[2]: Entering directory `/usr/src/LVM/1.0.5/tools/man8'
AW> make[3]: Entering directory `/usr/src/LVM/1.0.5/tools/man8'
AW> make[3]: Leaving directory `/usr/src/LVM/1.0.5/tools/man8'
AW> make[2]: Leaving directory `/usr/src/LVM/1.0.5/tools/man8'
AW> make[2]: Entering directory `/usr/src/LVM/1.0.5/tools'
AW> gcc -c -pipe -g -O0 -Wall -DDEBUG -I../tools/lib -I../tools -I/usr/src/LVM/1.0.5/tools/lib -o e2fsadm.o e2fsadm.c
AW> In file included from ../tools/lib/liblvm.h:59,
AW>                  from ../tools/lvm_user.h:43,
AW>                  from e2fsadm.c:55:
AW> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in userspace
AW> make[2]: *** [e2fsadm.o] Error 1
AW> make[2]: Leaving directory `/usr/src/LVM/1.0.5/tools'
AW> make[1]: *** [all] Error 2
AW> make[1]: Leaving directory `/usr/src/LVM/1.0.5/tools'
AW> make[1]: Entering directory `/usr/src/LVM/1.0.5'

AW> **********************************
AW> There were errors in your compile.
AW> **********************************

AW> make[1]: *** [.touchbuilt] Error 1
AW> make[1]: Leaving directory `/usr/src/LVM/1.0.5'
AW> make: *** [all] Error 2
   

AW> I am running Red Hat 7.3 with GCC 3.1.1 (and tried with the 2.96 that
AW> came with Red Hat..)

AW> Thanks for any help.

AW> //Anders


AW> _______________________________________________
AW> linux-lvm mailing list
AW> linux-lvm@sistina.com
AW> http://lists.sistina.com/mailman/listinfo/linux-lvm
AW> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
