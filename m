Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJJOsr32729
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 14:24:54 -0500
Received: from nile.gs.washington.edu (nile.gs.washington.edu [128.95.231.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAJJOmFW003514
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 14:24:48 -0500
Received: from nile.gs.washington.edu (localhost [127.0.0.1])
	by nile.gs.washington.edu (8.12.11/8.12.11) with ESMTP id
	iAJJOlwe011107
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 11:24:47 -0800
Received: (from dgs@localhost)
	by nile.gs.washington.edu (8.12.11/8.12.11/Submit) id iAJJOlQ5011106
	for linux-lvm@redhat.com; Fri, 19 Nov 2004 11:24:47 -0800
Date: Fri, 19 Nov 2004 11:24:47 -0800
From: "David S." <dgs@gs.washington.edu>
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
Message-ID: <20041119192447.GB10969@nile.gs.washington.edu>
References: <1100857645.13422.99.camel@grma-lap>
	<1100888487.4379.9.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1100888487.4379.9.camel@tesuji.nac.uci.edu>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

> 
> Another alternative is Lustre.  It is a filesystem which purports to be
> able to aggregate the disks of multiple storage computers into one or
> more gigantic filesystems.  It isn't stable for us, but it may be
> someday.  :)  The Lustre vendor claims to be able to break not just the
> 2T barrier, but also the 16T barrier.  We do have a lustre filesystem of
> over 16T set up now, but it remains to be seen what will happen when we
> actually put over 16T of -data- in it.
> 
> Another option may be the "LBD" patches.  I haven't tried them, nor even
> studied about them.

You can use PVFS2 (http://www.pvfs.org/pvfs2/) to aggregate disks from
multiple servers into on big file system.  Though PVFS2 is specifically
designed for parallel applications, and may not be suited for your
purposes.  You can sort-of do it with AFS (http://www.openafs.org),
with mutiple file servers servicing the same name space.  AFS is again
rather different from an "ordinary" file system, however.  I know you
can do it with IBM's GPFS (http://www-1.ibm.com/servers/eserver/clusters/software/gpfs.html);
we use GPFS here on two servers attached to an IBM SAN to create a
6.5T file system.  But if you decide to take a run at GPFS, don't
blame me.

David S.

> 
