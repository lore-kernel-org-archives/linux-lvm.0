Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l77J1snU008588
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2007 15:01:54 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IIUJW-0006Kg-05
	for linux-lvm@redhat.com; Tue, 07 Aug 2007 20:01:54 +0100
Date: Tue, 7 Aug 2007 20:01:53 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Best practice: metadata backup
Message-ID: <20070807190153.GV2064@agk.fab.redhat.com>
References: <Pine.LNX.4.44.0708050009370.22952-100000@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0708050009370.22952-100000@bmsred.bmsi.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Aug 05, 2007 at 12:17:15AM -0400, Stuart D. Gathman wrote:
> LVM keeps backups of metadata in /etc/lvm (or some distro specific place).  
> This is not especially useful when the root filesystem itself is in LVM.  
> I have been making rsync backups of /etc/lvm to /boot (which is non-LVM
> since grub doesn't support LVM until 1.95).  Should I make /etc/lvm a
> symlink to /boot/lvm?
 
If you give /boot enough free space.

You can also change the location by setting the environment variable
LVM_SYSTEM_DIR.

> When grub supports LVM, and the entire disk is LVM (no partition table),
> how will backups be made?  

Just like any other file backups - tape, CD, internet: you choose!

> AIX treats the boot LV specially, and ensures
> that its PEs are contiguous at the beginning of the disk(s).  

Nothing is stopping a linux installer doing that today:
  --alloc contiguous and specify the extents.

But if grub supports LVM2 properly (add a trivial mapping layer from LV
extents to physical sectors, then populate it from the LVM2 metadata
across an agreed interface from a library maintained as part of the lvm2
package) it won't require anything like that of course - the hardest
problem I think is actually for it to identify the right disks to use.

Alasdair
-- 
agk@redhat.com
