From: Magosanyi Arpad <mag@bunuel.tii.matav.hu>
Message-ID: <20011106000740.A3409@bunuel.tii.matav.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
Subject: [linux-lvm] Announce: lvm.check v 0.1
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
Date: Mon Nov  5 17:06:01 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

You can find lvm.check attached. It is a replacement of vgck and pvdata,
and looks for any type of inconsistency I could think of (but snapshot=20
related ones).

PLEASE, run it on your system, and report if it reports anything
it should not, or not reports anything when it should.
Attach the output of lvmcheck.py -v -p <your physical volumes>
(I am also happy to get one-liner success reports, to see the statistics.)

It is written in python (sorry, this is an essential package for me).
It works from the physical disk, and does not use any of the LVM code.
This version is absolutely read-only, so you can safely try it on
your physical volumes.

usage:=20
untar it somewhere, if your python interpreter is not in /usr/bin,
then edit the first line of lvmcheck.py
lvmcheck.py -h gives a list of options.
It raises an exception (if -p not given) for the first inconsistency.
This behaviour is intentional, and may be frightening to you:)

synopsys:
lvmcheck.py [options] pv [pv ...]
Give all your pvs of one vg as argument.

example:
=2E/lvm.check/lvmcheck.py -q -p /dev/ide/host0/bus0/target0/lun0/part3 /dev=
/ide/host0/bus0/target0/lun0/part4

anatomy:
types.py is a library for tweaking structures on disk.
	It could be the base for a general-purpose disk editor.
	There is an update method, but os.write is in an unreacheble code path.
structures.py describes the disk structures of lvm. It is very straightforw=
ard.
lvmcheck.py does the heavy work. The pvcheck class reads and checks one pv
(this code should be put into another file, I know), the rest is some helpe=
r functions, and the cross-pv consistency checks.

bugs,todo:
It does not check for relationship of snaphots and their sources. This is t=
he most serious problem I see.
It IS ugly. I never thought that I can write such an ugly code even in pyth=
on:)
This could largely be mitigated by good use of whitespaces, and document st=
rings.
There is no attempt to recover from any error.

maintainer is needed:
If I get a bugreport which really fucks me up, I will tweak it.
In any other case, pick the maintainership, and announce it in the=20
linux-lvm list.

--=20
GNU GPL: csak tiszta forr=E1sb=F3l

--BOKacYhQ+x31HxR3
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="lvm.check.tar.gz"
Content-Transfer-Encoding: base64

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
eZqneZqneZqnv8H0v75IygkAeAAA

--BOKacYhQ+x31HxR3--
