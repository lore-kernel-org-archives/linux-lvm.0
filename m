Return-Path: <erik@bagfors.nu>
Subject: Re: [linux-lvm] Installed the lvm on the Red Hat 7.1 then what to do
From: Erik =?ISO-8859-1?Q?B=E5gfors?= <erik@bagfors.nu>
Date: 01 Jul 2001 21:25:38 +0200
Message-Id: <994015538.6465.5.camel@detrius>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-lvm@sistina.com

On 28 Jun 2001 18:39:43 +0530, RAGHVENDRA SHUKLA wrote:
>=20
> Hello,=20
>        Thanks austin for the tech. help you have provided ,
>        But still i am not clear about the difference between
>        the already created partitions ( which are created during the
>        Installation of linux ) and those created by the lvm ,=20
>        also can i increase only those partitions which are created=20
>        by the Lvm ?? Please Reply and help .
>=20
with normal partitioning you have
* disks
* partitions (on those disks)
* filesystems (on those partitions)

example

    hda            (disk)
     |
     /\
 hda1  hda2        (partitions)
  |      |
 ext2  reiserfs    (filesystems)


with (linux-)lvm you have=20

* physical disks (PV) (on a partition or on a whole disk)
* volume groups (VG) (consists of one of more PV:s, think of them as virtua=
l disks)
* Logival volumes (LV) (on those VG:s.  think of them as virtual partitions)

So..

    hda1   hdc1      (PV:s on partitions or whole disks)
       \   /
        \ /
       diskvg        (VG)
       /  |  \
      /   |   \
  usrlv rootlv varlv (resizeable LV:s, think of them as resizeable virtual =
partitions)
    |      |     |
 ext2  reiserfs  xfs (filesystems)

So you need to=20
1) create a pv
2) create a vg on that pv
3) create lv:s on that vg
4) create a filesystem on those lv:s
5) mount the lv:s


Hope that helps

/Erik
--=20
Erik B=EF=BF=BDgfors               | http://erik.bagfors.nu/   =20
erik@bagfors.nu            | Erik.Bagfors@ardendo.se
Supporter of free software | GSM +46 733 279 273
fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
