Message-ID: <1058490566.3f1748c60cb94@webmail.phys.unsw.edu.au>
From: Melinda Taylor <melinda@phys.unsw.edu.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] lvm2 compile errors
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
Date: Thu Jul 17 20:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


I am having trouble compiling the lvm2 tools after installing the device =
mapper
(which I think I have done successfully)

During make, i recieve the error:

gcc -c -I. -I../include -DLVM1_INTERNAL -DDEVMAPPER_SUPPORT -DHAVE_LIBDL
-DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wshadow -Wcast-align -Wwrite-strin=
gs
-Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Winline -O2
display/display.c -o display/display.o
make[1]: *** [device/dev-io.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/root/lvm2/LVM2.2.00.03-rc4/lib'
make: *** [lib] Error 2


Anyone have any ideas on this one?

Thanks

melinda
