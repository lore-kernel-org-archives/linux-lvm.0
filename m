Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k87JPRA7025787
	for <linux-lvm@redhat.com>; Thu, 7 Sep 2006 15:25:27 -0400
Received: from fmmailgate07.web.de (fmmailgate07.web.de [217.72.192.248])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k87JOphw028400
	for <linux-lvm@redhat.com>; Thu, 7 Sep 2006 15:24:52 -0400
Date: Thu, 07 Sep 2006 21:24:45 +0200
Message-Id: <1231942361@web.de>
MIME-Version: 1.0
From: Thomas Scheller <thomas.scheller@email.de>
Subject: Re: [linux-lvm] Partitiontable destroyed with gentoo installer
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

if someone is interested in the solution of this issue, have a look at:
http://forums.gentoo.org/viewtopic-p-3562137.html#3562137

Best regards
     Thomas

> -----Urspr=EF=BF=BDngliche Nachricht-----
> Von: LVM general discussion and development <linux-lvm@redhat.com>
> Gesendet: 02.09.06 23:27:59
> An: linux-lvm@redhat.com
> Betreff: [linux-lvm] Partitiontable destroyed with gentoo installer


> Hi,
>=20
> I have a 250GB harddisk. I used the whole disk as a PV.
>=20
> # pvcreate /dev/hdb
>=20
> and did create a volume group
>=20
> vgcreate vg_250GB /dev/hdb
>=20
> and 2 logical volumes
>=20
> lv_old_system with 50GB
> and
> lv_storage with the rest of the disk
>=20
> then I did copy all the data from the old harddisk to lv_old_system.
>=20
> With the Gentoo live CD I did then install gentoo linux to the old harddr=
ive.
> The gentoo installer did delete the partitiontable on all connected hardd=
rives :-(
> So my logicalvolumes are not available anymore.
> But vgchange shows that lv_old_system is somehow still available. Can you=
 help me please, to recover that volume?
> As I did create the logical volume with the old SuSE 8 installation, whic=
h I did overwrite with the gentoo installation, I do not have the metadata =
backup in /etc :-(
>=20
> thinkpad ~ # vgchange -v -ay vg_250GB
>     Using volume group(s) on command line
>     Finding volume group "vg_250GB"
>   Logical volume (lv_old_system) contains an incomplete mapping table.
>     Wiping cache of LVM-capable devices
>   Logical volume (lv_old_system) contains an incomplete mapping table.
>   Volume group "vg_250GB" not found
> thinkpad ~ #=20
>=20
> Thank you in advance
>     Thomas
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
