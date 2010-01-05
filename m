Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o05KIEmm002347
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 15:18:14 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o05KHwK4031248
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 15:17:59 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o05KHw9X026149
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 15:17:58 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o05KHwVX010581
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 15:17:58 -0500
Date: Tue, 5 Jan 2010 15:17:58 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <20100105200125.GA24123@esri.com>
Message-ID: <Pine.LNX.4.64.1001051515490.9847@bmsred.bmsi.com>
References: <4B438ECC.5000805@alteeve.com>
	<Pine.LNX.4.64.1001051418140.9847@bmsred.bmsi.com>
	<20100105200125.GA24123@esri.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 5 Jan 2010, Ray Van Dolson wrote:

> > Setting up the shapshot is just a matter of locking and coordination.
> > However, writes to the origin or snapshot (may) require allocating a
> > cluster, copying the origin data, then writing the origin.  All of
> > this coordinated with all the machines using the VG.  Apart from some
> > cleven invention, this requires global locking on many writes.  This
> > is just too inefficient.
> 
> Writeable snapshots I guess would be a challenge.  But even read only
> snapshots would be great as it would theoretically make backing up
> large, clustered filesystems simpler.

Even read-only snapshots have to handle writes to the origin.  And
anytime any machine writes a new cluster to the origin, all machines need their
cluster maps updated so that reads don't pick up the wrong cluster.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
