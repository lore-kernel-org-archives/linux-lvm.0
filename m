From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Help recovering my volume groups
Message-Id: <20020206090803.A5727@sistina.com>
References: <20020206030901.A64005@pvv.ntnu.no>
MIME-Version: 1.0
In-Reply-To: <20020206030901.A64005@pvv.ntnu.no>; from
    alfborge@pvv.ntnu.no on Wed, Feb 06, 2002 at 03:09:02AM +0100
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
Date: Wed Feb  6 02:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Alf,

if I get you right, you didn't have hdc in your VG which should have brou=
ght
your LVM system up after hdc replacement right away unless you don't run
vgscan in your system startup script.
If you run vgcfgrestore as you did mention below, you might end up with
different LVM metadata on the disks and in /etc/lvmtab* (which are cache =
files).
The recommended procedure with vgcfgrestore therefore is:

vgcfgrestore...
vgscan
vgchange -ay

Regards,
Heinz    -- The LVM Guy --

On Wed, Feb 06, 2002 at 03:09:02AM +0100, Alf B Lerv=E5g wrote:
> Hi, I just had a stroke of panic since my lvm vg didn't come back up
> after I shut down my computer and removed a faulty disc.
>=20
> I searched the web, and found a thread on your mailinglist that matched
> my situation pretty well. Following the instructions in that thread, I
> managed to get my system back up and running.
>=20
> Here's a link to the thread I was talking about.
>=20
> http://lists.sistina.com/pipermail/linux-lvm/2001-January/005948.html
>=20
> I run linux 2.4.17 on an athlon 1.2G with 1G RAM.
>=20
> I initially had 3 ide hd's, but one of them was behaving strangly, so I
> decided to get a new one on warranty. After taking backups of the data
> on that disc, I unmounted it, halted the system and removed it. Then I
> turned the system back up. I realize now that I might have saved abit o=
f
> work if I ran some commands before I halted the system, but I don't kno=
w
> what commands those whould have been.
>=20
> I use one vg called idehd
>=20
> I had 3 pv's, /dev/hda2, /dev/hdb1 and /dev/hdc
> I removed /dev/hdc
>=20
> When the system came back up, I ran vgscan, which reported that it
> didn't find any vg's. While the system was in this state, I ran
> dd if=3D/dev/hda2 of=3Dhda2_pvdump.txt bs=3D1024 count=3D4
> dd if=3D/dev/hdb1 of=3Dhdb1_pvdump.txt bs=3D1024 count=3D4
> pvdisplay -vvd /dev/hdb1 >& hdb1_pvdisplay.txt
> pvdisplay -vvd /dev/hda2 >& hda2_pvdisplay.txt
> If you are interested in these files, I'll be happy to provide them.
>=20
> I don't really know if this info is of any use to anyone, but I hope it
> might be. Other than this slight hickup I've had no problems with the
> lvm system. It makes life alot easier when it comes to hdpartitions and
> stuff like that.
>=20
> To get things up and running again, I ran
> vgcfgrestore -n idehd /dev/hda2
> vgcfgrestore -n idehd /dev/hdb1
> vgchange -ay
>=20
> --=20
> Alf
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
