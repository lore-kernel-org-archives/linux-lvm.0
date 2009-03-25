Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2PC7SeV006839
	for <linux-lvm@redhat.com>; Wed, 25 Mar 2009 08:07:28 -0400
Received: from pluto.sivell.com (pluto-t3.sivell.com [65.112.245.197])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2PC6Nai029966
	for <linux-lvm@redhat.com>; Wed, 25 Mar 2009 08:06:23 -0400
Received: from ef.sivell.com (ef [192.168.249.210]) (authenticated bits=0)
	by pluto.sivell.com (8.13.1/8.13.1) with ESMTP id n2PC77ge020426
	for <linux-lvm@redhat.com>; Wed, 25 Mar 2009 07:07:08 -0500
Message-ID: <49CA2C22.9020100@sivell.com>
Date: Wed, 25 Mar 2009 07:05:38 -0600
From: vu pham <vu@sivell.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] CLVM Snapshot HOWTO?
References: <1237863480.6512.66.camel@ltpad.dugas.lan><49C854B8.3080009@sivell.com>
	<1237954529.6512.101.camel@ltpad.dugas.lan>
In-Reply-To: <1237954529.6512.101.camel@ltpad.dugas.lan>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Paul Dugas wrote:
> On Mon, 2009-03-23 at 22:34 -0500, Vu Pham wrote:
>> Paul Dugas wrote:
>>> I apologize if this has been covered already or is written up elsewhere
>>> but I can't seem to find it.  I've got a couple of AoE volumes that I'm
>>> using for LVM VGs.  They have GFS filesystems on LVs that are sized to
>>> fill 90% of the the VGs; 10% space left over for snapshots.  I have 4
>>> CENTOS 5.2 machines clustered and mounting the GFS filesystems.  That's
>>> working well.
>>>
>>> Having used LVM snapshots in non-cluster environments before, I figured
>>> I'd just use the same logic for backing up the volumes; lvcreate -s,
>>> mount, backup, umount, lvremove.  This quickly fell apart and I started
>>> to think about it more.  I ended up wondering how snapshots of the
>>> volume could ever really work without coordinating with the other
>>> nodes.  
>>>
>>> My question is this.  Should I be able to use snapshots on clustered
>>> volumes like this?  If not, are there plans to support it later?  If so,
>>> can someone point me to a working example?
>>>
>> I think you have to freeze the GFS volume before you create a snapshot, 
>> then you unfreeze it. man gfs_tool
> 
> That's what I was looking for.  Much thanks for getting me further but I
> think I'm still missing a step.  Currently, this is what my "pre-backup"
> script is doing:
> 
>         COOKIE=`gfs_tool list | egrep " $LK_TBL_NM.[0-9][0-9]*\$" | awk '{print \$1}'`
>         gfs_tool freeze $COOKIE
>         lvcreate --size ${SIZE} --snapshot --name SNAP /dev/${VG}/${LV}
>         gfs_tool unfreeze $COOKIE
>         gfs_fsck -y /dev/${VG}/SNAP
>         mount -t gfs -o ro,lockproto=lock_nolock /dev/${VG}/SNAP ${MNTPT}
> 
> I'm getting a "File Exists" error from the mount which I believe is
> because I'm trying to mount both the device and the snapshot at the same
> time and they share the same lock-table-name.   Now that I think of it,
> I don't really need to mount the original version of the file system so
> I may be able to move past this hitch but I'm wondering if there's a
> good way to address this?  Could I rename the lock table via "gfs_tool
> sb /dev/${VG}/$SNAP table $LK_TBL_NM.SNAP" to get around it?  Would that
> change be cleared when the snapshot is removed?
> 

I believe that anything changed on the snap device won't affect the 
original device. The changes will go to the COW dev, which is created 
when you create the snap dev.

Vu
