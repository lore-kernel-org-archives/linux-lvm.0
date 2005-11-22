Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAMEF3V29935
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2005 09:15:03 -0500
Received: from lennier.cc.vt.edu (lennier.cc.vt.edu [198.82.162.213])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAMEEvq0016415
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2005 09:14:57 -0500
Received: from steiner.cc.vt.edu (IDENT:mirapoint@evil-steiner.cc.vt.edu
	[10.1.1.14])
	by lennier.cc.vt.edu (8.12.11/8.12.11) with ESMTP id jAMEEoXL001777
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2005 09:14:50 -0500
Subject: Re: [linux-lvm] Hosed up arrays and LVM
From: Bill Ranck <ranck@vt.edu>
In-Reply-To: <4380B4AA.5080705@tsss.org>
References: <1132507550.24931.29.camel@joesgrill.cc.vt.edu>
	<4380B4AA.5080705@tsss.org>
Date: Tue, 22 Nov 2005 09:14:36 -0500
Message-Id: <1132668877.26968.58.camel@joesgrill.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM discussion list <linux-lvm@redhat.com>

On Sun, 2005-11-20 at 09:38 -0800, kelsey hudson wrote:
> Bill Ranck wrote:
> > It continues on like that with another volume group and different uuids.
> > I have /dev/md0 through /dev/md11 defined with md and some of those seem
> > OK, but md1, md2, md3, md4, md8, md9, md11 are not seen by vgscan.  I
> > tried pvcreate on those missing arrays, which made them visible, but LVM
> > does not recognize them as part of the volume groups they belong to
> > anymore.  
> > 
> > Can anyone suggest a course of action here?
> 
> ouch, you ran pvcreate on a volume which already had data on it? From 
> all I've read, you had better have a good backup laying around, 'cause 
> you may not be able to get that data back pvcreate, IIRC, wipes out the 
> metadata ...
> 
> If you have the old UUIDs for the physical volumes, you may be able to 
> write those back to the device using pvcreate -u <old-uuid> on each such 
> PV, then try vgscan again.

Actually, this worked.  After a night's sleep and some coffee I was able
to see things more clearly.  The original source of the problem was
mdadm.conf not being up to date.  I had added a couple of LUNs to two md
multipath arrays a couple weeks ago specifically to have room for
snapshots.  I forgot to update the mdadm.conf file with the two new LUNs
and when the system rebooted on Sunday after some SAN maintenance the md
assemble step did not create those two arrays.  LVM could not see all
the PVs for the volume group and could not make them active.

I did a pvremove on each of the md arrays that I had pvcreated the day
before.  I then did a new pvcreate using info from the /etc/lvm/backup
files to assign the original uuid to each.  I fixed /etc/mdadm.conf,
assembled the two missing arrays/LUNs, and used pvcreate to assign them
the correct uuids as well.  Then vgcfgrestore restored the rest of the
metadata and I was able to activate the volume groups and mount the
volumes.  All the data survived.  I had to force (-ff) the pvcreate on
the two new LUNs, but since those are just there for snapshots no data
was lost.

I have added some logic to my startup/shutdown script to create a
current version of mdadm.conf file at startup and at shutdown.  It's
saved in / so it does not overwrite the existing one.

So, not truly an LVM problem, but thought I'd point out that since the
disks had never been mounted or assembled into a functioning volume
group, recreating them with the correct uuids and restoring the metadata
saved the day.

-- 
Bill Ranck
Blacksburg, Va.
540-231-3951
