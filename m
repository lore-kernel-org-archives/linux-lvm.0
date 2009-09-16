Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GKY7Rx015600
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 16:34:07 -0400
Received: from e5.ny.us.ibm.com (e5.ny.us.ibm.com [32.97.182.145])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8GKXsNx000865
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 16:33:54 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id n8GKOtXV013846
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 16:24:55 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n8GKXjN4250912
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 16:33:45 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n8GKXiji006397
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 16:33:44 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n8GKXeEE006273
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 16:33:41 -0400
Date: Wed, 16 Sep 2009 13:33:40 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
Message-ID: <20090916203340.GA21276@us.ibm.com>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916181947.GB15438@us.ibm.com>
	<1253127828.3243.1.camel@delo.gdit>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1253127828.3243.1.camel@delo.gdit>
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
To: linux-lvm@redhat.com

Ambrogio De Lorenzo [ambrogio.de.lorenzo@alice.it] wrote:
> > snapshot may be a good fit in this case, but if you insist you can use
> > lvconvert to convert your linear volume to a mirrored volume. Once the
> > sync is complete, you can use the same lvconvert to convert the mirror
> > volume to a linear one.
> But with this I loose the secondary copy.
> It's not a good idea.
> Backup and destroy backup :-)

If that is on a single PV, you can disconnect it to avoid it being
allocated by LVM for other things. I think, taking a snapshot and coping
it somewhere as someone said is a good idea.
