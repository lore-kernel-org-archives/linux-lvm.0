Message-ID: <3DAD6B1C.2050903@mindmatics.de>
From: Andreas Baier <andreas.baier@mindmatics.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm on linux RAID5?
References: <1034773372.1658.8.camel@frodo.xelin.se>
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
Date: Wed Oct 16 09:14:11 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Hi,

here=B4s the quick way

1. define your raid-partitions with fdisk by asgning them 0xfd
2. setup your /etc/raidtab
3. issuning raidstart -c /etc/raidtab should start  your md-device
4. asume you just use one md device you would now have md0 as
    your raid-device
5. Now you can pvcreate /dev/md0
6. than vgcreate whatevervgname /dev/md0
7. lvcreate what you like on that vg


for creating the raid5 have a look at that sample:


# Sample raid-5 configuration
raiddev                 /dev/md0
raid-level              5
nr-raid-disks           3
chunk-size              32

# Parity placement algorithm

#parity-algorithm       left-asymmetric
parity-algorithm        left-symmetric
#parity-algorithm       right-asymmetric
#parity-algorithm       right-symmetric

# Spare disks for hot reconstruction (not supported yet)
#nr-spare-disks         0

device                  /dev/hda1
raid-disk               0

device                  /dev/hdb1
raid-disk               1

device                  /dev/hdc1
raid-disk               2


Best regards


Anders Henriksson wrote:

> Hej,
>=20
> I have tried scanning the list archive and re-read the documentation bu=
t
> still....
>=20
> I want to run lvm over four linux raid5 devices, can I just treat the
> raid devices as discs? i.e. run pvcreate on them directly and go on fro=
m
> there.
>=20
> I am running a linux 7.3 server almost out of the box.
>=20
> /Anders
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
>=20
>=20
>=20


--=20
Andreas Baier
