From: Octavio Di Sciullo <o.di-sciullo@caramail.com>
Message-Id: <1009367389020268@caramail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
    boundary="=_NextPart_Caramail_0202681009367389_ID"
Subject: [linux-lvm] Procedure to pvmove PE's on bad media?
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
Date: Wed Dec 26 05:47:01 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--=_NextPart_Caramail_0202681009367389_ID
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

	i know this issue has been adressed on previous threads,
but i havent been able to resolve my problem with the work
arounds or patches issued, so i will submit my problem here.

	First off, here's some info in my configuration :

	debian linux 2.4.2
	lvm 0.9 (as issued from packages lvm_0.9-2_i386.deb and
liblvm_0.9-2_i386.deb)
	e2fsprogs 1.19-3
	resize2fs 1.03-1

	i have 1 lvm LV (concat) set up on 3 drives (1xWD 25GB,
2xIBM 40GB). A while ago, the WD drive crashed and i had to
reinstall a system ( / was on it) and restore the lvm
configuration, which went about just fine. I managed to get
my VG & LV back, no trouble there. Now, the trouble is i
want to remove the WD drive from the lvm conf and not
surprisingly, i end up with 5 PE on the partition used by
lvm on this drive (hda3) completely unreadable, which pvmove
wont reallocate. Its definitely a read error, no problem
there, i get the whole package : funny noises from the
drive, i/o read errors from syslogd, and here's what pvmove
has to say about it when i try to move one of these PE:

willy:/var/tmp# pvmove -n lvol1:6023 /dev/hda3 /dev/hdc1
pvmove -- moving physical extents in active volume group
"vg01"
pvmove -- WARNING: moving of active logical volumes may
cause data loss!
pvmove -- do you want to continue? [y/n] y
pvmove -- ERROR reading input physical volume "/dev/hda3"

pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe

pvmove -- ERROR "pv_move_pe(): read input PV" moving
physical extents


	I've tried to apply to pvmove (from lvm 0.9.1b7) the patch
issued on this thread :
http://lists.sistina.com/pipermail/linux-lvm/2001-September/008767.html
, but unfortunately, it doesnt work :/. With this "forced"
pvmove, i get an endless read loop :

"read:-1 to_read:512
read:-1 to_read:512
read:-1 to_read:512
read:-1 to_read:512"
..... (i let it run for about 4h and the output never
changed, nor as the drive never ceased to produce scary
noises)

	Now i dont really know if this the proper behavior of the
patched pvmove in case it REALLY doesnt manage to read the
data (i thought this was what the patch was for), or if i
have a compatibility problem with my 0.9 lvm installed and
the 0.9.1b7 patched pvmove.... I tried (a bit) to upgrade to
0.9.1b7 but i get dependency conflicts.

	Does anyone have any ideas on how to solve this, except for
dumping all data on a new LV built on new drives?

		Octavio

PS: i am, of course, available for any further info on my
configuration if it is required.
______________________________________________________
Bo=EEte aux lettres - Caramail - http://www.caramail.com


--=_NextPart_Caramail_0202681009367389_ID--
