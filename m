Date: Wed, 12 Apr 2000 21:14:53 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: [linux-lvm] Re: converting a filesystem to a logic volume
Message-ID: <20000412211453.C21004@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@msede.com


Is it needed to move the filesystem in question to do this?

Whould not the following work:
* Create the VG that should contain the filesystem
  This must be created on some other device. If the disk in question is
  full, it's possible to
   * shrink the filesystem
   * shrink the partition
   * create a new partition after the one with the filesystem
  and use the new partition for the VG.
* Add the device with the filesystem as a new PV in the existing VG.
  The LV can cover the PV completely, and the filesystem does not have
  to be shrinked or moved

This will only work assuming that LVM does not have to store any
metadata on every PV. Does it?

Moving filesystems should be avoided if possible.


--=20
Ragnar Kj=EF=BF=BDrstad
