From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] PV and disk recovery
Message-ID: <20030527125416.B8430@sistina.com>
References: <1053855014.15745.10.camel@crux>
Mime-Version: 1.0
In-Reply-To: <1053855014.15745.10.camel@crux>; from b.medin@telia.com on Sun, May 25, 2003 at 11:30:15AM +0200
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
Date: Tue May 27 06:04:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Bj=F6rn,

there's 3 options you've got (loosing all data on the gone PV in any):

o the official LVM1 way (presuming you've got metadata archives in
  /etc/lvmconf/ still) is to get a replacement drive (of the same size) a=
nd
  vgcfgrestore the LVM metadata to it after running pvcreate.
  "vgscan;vgchange -ay" activates your VG again.
  You have the option to overwrite the PV size with "pvcreate -s ..." in
  recent LVM1 versions.

o use LVM2; support to activate partially available VGs has been added to=
 it
  (vgchange -P -ay Volume00"). Install device-mapper and LVM2 from
  www.sistina.com if you want to follow this path.

o the hacky LVM1 one, if you still have your VG backup in /etc/lvmconf
  (no need for a replacement drive but taking io errors accessing the
  missing PV)
  - mkdir /etc/lvmtab.d
  - cp /etc/lvmconf/Volume00.conf /etc/lvmtab.d
  - echo -ne "Volume00\0" > /etc/lvmtab
  - vgchange -ay Volume00

Once you've got access to your VG back with either of those options,
you can check the mapping of the LVs with
"lvdisplay -v /dev/Volume00/YourLVName" to find out, which parts
(logical extents) of the logical volumes address space are still accessab=
le
(and which ones are not, because they were on the dead drive).

FYI: you ask for trouble using filesystems in case of partially
     accessable LVs because typically inmportant areas of the metadata
     and data will be inaccessable.

Regards,
Heinz    -- The LVM Guy --

On Sun, May 25, 2003 at 11:30:15AM +0200, Bj=F6rn Medin wrote:
> Hello,
>=20
> I had a VG with two full disks in two PV:s (/dev/hda1 and /dev/hdb1).
> The second drive, a new IBM 120GB disk fried after some weeks and
> was totally inacessable (not even recognised by BIOS).
>=20
> To my understanding the first PV on /dev/hda1 is OK
>=20
> Can I recover and get back access to my old data that was on
> /dev/hda1? I have tried various things suggested in HOWTO:s and
> this list.
>=20
> If I do vgscan I get:
>=20
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data o=
f
> volume group "Volume00" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volum=
e
> group
>=20
> Any command like vgchange -a y only gets: vgchange -- no volume groups
> found
>=20
> I have tried create a new VG: vgcreate extra /dev/hda1
>=20
> but I then get:
> vgcreate -- "/dev/hda1" is not a new physical volume
> vgcreate -- physical volume "/dev/hda1" already belongs to volume group
> "Volume00"
>=20
> -----------
>=20
> Seems like I dont have any config data for Volume00 left but still I am
> not allowed to use/change Volume00 or the PV.
>=20
> What can I do? Is there any way to reclaim possible intact data on my
> old /dev/hda1????
>=20
> Thanks!
>=20
> /Bj=F6rn
>=20
>=20
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
