From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Need help with PV recovery
Message-Id: <20011231004824.D12868@lynx.no>
References: <20011230234056.GB1965@alcor.net>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20011230234056.GB1965@alcor.net>; from mdz@debian.org on Sun,
    Dec 30, 2001 at 06:40:56PM -0500
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
Date: Mon Dec 31 01:47:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: Matt Zimmerman <mdz@debian.org>
Cc: linux-lvm@sistina.com

On Dec 30, 2001  18:40 -0500, Matt Zimmerman wrote:
> During a different recovery operation, the first sector of one of my PVs =
was
> partially corrupted (it had bootsector data written to it).  Some of the
> metadata is still intact; in particular, the total/free/allocated statist=
ics
> look reasonable, part of the PV UUID is still there, the volume group
> configuration is still there, and all of the LE->PE mappings seem to be O=
K.
>=20
> It seems like this situation should be recoverable, but so far I have been
> unsuccessful.  After backing up the beginning of the partition, I tried
> patching it up by hand with little success, then I tried pvcreate -ff and
> vgcfgrestore.  While pvdisplay seems to show the right data after that,
> vgscan still doesn't recognize the volume.
>=20
> Attached is the result of "pvdata -a" on the (unmodified) partition.

> --- Physical volume ---
> PV Name               /dev/scsi/host1/bus0/target0/lun0/part1
> VG Name               D=02=01
> PV Size               8.43 GB / NOT usable 4.48 MB [LVM: 132.00 KB]
> PV#                   0
> PV Status             NOT available
> Allocatable           yes
> Cur LV                7
> PE Size (KByte)       4096
> Total PE              2158
> Free PE               681
> Allocated PE          1477
> PV UUID               EffefH-Zmr5-gMrs-rUEM-=03=02=85

So, what you need to do (approximately) is (bPV =3D broken PV):

# restore the LVM magic at the start of the PV (probably OK, but why not)
dd if=3D/dev/<some other PV> bs=3D1 count=3D4 of=3D<bPV>
# restore the UUID (obviously broken)
echo -e "EffefHZmr5gMrsrUEM6CkDRRZC1ragTp\0" | dd bs=3D1 seek=3D44 count=3D=
33 of=3D<bPV>
# restore the VG name (looks to be missing)
echo -e "<vgname>\0" | dd bs=3D1 seek=3D172 count=3D<length of vgname + 1>

According to the UUID list, this _should_ be PV #2, is that correct?
Hard to see if the "system id" is OK, but I'm not sure if it is important.
What about the output of "pvdata -PP <bPV>"?  I _assume_ that the PV
location data is OK, or you wouldn't be getting anything from the
PE and LV lists, but it is hard to tell for sure.

What would be also useful is the first 40 lines of "od -Ax -tx4 <bPV>".

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
