Message-ID: <3FF51A81.DC58AC89@groupe-ips.com>
From: Jean Marie =?iso-8859-1?Q?Ari=E8s?= <jeanmarie.aries@groupe-ips.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Understand the snapshot process
References: <3FF277FF.1D5400B4@groupe-ips.com> <1072905045.15299.38.camel@grandmother.littlebald.com>
Content-Transfer-Encoding: 8bit
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
Date: Fri Jan  2 01:17:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Great !

Your explanation is perfect :o)

So, I understand better the use of a snapshot.

The /data contains files sharing with Samba. So, I think I can do one
snapshot per day at midnight, and remove it immediatly. If I have to restore
data for the snapshot, its's alway possible to mount the /dev/OVG/snap_admin
?

Thanks in advance and happy new year !

David Johnston a �crit :

> On Wed, 2003-12-31 at 02:17, Jean Marie Ari�s wrote:
> > Hi,
> >
> > I'm using LVM under SuSE Linux 8.0, and I don't understand all the
> > snapshot process.
> >
> > Our config is :
> > 2 disks 73 Go RAID 1
> > --> 1 VG "OVG" (60 GB)
> > --> 1 LV /dev/OVG/data (40 GB) mounted on /share/data
> >
> > To create a snapshot with ReiserFS, we do this:
> > Tux :# lvcreate -L30G -s -n snap_admin /dev/OVG/data
> >     and so, we mount the snapshot :
> > Tux :# mount /dev/OVG/snap_admin /share/snapshot
> >
> > At this point, the /share/snapshot contain a copy of the /share/data
> > directory.
> >
> > The How To say "Do the backup" for exemple with tar.
> >
> > My question is : Why we must to copy the data with a system command on
> > the snapshot ? Is a "create snapshot/remove snapshot" not possible ?
>
> Jean Marie,
> The snapshot is useful for narrowing a backup window, but is not useful
> as a backup.
>
> In other words, a backup can take hours while a snapshot takes seconds.
> This is possible because the snapshot creation process does not copy
> your data; it simply sets up a process that will track any future
> changes.
>
> Once you've created a snapshot, you can go back to work (restart your
> database, for example).  The data in the original LV (/dev/OVG/data)
> will change, but the data in /share/snapshot won't.  Once you've copied
> /share/snapshot/ somewhere safe, you remove the snapshot with lvremove.
> The How-To suggests tar, but other commands are possible.
>
> Why not leave the snapshot in place all the time?  Well, there are three
> reasons.
>
> 1) As long as the snapshot exists, writes to /dev/OVG/data will be
> slower than usual because they have to be done twice (once to record the
> new data in /dev/OVG/data, once to record the changes in
> /dev/OVG/snap_admin).
>
> 2)If you leave a snapshot in place long enough, it will run out of space
> to store the changes; once this happens, your snapshot is useless.  In
> the example you gave, you can make roughly 30GB worth of changes before
> the snapshot fills up.  You can extend the snapshot to the size of the
> original lv (40GB) but not beyond.
>
> 3) If the disk drive fails, both the original LV and the snapshot will
> be lost.
>
> I hope my explanation is clear and correct.  If not, somebody please let
> me know ;-)
> --
> David Johnston <david@littlebald.com>
> Little Bald Consulting, LLC
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--
Sinc�rement,

Jean Marie Ari�s
Imprimeries IPS
Responsable Syst�mes/R�seaux
