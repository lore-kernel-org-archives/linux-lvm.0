Subject: Re: [linux-lvm] Setup for RAID1 with LVM
References: <5E34D857F6BB704CA3369B7553233A81651A7E@ntsviemxs0152.connect.at-work.ent>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: "Csuk, Ferenc"'s message of "Thu, 15 Nov 2001 16:57:44 +0100"
Message-ID: <ufay9l8hv5v.fsf@epithumia.math.uh.edu>
MIME-Version: 1.0
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
Date: Thu Nov 15 10:09:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

>>>>> "FC" =3D=3D Ferenc Csuk <Csuk> writes:

FC> [...]  when we start pvcreate /dev/md0 we get the following error:
FC> invalid partition type 0x83 for /dev/md0" (must be
FC> 0x8e). Unfortunatelly we can=B4t change it using fdisk.

The manual page for pvcreate says:

For whole disk devices only the partition table must be erased, which
will effectively destroy all data on that disk.  This can be done by
zeroing the first sector with:
=20
       dd if=3D/dev/zero of=3DPhysicalVolume bs=3D512 count=3D1

 - J<
