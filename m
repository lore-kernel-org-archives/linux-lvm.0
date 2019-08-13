References: <843935217a8de82c4cf47f02953489c6@cs.uni-dortmund.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <7f6f03e1-dbb1-971c-7f1f-f6c380a16b77@redhat.com>
Date: Tue, 13 Aug 2019 15:54:12 +0200
MIME-Version: 1.0
In-Reply-To: <843935217a8de82c4cf47f02953489c6@cs.uni-dortmund.de>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] dmsetup says "Device does not exist",
	though it exists
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>

Dne 13. 08. 19 v 9:11 Christoph Pleger napsal(a):
> Hello,
>=20
> I have a volume group with 20 logical volumes. Only the last one of these=
=20
> volumes has a strange problem with dmsetup, shown by these commands and o=
utput=20
> on the command line:
>=20
> root@host:/home/linux# /sbin/dmsetup info -c -o name --noheadings /dev/vg=
/lv20
> Device does not exist.
> Command failed
>=20
> root@host:/home/linux# lvdisplay -c /dev/vg/lv20
>  =EF=BF=BD /dev/vg/lv20:vg:3:1:-1:0:4194304:512:-1:0:-1:253:19
>=20
> root@host:/home/linux# mount /dev/vg/lv20 /mnt
> root@host:/home/linux# ls /mnt
> lost+found data1 data2
>=20
> That is, dmsetup says "Device does not exist" about a logical volume, tho=
ugh=20
> the volume exists and is operating normally. What is the possible problem=
 here?
>

Hi

Have you tried  strace ?

Are you using this only in singly machine with properly running udev ?
Kernel version, lvm version,  distribution... ?


Zdenek
