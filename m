Message-ID: <4017FDB8.2030905@gene.concordia.ca>
From: Chris Beck <cbeck@gene.concordia.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mounting snapshot errors
References: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560F62@s99mail06>	 <1075274923.337.23.camel@ws.rdb.linux-help.org> <1075311258.29632.56.camel@david.internal.NorcrossGroup.com>
In-Reply-To: <1075311258.29632.56.camel@david.internal.NorcrossGroup.com>
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
Date: Wed Jan 28 13:23:07 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

Yah, I saw some stuff about this in the LVM-HOWTO:

http://tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html

| If the snapshot is of an XFS filesystem, the xfs_freeze command should=20
be used to quiesce the filesystem before creating the snapshot. (if the=20
filesystem is mounted) |

|# xfs_freeze -f /mnt/point; lvcreate -L592M -s -n dbbackup /dev/ops/data=
bases; xfs_freeze -u /mnt/point=20

If you are using XFS as the filesystem you will need to add the nouuid op=
tion to the mount command:

# mount /dev/ops/dbbackup /mnt/ops/dbbackup -onouuid,ro
              =20
Previously, the norecovery option was suggested to allow the mounting of =
XFS snapshots.
It has been recommended not to use this option, but to instead use xfs_fr=
eeze to quiesce the filesystem before creating the snapshot.

|

cheers,
chris


It is whispered that Greg Freemyer was heard, on or about 1/28/2004=20
12:34 PM to say:

>On Wed, 2004-01-28 at 02:28, R Dicaire wrote:
> =20
>
>>On Tue, 2004-01-27 at 21:53, Little, Chris wrote:
>>   =20
>>
>>>is the filesystem you are snapshotting still mounted when you execute =
the
>>>snapshot?  They need to be offline before the snapshot takes place.
>>>     =20
>>>
>>Yes, they are still mounted when I take a snapshot, I must have missed =
that
>>in the docs, that in itself poses a problem as I then cant umount the v=
olumes
>>without killing services. I'd understood the snapshotting process as be=
ing
>>able to snapshot a live filesystem, and then mount the snapshot to perf=
orm
>>backups from it instead of the live filesystem. Whats the purpose of th=
e
>>--size arg to lvcreate when taking a snapshot, I thought it was a buffe=
r
>>to hold data that'd normally be written to disk but cant when the
>>snapshot exists? I'm confused.
>>
>>   =20
>>
>I snapshot live mounted volumes every day.  (LVM 1.x, kernel 2.4.21)
>
>It works.
>
>I use xfs.
>
>For LVM snapshot to work with mounted filesystems you either have to
>have the vfs-lock patch applied or invoke a filesystem freeze from user
>space prior to creating the snapshot.
>
>With xfs, I use the xfs_freeze command from userspace.
>
>Then on the xfs mount, I have to use the "-o ro,nouuid" flag to mount
>the snapshot because the master volume and the  snapshot have the same
>uuid.
>
>Greg
> =20
>

--=20
Chris Beck / Y.A.B.A. / Fungal Genomics
CFSG / Concordia University
"La loi dans sa majestueuse =C3=A9galit=C3=A9, interdit =C3=A0 tous, aux =
riches comme
aux pauvres de dormir sous les ponts, de coucher dans la rue et de voler
du pain." -- Anatole France (Les Lys Rouge - 1894)
