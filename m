From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Message-ID: <20011122130938.A3568@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] known bug, patch?
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
Date: Thu Nov 22 06:06:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,
I wanna move a pv now and get this error:
"pvmove -v /dev/hdb1"
=2E..
pvmove -- /dev/hdb1 [PE 2014 [special_artists [LE 2014]] -> /dev/sdc5
[PE 3262] [1/1]
pvmove -- ERROR reading input physical volume "/dev/hdb1" (still 65536
bytes to read)

pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe

pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents


I looked in the archive and found it as known bug.
So I tryed to change tools/lib/pv_move.c and tools/pvmove.c as described
at=20
http://lists.sistina.com/pipermail/linux-lvm/2001-September/008767.html

But after the "make" it doesn=B4t build the new pvmove. If I try make
install I get this error:
gcc -c -pipe -g -O2 -Wall -pg -DDEBUG -I../tools/lib -I../tools
-I/usr/local/src/LVM/1.0.1-rc4/tools/lib -o pvmove.o pvmove.c
pvmove.c: In function `main':
pvmove.c:85: undefined or invalid # directive
make[2]: *** [pvmove.o] Fehler 1
make[2]: Leaving directory `/usr/local/src/LVM/1.0.1-rc4/tools'
make[1]: *** [all] Fehler 2


Does anybody have a patch for it, please send it as PM.

At the moment I use 1.0.1-rc4, but this pv=B4s were created with 0.9x (?).

Thanks
Uli

--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
