Return-Path: <corryk@us.ibm.com>
Subject: Re: [linux-lvm] Problem deleteing PV's
Message-ID: <OFD6F650E6.4F2A1D36-ON85256A56.004C77FE@raleigh.ibm.com>
From: "Kevin M Corry" <corryk@us.ibm.com>
Date: Thu, 24 May 2001 09:13:41 -0500
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: jbooth@ccbill.com

Justin,

Do you have any active volumes using any space on /dev/sdb or /dev/sdc?
(You said below that you are trying to get rid of those entries to start
over)? When you tried recreating the partition table for those disks,
did you create everything with the same size/location? If so, then the
LVM metadata will still be in the same place that pvscan and vgscan
expect to find it. So, if you don't have any data on those disks to
worry about, you should be able to just clear out the metadata sectors.

dd if=/dev/zero of=/dev/sdb1 bs=1k count=10
dd if=/dev/zero of=/dev/sdc1 bs=1k count=10
dd if=/dev/zero of=/dev/sdb bs=1k count=10
dd if=/dev/zero of=/dev/sdc bs=1k count=10

There are actually 240+ sectors of metadata at the beginning of each
PV, but these commands should wipe away the information about the PVs
and VGs. After this you should repartition the disks again, run
pvcreate on the appropriate partitions, and run pvscan and vgscan.

I hope I've understood your problem correctly. If you do in fact have
data on those disks, and vgscan/pvscan isn't finding the volumes, then
obviously don't run the above commands. :)

Kevin

> vgscan seems to only update /etc/lvmtab and /etc/lvmtagb.d
> a pvchange -x n /dev/sdxx
> results in a
> pvchange -- unable to find volume group "/dev/xxxx" (VG not active?)
> pvchange -- 0 physical volumes changed / 0 physical volumes already o.k.
>
> on all PV's
>
> > Have you tried a vgscan to see if there are VG's that you don't need?
What
> > about pvchange -x n /dev/sdxx?
> >
> >
> > > Hello,
> > >
> > >  I have a problem deleteing 4 PV's that I managed to create None of
the
> > > PV's are in a VG, and I can't figure out how to get rid of them
> > >
> > > when I do a pvscan It returns something like this:
> > >
> > > pvscan -- reading all physical volumes (this may take a while)
> > > pvscan -- inactive PV "/dev/sdb" is in no VG [12.16] MB
> > > pvscan -- inactive PV "/dev/sdb1" is in no VG [8.54] GB
> > > pvscan -- inactive PV "/dev/sdc" is in no VG [12.16] MB
> > > pvscan -- inactive PV "/dev/sdc1" is in no VG [8.54] GB
> > > pvscan -- total: 4 [17.11 GB] / in use 0 [0] / in no VG:  4 [17.11
GB]
> > >
> > >
> > > How do I get rid of these entries to start over again?
> > > I've tried deleteing the partition table and recreating them but a
> > > subsequent vgscan always brings them back into pvscan
> > >
> > >
> > >  Thanks much,
> > >       Justin Booth
