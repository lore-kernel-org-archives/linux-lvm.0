Subject: Re: [linux-lvm] Re: LVM 1.03 root file system on Redhat 7.3
From: Daniel Savard <dsavard@cids.ca>
In-Reply-To: <E17DTyw-0008Hp-00@hermes.sistina.com>
References: <E17DTyw-0008Hp-00@hermes.sistina.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1022805422.19446.41.camel@dirac.cids.ca>
Mime-Version: 1.0
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
Date: Thu May 30 19:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

le jeu 30-05-2002 =E0 13:44, James B. Byrne a =E9crit :


>=20
> The kmod error is reputedly caused by the ramdisk image file=20
> (created by lvmcreate_initrd) not containing a /sbin/modprobe=20
> command.  How can I verify if this is so?  I note that redhat has=20
> /sbin/modprobe as a logical link to insmod.  Could this be confusing=20
> lvmcreate_initrd?

The symlink won't cause lvmcreate_initrd to create a ramdisk image with
the missing executable.

To check, just copy your initrd image somewhere, say /tmp, uncompress it
(gunzip) there and mount it on a mount point as a loop device:

Given an initrd uncompressed file name: my_image
Given a mount point named: /tmp/my_mount_point

Just type: mount -o loop /tmp/my_image /tmp/my_mount_point

After that, you can cd to /tmp/my_mount_point and look at the files and
executables there.

Regards,
>=20
> Regards,
> Jim
>=20
> ---     e-mail is NOT a secure channel=20
> James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
> Harte & Lyne Limited          http://www.harte-lyne.ca
> 9 Brockley Drive              vox: +1 905 561 1241
> Hamilton, Ontario             fax: +1 905 561 0757
> Canada  L8E 3C3
>=20

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Daniel Savard
Consultation Informatique Daniel Savard
551, boul. Sir-Wilfrid-Laurier
suite 105
Beloeil, (Qu=E9bec)
Canada J3G 4J1

T=E9l: (450) 467-8014
Internet: dsavard@cids.ca
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
