From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200211210441.48883.Dieter.Nuetzel@hamburg.de>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Is is possible to have "boot" and "/" in LVM on top of SW RAID5?
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
Date: Wed Nov 20 22:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

I have 5 ATA disks (4 RAID5 + spare) all as master on three controllers (2 =
at=20
a time on two PCI cards and the spare on first channel of the onbaord=20
controller.

Some problems with device mapping in lilo-2.22x (SuSE 8.1).
Sometimes hda, hde, hdg, hdi, hdk
the hda, hdc, hde, hdg, hdj

Any hints/thought?

It would be very nice if this works because than I can pull a whole disk if=
=20
one fails and the "spare" jumps in.

Thanks,
	Dieter
=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)
