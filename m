Subject: Re: [linux-lvm] Understand the snapshot process
From: David Johnston <david@littlebald.com>
In-Reply-To: <3FF277FF.1D5400B4@groupe-ips.com>
References: <3FF277FF.1D5400B4@groupe-ips.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1072905045.15299.38.camel@grandmother.littlebald.com>
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
Date: Wed Dec 31 15:11:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, 2003-12-31 at 02:17, Jean Marie Ari=E8s wrote:
> Hi,
>=20
> I'm using LVM under SuSE Linux 8.0, and I don't understand all the
> snapshot process.
>=20
> Our config is :
> 2 disks 73 Go RAID 1
> --> 1 VG "OVG" (60 GB)
> --> 1 LV /dev/OVG/data (40 GB) mounted on /share/data
>=20
> To create a snapshot with ReiserFS, we do this:
> Tux :# lvcreate -L30G -s -n snap_admin /dev/OVG/data
>     and so, we mount the snapshot :
> Tux :# mount /dev/OVG/snap_admin /share/snapshot
>=20
> At this point, the /share/snapshot contain a copy of the /share/data
> directory.
>=20
> The How To say "Do the backup" for exemple with tar.
>=20
> My question is : Why we must to copy the data with a system command on
> the snapshot ? Is a "create snapshot/remove snapshot" not possible ?

Jean Marie,
The snapshot is useful for narrowing a backup window, but is not useful
as a backup.

In other words, a backup can take hours while a snapshot takes seconds.=20
This is possible because the snapshot creation process does not copy
your data; it simply sets up a process that will track any future
changes.=20

Once you've created a snapshot, you can go back to work (restart your
database, for example).  The data in the original LV (/dev/OVG/data)
will change, but the data in /share/snapshot won't.  Once you've copied
/share/snapshot/ somewhere safe, you remove the snapshot with lvremove.=20
The How-To suggests tar, but other commands are possible.

Why not leave the snapshot in place all the time?  Well, there are three
reasons.

1) As long as the snapshot exists, writes to /dev/OVG/data will be
slower than usual because they have to be done twice (once to record the
new data in /dev/OVG/data, once to record the changes in
/dev/OVG/snap_admin).

2)If you leave a snapshot in place long enough, it will run out of space
to store the changes; once this happens, your snapshot is useless.  In
the example you gave, you can make roughly 30GB worth of changes before
the snapshot fills up.  You can extend the snapshot to the size of the
original lv (40GB) but not beyond.

3) If the disk drive fails, both the original LV and the snapshot will
be lost.

I hope my explanation is clear and correct.  If not, somebody please let
me know ;-)
--=20
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC
