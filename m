Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAK0XYr29418
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 19:33:34 -0500
Received: from nile.gs.washington.edu (nile.gs.washington.edu [128.95.231.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAK0XSm6002411
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 19:33:28 -0500
Received: from nile.gs.washington.edu (localhost [127.0.0.1])
	by nile.gs.washington.edu (8.12.11/8.12.11) with ESMTP id
	iAK0XM5P011496
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 16:33:22 -0800
Received: (from dgs@localhost)
	by nile.gs.washington.edu (8.12.11/8.12.11/Submit) id iAK0XMcT011495
	for linux-lvm@redhat.com; Fri, 19 Nov 2004 16:33:22 -0800
Date: Fri, 19 Nov 2004 16:33:22 -0800
From: "David S." <dgs@gs.washington.edu>
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
Message-ID: <20041120003322.GE10969@nile.gs.washington.edu>
References: <1100857645.13422.99.camel@grma-lap>
	<1100888487.4379.9.camel@tesuji.nac.uci.edu>
	<20041119192447.GB10969@nile.gs.washington.edu>
	<1100909625.4379.51.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1100909625.4379.51.camel@tesuji.nac.uci.edu>
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

On Fri, Nov 19, 2004 at 04:13:45PM -0800, Dan Stromberg wrote:
> On Fri, 2004-11-19 at 11:24 -0800, David S. wrote:
> > You can use PVFS2 (http://www.pvfs.org/pvfs2/) to aggregate disks from
> > multiple servers into on big file system.  Though PVFS2 is specifically
> > designed for parallel applications, and may not be suited for your
> > purposes.  You can sort-of do it with AFS (http://www.openafs.org),
> > with mutiple file servers servicing the same name space.  AFS is again
> > rather different from an "ordinary" file system, however.  I know you
> > can do it with IBM's GPFS (http://www-1.ibm.com/servers/eserver/clusters/software/gpfs.html);
> > we use GPFS here on two servers attached to an IBM SAN to create a
> > 6.5T file system.  But if you decide to take a run at GPFS, don't
> > blame me.
> 
> Does PVFS2 have posix semantics these days?

It has a kernel interface, so it supports the familiar open(2), lseek(2),
read(2), write(2), ... calls.  It doesn't provide POSIX semantics.

> 
> My understanding is that IBM will only support GPFS on IBM hardware...
> 

Our SAN is from IBM, and our servers and most of our clients are 
IBM-branded commodity x86 hardware.  IBM will support GPFS on non-IBM 
commodity hardware if you pay it enough.  But you'd have to really
enjoy pain to pay for GPFS.

David S.

> 
