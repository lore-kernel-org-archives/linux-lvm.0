Date: Tue, 16 Oct 2001 23:40:34 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Remount a LVM Vol after a system crash
Message-ID: <20011016234034.B7778@sistina.com>
References: <000201c1565e$5affe980$6c88e289@tweety>
Mime-Version: 1.0
In-Reply-To: <000201c1565e$5affe980$6c88e289@tweety>; from chberger@pool.informatik.rwth-aachen.de on Tue, Oct 16, 2001 at 06:19:38PM +0200
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
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com

Christoph,

I assume that you are suffering from a PE missalignent flaw which was
in 0.9 Beta 7.

Please update to the recent LVM version available at www.sistina.com.
Follow the information in INSTALL and PATCHES/README to get your SuSE sys=
tem
updated. You need to have the kernel source package and the gcc packages
installed in order to be able to do this.

Regards,
Heinz    -- The LVM Guy --


On Tue, Oct 16, 2001 at 06:19:38PM +0200, Christoph Berger wrote:
> Hello,
> A few days ago my system crashes and i=92ve used LVM v 0.8 with one vol=
ume
> group(server), two physical volumes(hda6, hdb6) and one logical
> volume(dev/server/ftp)
> Now i=92ve installed Suse 7.2 with LVM v 0.9 Beta7, but i can=92t mount=
 the
> logical volume.
> The error message is:
> # mount /dev/server/ftp /mnt
> mount: wrong fs type, bad option, bad superblock on /dev/server/ftp,
>        or too many mounted file systems
> =20
> I get the following outputs from my system:
> =20
> # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "server"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volum=
e
> group
> =20
> # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/hda6" of VG "server" [37.78 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb5" of VG "server" [41.92 GB / 0 free]
> pvscan -- total: 2 [79.71 GB] / in use: 2 [79.71 GB] / in no VG: 0 [0]
> =20
> # pvdisplay /dev/hda6
> --- Physical volume ---
> PV Name               /dev/hda6
> VG Name               server
> PV Size               37.78 GB / NOT usable 3.75 MB [LVM: 267 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              9671
> Free PE               0
> Allocated PE          9671
> PV UUID               /dev/h-da6
> =20
> # pvdisplay /dev/hdb5
> --- Physical volume ---
> PV Name               /dev/hdb5
> VG Name               server
> PV Size               41.93 GB / NOT usable 3.45 MB [LVM: 271 KB]
> PV#                   2
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              10732
> Free PE               0
> Allocated PE          10732
> PV UUID               /dev/h-db5
> =20
> # vgchange -ay
> vgchange -- volume group "server" already active
> =20
> # lvchange -ay /dev/server/ftp
> lvchange -- logical volume "/dev/server/ftp" is already active
> lvchange -- availability of logical volume "/dev/server/ftp" doesn't
> have to be changed
> lvchange -- logical volume "/dev/server/ftp" didn't have to be changed
> =20
> =20
> I=92ve tried to follow the instructions of the mailing list article, i=92=
ve
> found at http://www.geocrawler.com/archives/3/3500/2001/4/0/5655568/
> But it doesn=92t work, After vgchange =96ay I get an error message, too=
,
> like
> =20
> vgcfgrestore -- ERROR: different structure size stored in
> "/etc/lvmconf/export.conf"
> than expected in file vg_cfgrestore.c [line=20
> > 120]
> > vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
> "export"
> =20
> I hope you can help me,
> Thanks=20
> Christoph=20

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
