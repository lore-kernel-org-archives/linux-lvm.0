Date: Tue, 4 Jul 2000 19:01:01 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM for backup
Message-ID: <20000704190101.B14571@hmsysv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <20000704150122.D11977@gyllenborst.tlth.lth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20000704150122.D11977@gyllenborst.tlth.lth.se>; from jpn@tlth.lth.se on Tue, Jul 04, 2000 at 03:01:22PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?J=F6rgen_Persson?= <jpn@tlth.lth.se>
Cc: mauelshagen@sistina.com, linux-lvm@msede.com

On Tue, Jul 04, 2000 at 03:01:22PM +0200, J=EF=BF=BDrgen Persson wrote:
> LVM-list,
> I got an interesting problem today... Is it possible to use LVM to
> make a backup while the file server is in use??

Yes.
With the last version 0.8final you can create read only snapshots of Logical
Volumes and mount them to do a backup.

>=20
> Do I have to use LVM in conjunction with some external=20
> functionality, eg. ReiserFS??
>=20

There is no specific filesystem functionality related to the matter so far.
Filesystems as one kind of user of the block device layer, where LVM lives,
are not aware of the snapshot support of LVM.

> Will VFS bug me??

In case of journaled filesystems porbably.
The problem is that the journal of the filesystem can't be flushed on the
snapshot logical volume, because the implementation supports read only snap=
shots
today.

In case of ext2 this problem doesn't exist.

Another thing is that there is no interface between the VFS layer and the L=
VM
to support snapshot activation after the filesystem cleaned up metadata,
activated the snapshot and continued to do i/o afterwards so far.

>=20
> I'm a LVM-newbie, can someone please give me a direction for me
> to head out for some documentation??
>=20

Please have a look at http://ds9a.nl/lvm-howto

Regards,
Heinz      -- The LVM guy --

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
