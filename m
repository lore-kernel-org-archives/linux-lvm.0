From: Daniel Savard <dsavard@cids.ca>
In-Reply-To: <E16aR81-0002Ke-00@hermes.sistina.com>
References: <E16aR81-0002Ke-00@hermes.sistina.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1013532115.3181.13.camel@dirac.cids.ca>
MIME-Version: 1.0
Subject: [linux-lvm] Re: LVM Redhat 7.2 : Volume Group not activated on boot
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
Date: Tue Feb 12 10:42:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

le lun 11-02-2002 =E0 19:49, linux-lvm-request@sistina.com a =E9crit :
> My problem is on boot of the machine I get a  error from the mount=20
> process that it can not mount and check my file system
> "/dev/vg01/vg01lv01" and a option to go into singe user mode where I can=20
> se that the "vgchange -a y" is not run to activate
> the volume group. I have looked at the rc.sysinit and there is this=20
> entry that should activate all defined volume groups.
> Have any of you out in cyberspace seen the same problem with Redhat 7.2 ?
>=20
> cut from the /etc/rc.d/rc.sysinit :
>=20
> # LVM initialization
> if [ -e /proc/lvm -a -x /sbin/vgchange -a -f /etc/lvmtab ]; then
>         action $"Setting up Logical Volume Management:" /sbin/vgscan &&=20
> /sbin/vgchange -a y
> fi
>=20
> My setup :
>=20
> HP Omnibook 6000 laptop
> Redhat 7.2
> I have installed the "new" 2.4.17 Linux kernel
> VLM support works (That is I can create lv's and I use ext3 file system=20
> on them)
> I have added my lvm to fstab and are able to mount/umount the file=20
> system without problems
>=20
> cut from fstab :
>=20
> /dev/vg01/vg01lv01      /home5/pgram/dev        ext3    defaults        1=
 2
>=20
> --=20
>=20
> /regards
>=20
> Peter Gram
>=20
> Phone : +45 2527 7107
> Fax   : +45 4466 8856
>=20
> Miracle A/S
> Kratvej 2
> 2760 M=E5lev
> http://miracleas.dk
>=20


I added my own entry in the rc.sysinit file after the root filesystem is
made writable. So, here is my own entry (two lines below # DS ...:

# The root filesystem is now read-write, so we can now log via syslog()
directly..
if [ -n "$IN_INITLOG" ]; then
    IN_INITLOG=3D
fi

# DS Ok, now scan all volume groups for LVM and activate them
/sbin/vgscan
/sbin/vgchange -a y

if ! grep -iq nomodules /proc/cmdline >/dev/null 2>&1 && [ -f
/proc/ksyms ]; then
    USEMODULES=3Dy
else
    USEMODULES=3D
fi

It is near line 315 in my rc.sysinit file.

I also have the initrd image made with lvmcreate_initrd and the
appropriate entry in the lilo.conf file. I am using kernel 2.4.17 as
well.

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
