Return-Path: <root@srv.sistina.com>
Date: Thu, 8 Feb 2001 20:51:50 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Setup for RAID1 with LVM
Message-ID: <20010208205150.A8914@srv.sistina.com>
References: <B45465FD9C23D21193E90000F8D0F3DF683923@mailsrv.linkvest.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF683923@mailsrv.linkvest.ch>; from Jean-Eric.Cuendet@linkvest.com on Thu, Feb 08, 2001 at 02:56:48PM +0100
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Thu, Feb 08, 2001 at 02:56:48PM +0100, Jean-Eric Cuendet wrote:
>=20
> Hi,
> To do that:
> - create a md0 RAID1 device with your 2 disks (mirror, no use of LVM)
>   - set the parttion ID to RAID autodetect (0xfd)
>   - edit /etc/raidtab (see RAID Howto)
>   - mkraid /dev/md0
> - install LVM utilities (0.9.1beta3)
> - pvcreate /dev/md0
> - vgcreate -n BGNAME /dev/md0
> - lvcreate <some logical volume>
>=20
> > -----Original Message-----
> > From: Jens Bruckmann [mailto:jens.bruckmann@suse.de]
> > Sent: jeudi, 8. f=EF=BF=BDvrier 2001 12:12
> > To: linux-lvm@sistina.com
> > Subject: [linux-lvm] Setup for RAID1 with LVM
> >=20
> >=20
> > Dear LVM-Specialists,
> >=20
> > I would like to setup a configuration with LVM and RAID1. Poorly you
> > can't just do a lvextend -m 1 like on HP-UX :-))

Do you like to volunteer for the -m implementation ;-)

> >=20
> > I could not find any hints so far for a step by step description, the
> > part has to be included in the LVM-Howto.
> >=20
> > I have two SCSI-Disks of nearly the same size, on Disk 1 I=20
> > already have
> > a working installation of Linux.
> >=20
> > /usr, /opt and /var reside on LVs. I want these three LVs to=20
> > be mirrored
> > online to the second disk as it is possible on HP-UX.
> >=20
> > Can someone shortly describe, how to setup such a configuration?
> >=20
> >=20
> > Thanks for help,
> >=20
> > 	Jens
> >=20
> > --=20
> > --------------------------------------------------------------
> > ---------
> > Jens Bruckmann              .-.       Mail:    jens.bruckmann@suse.de
> > SuSE Linux Solutions AG     /v\       Phone:   +49 - 40 - 89 69 82 18
> > Friesenweg 5F              // \\      Fax:     +49 - 40 - 85 40 04 35
> > D-22763 Hamburg           /(   )\
> >                            ^^-^^     =20
> > --------------------------------------------------------------
> > ---------
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--=20

Regards,
Heinz    -- The LVM Guy --

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
