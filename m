From: "Kai Iskratsch" <kai@stella.at>
Subject: AW: [linux-lvm] Broken Harddisk in LVM
Message-ID: <000601c2c48f$aa884560$0300a8c0@quaiky>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20030122121446.A25896@sistina.com>
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
Date: Sat Jan 25 11:02:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Now I have done this. The VG is working, the two LVs that are not on the
broken hard disk are also ok. The only problem is the third LV that
spanned to the broken hard disk. It has an ext3 FS and if I run e2fsck
on it the e2fsck tries to recover the journal which I think is not
working (it repeats the message: "/dev/Data/Daten: recovering journal")
I also tried to deactivate the journal, but tun2fs will not delete it
because it needs to be recovered.=20

Best regards

Kai
  =20

-----Urspr=FCngliche Nachricht-----
Von: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] Im
Auftrag von Heinz J . Mauelshagen
Gesendet: Mittwoch, 22. J=E4nner 2003 12:15
An: linux-lvm@sistina.com
Betreff: Re: [linux-lvm] Broken Harddisk in LVM


Install device-mapper + LVM2 tools _additionally_ in a seperate
location and run "vgscan ; vgchange -a y -P".

That might still leave you with unusable LVs in case their beginning
is gone with the failed disk.

If you decide to do that get back to us in case you've got installation
related questions.

Regards,
Heinz    -- The LVM Guy --

On Tue, Jan 21, 2003 at 11:29:08PM +0100, Kai Iskratsch wrote:
> One hard disk of my lvm System is completely broken, so that even the
> controller cannot find it.
> Is there a possibility to get the lvm running again without the data
of
> this disk.
>=20
> Kai Iskratsch=20
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
=3D-=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
=3D-=3D-=3D-

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
