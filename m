Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o05K1fZx030472
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 15:01:41 -0500
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o05K1PXN026442
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 15:01:26 -0500
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.7) with ESMTP id o05K1P612579
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 12:01:25 -0800 (PST)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.3) with ESMTP id o05K1P6f024935
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 12:01:25 -0800
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id o05K1P7d024934
	for linux-lvm@redhat.com; Tue, 5 Jan 2010 12:01:25 -0800
Date: Tue, 5 Jan 2010 12:01:25 -0800
From: Ray Van Dolson <rvandolson@esri.com>
Message-ID: <20100105200125.GA24123@esri.com>
References: <4B438ECC.5000805@alteeve.com>
	<Pine.LNX.4.64.1001051418140.9847@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1001051418140.9847@bmsred.bmsi.com>
Subject: Re: [linux-lvm] What is holding back clustered snapshotting?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Jan 05, 2010 at 11:30:01AM -0800, Stuart D. Gathman wrote:
> On Tue, 5 Jan 2010, Madison Kelly wrote:
> 
> >   I know that, currently, this isn't supported. Would someone be able to
> > explain or point me at a place to read up on what is holding this feature
> > back? What are the difficulties? Is it just a question of time, or are there
> > certain technical hurdles in the way?
> 
> Setting up the shapshot is just a matter of locking and coordination.
> However, writes to the origin or snapshot (may) require allocating a
> cluster, copying the origin data, then writing the origin.  All of
> this coordinated with all the machines using the VG.  Apart from some
> cleven invention, this requires global locking on many writes.  This
> is just too inefficient.

Writeable snapshots I guess would be a challenge.  But even read only
snapshots would be great as it would theoretically make backing up
large, clustered filesystems simpler.

> 
> However, you can obtain the same effect using a SAN.  Have one
> machine run LVM (and raid, etc), and export LVs via AoE or iSCSI.  Of
> course, that LVM machine now becomes a single point of failure...
> 
> Here's an idea (someone probably already thought of this, but..),
> have one machine in a cluster elected "master" for a VG, and have all
> reads/writes from other machines go through the master via AoE or
> iSCSI.  When failure of the "master" is detected, elect another
> machine to take over as master.  Sort of a rotating SAN server.
> 

Interesting idea. :)

Ray
