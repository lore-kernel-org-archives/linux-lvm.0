Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] SoftRaid and LVM
Date: Tue, 4 Sep 2001 16:35:40 +0200
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF0178FD6F@mailsrv.linkvest.com>
From: "Jean-Eric Cuendet" <Jean-Eric.Cuendet@linkvest.com>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
It seems that you use a fresh 2.4.9 kernel. In kernel 2.4.9, the version
of LVM is 0.9.0-beta2, which is what you get with dmesg or cat /proc/lvm
Then you installed tools from 1.0.1rc2. You must upgrade your kernel
with LVM 1.0.1rc2 if you want all that to be consistent (or use beta2
tools, which is not the good way IMHO).

Recompile 2.4.9 with LVM-1.0.1rc2 and you'll be OK.
Bye
-jec

> -----Original Message-----
> From: Thorsten Sauter [mailto:sar@viastore.de]=20
> Sent: mardi, 4. septembre 2001 16:22
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] SoftRaid and LVM
>=20
>=20
>=20
> Hi,
>=20
> sorry for these short description :-)!
>=20
> Currently I'm using kernel 2.4.9 with the raidtools-0.90.
> The md0 device is a simple RAID1-Mirroring between hda1 and hda2.
>=20
> If I create a simple vg over these two disks and one disk=20
> goes bad, all of my datas are lost, isn't it? So I think it=20
> would be a nice idee to create a simple, minimum safety,=20
> mirror array and active the lvm over this array. From now on,=20
> I have the flexibilty from the lvm and the safety from the raid!?
>=20
> I've found some patches for older lvm version in the internet (google,
> ...) and a patch on this list from october last year. But all=20
> these patches (?) are for very old lvm versions (0.8x) so I=20
> tink they don't work on newer lvm-versions.
>=20
> The problem, as described below, is that I can't create a=20
> volume group on a md-device.
>=20
> Are these infos enought? I hope so.
>=20
> Between my to mails I've created a new "blank" md-device (no=20
> old datas, no old fdisk probs). But the problem is the same.=20
> The lvm-howto and the raid-howtos doens't provide any=20
> informations for interacting raid with lvm. :-(
>=20
> Thanks for your help!
>=20
> Thorsten Sauter
> viastore systems GmbH
>=20
>=20
> --
> Your mouse has moved.
> Windows NT must be restarted for the change to take effect.=20
> Reboot now?  [OK]
>=20
> On Tue, 4 Sep 2001, svetljo wrote:
>=20
> > Hi
> > where did you find this patches
> > and what do you wont to do
> >
> > what kind of software RAID do you wont to use
> > can you give us a bit more information
> >
> >
> >
> >
> >
> >
> > Thorsten Sauter wrote:
> >
> > >Hello LVM-Gurus,
> > >
> > >I would like to create a volume group based on an sofraid device=20
> > >(/dev/md0). I know, there are many emails about this topic, but I=20
> > >think no one has the solution for this. I have found some=20
> > >code-patches for older versions of the lvm for fix this=20
> problem. But,=20
> > >what is the current state in the new lvm-1.0.1-rc2 version.
> > >
> > >The following things I have made before:
> > >$ mkraid --realy-force /dev/md0
> > >$ mkreiserfs /dev/md0
> > >$ mount /dev/md0 /mnt
> > >-> so I think, the raid device is ok
> > >
> > >$ pvcreate /dev/md0
> > >
> > >>pvcreate -- device "/dev/md0" has a partition table
> > >>
> > >
> > >$ fdisk -l /dev/md0
> > >
> > >>Disk /dev/md0: 2 heads, 4 sectors, 2441880 cylinders
> > >>Units =3D cylinders of 8 * 512 bytes
> > >>
> > >>    Device Boot    Start       End    Blocks   Id  System
> > >>
> > >$ uname -a
> > >
> > >>Linux lxclust1 2.4.9 #6 Mon Jan 3 19:52:54 CET 2000 i686 unknown
> > >>
> > >$ dmesg | grep -i lvm
> > >
> > >>LVM version 0.9.1_beta2  by Heinz Mauelshagen =20
> (18/01/2001) lvm --=20
> > >>Driver successfully initialized
> > >>
> > >
> > >LVM-Version: 1.0.1-rc2      -> why is this an other=20
> version as reported
> > >by kernel?
> > >
> > >Does anyone know, how can I initialize the /dev/md0 device=20
> for te the=20
> > >lvm?
> > >
> > >Thanks for your help,
> > >
> > >Thorsten Sauter
> > >viastore systems GmbH
> > >
> > >
> > >--
> > >Your mouse has moved.
> > >Windows NT must be restarted for the change to take effect. Reboot=20
> > >now?  [OK]
> > >
> > >
> > >_______________________________________________
> > >linux-lvm mailing list
> > >linux-lvm@sistina.com=20
> > >http://lists.sistina.com/mailman/listinfo/linux-lvm
> > >read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > >
> >
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com=20
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com=20
> http://lists.sistina.com/mailman/listinfo/linu> x-lvm
> read the=20
> LVM HOW-TO at=20
> http://www.sistina.com/lvm/Pages/howto.html
>=20
