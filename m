MIME-Version: 1.0 (Apple Message framework v481)
From: Stephan Budach <stephan.budach@jvm.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <43D959D3-58FC-11D6-9EF4-000393452E7E@jvm.de>
Subject: [linux-lvm] Error compilng tools on RH7.3
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
Date: Fri Apr 26 04:58:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Hi List,

I wanted to try out the LVM with my new RH7.3, (okay, in fact its RH=20
7.2.93, but I don=B4t think that this is the problem). My linuy box is=20=

running the 2.4.18-0.13 kernel. I was able to apply the patch lvm-1.0.3=20=

and build the kernel.

Now, when I try to compile the tools I get the following errors:

make[1]: Wechsel in das Verzeichnis Verzeichnis=20
?/usr/local/src/LVM/1.0.3/tools/lib?
make[2]: Wechsel in das Verzeichnis Verzeichnis=20
?/usr/local/src/LVM/1.0.3/tools/lib?
gcc -c -pipe -g -O0 -Wall -DDEBUG -I../../tools/lib -I../../tools=20
-I/usr/local/src/LVM/1.0.3/tools/lib -o basename.o basename.c
In file included from ../../tools/lib/liblvm.h:59,
                  from basename.c:34:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included=20=

in userspace
make[2]: *** [basename.o] Fehler 1
make[2]: Verlassen des Verzeichnisses Verzeichnis=20
?/usr/local/src/LVM/1.0.3/tools/lib?
make[1]: *** [all] Fehler 2
make[1]: Verlassen des Verzeichnisses Verzeichnis=20
?/usr/local/src/LVM/1.0.3/tools/lib?
make[1]: Wechsel in das Verzeichnis Verzeichnis=20
?/usr/local/src/LVM/1.0.3/tools/man8?
make[2]: Wechsel in das Verzeichnis Verzeichnis=20
?/usr/local/src/LVM/1.0.3/tools/man8?
make[2]: Verlassen des Verzeichnisses Verzeichnis=20
?/usr/local/src/LVM/1.0.3/tools/man8?
make[1]: Verlassen des Verzeichnisses Verzeichnis=20
?/usr/local/src/LVM/1.0.3/tools/man8?
make[1]: Wechsel in das Verzeichnis Verzeichnis=20
?/usr/local/src/LVM/1.0.3/tools?
gcc -c -pipe -g -O0 -Wall -DDEBUG -I../tools/lib -I../tools=20
-I/usr/local/src/LVM/1.0.3/tools/lib -o e2fsadm.o e2fsadm.c
In file included from ../tools/lib/liblvm.h:59,
                  from ../tools/lvm_user.h:43,
                  from e2fsadm.c:55:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included=20=

in userspace
make[1]: *** [e2fsadm.o] Fehler 1
make[1]: Verlassen des Verzeichnisses Verzeichnis=20
?/usr/local/src/LVM/1.0.3/tools?
make: *** [all] Fehler 2

Can anybody help me with this one?

Thanks,
Stephan
--
Stephan Budach

Jung von Matt/Services

Glash=FCttenstrasse 38   			20357 Hamburg
Telefon: +49-40-4321-1353    		Fax: +49-40-4321-1114
eMail: stephan.budach@jvm.de	Internet: http://www.jvm.de
