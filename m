From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] Partitions on same Drive
In-Reply-To: <1011645757.7846.12.camel@desktop.athome.dyndns.org>
Message-Id: <Pine.LNX.4.10.10201220015160.20722-100000@pzat.meep.org>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Date: Mon Jan 21 18:25:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>


On 21 Jan 2002, Rene Schumann wrote:

> I have a Problem and hope someone here can help me.
> I have 2 Partitions on a drive.
>=20
> [root@desktop root]# fdisk -l /dev/sdb
>=20
> Festplatte /dev/sdb: 255 K=F6pfe, 63 Sektoren, 9730 Zylinder
> Einheiten: Zylinder mit 16065 * 512 Bytes
>=20
>     Ger=E4t Booten  Anfang      Ende   Bl=F6cke   ID  Dateisystemtyp
> /dev/sdb1             1      4462  35840983+   c  Win95 FAT32 (LBA)
> /dev/sdb2          4463      9730  42315210   8e  Linux LVM
>=20
> I want to delete sdb1 vfat partition and use it as LVM space.
> If i do a "pvcreate vg01 /dev/sdb1" it is ugly for performance because
> there are 2 LVM Partions at one drive.
> right?
> If i do lvm partition on sdb1 and do a pvmove,
> Can i resize sdb1 to fit the whole drive and after that lvm use this
> full space?=20
>=20

I don't think you can resize a PV, however that does not really matter,
just slap another PV in place of it. When you do a lvcreate you can
specify which PV the logical volume is going to take its space from.

lvcreate -n fred_lv -L 1G jim_vg /dev/sdb1

If you wanted to do a strip you can still do it by doing

lvcreate -i 2 -n jim_lv -L 1G shela_vg /dev/sdb1 /dev/sdc1

The only time you would have any difficulties is if you wanted one of the
strips to take from sdb1 and sdb2, if your using concatinated filesystems
it really does not matter that the data is logically in two PVs if you
care about seek orders just specify /dev/sdb1  /dev/sdb2 when allocating.

James
