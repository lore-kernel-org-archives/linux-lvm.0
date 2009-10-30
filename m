Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9U0gZhA000670
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 20:42:35 -0400
Received: from e1.ny.us.ibm.com (e1.ny.us.ibm.com [32.97.182.141])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9U0gNhf014273
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 20:42:23 -0400
Received: from d01relay05.pok.ibm.com (d01relay05.pok.ibm.com [9.56.227.237])
	by e1.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id n9U0ejXg014861
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 20:40:45 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay05.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n9U0gMvZ104556
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 20:42:22 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	n9TKe5Y9022938
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 16:40:05 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av02.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	n9TKe3n3022846
	for <linux-lvm@redhat.com>; Thu, 29 Oct 2009 16:40:04 -0400
Date: Thu, 29 Oct 2009 17:42:18 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Best Practices deploying LVM
Message-ID: <20091030004218.GA11054@us.ibm.com>
References: <868096450910291645k49ebb1dfn1e55e5132805011e@mail.gmail.com>
	<1256860851.19833.14@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1256860851.19833.14@raydesk1.bettercgi.com>
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

Ray Morris [support@bettercgi.com] wrote:
>     I don't know about a whitepaper, but I can address
> your example.
> 
> > he makes one volume group for each logical volume (more or less)
> 
>     If each one has one volume, that's not exactly a volume
> GROUP, is it?  If groups and volumes are basically synomous,
> he gives up all the benfits of groups.  In fact, he gives
> up most of the benefits of logical volumes, since each PV
> has to be in one group, and each VG is one LV, you're left
> with one LV per PV - might as well just use partitions
> directly.

I agree, you lose some flexibility but it has some advantage compared to
plain partitions without LVM. E.g. he can make a file system larger than
any disk with multiple disks in the above LVM (one LV per VG)
configuration.  There are other advantages. I am not sure the reason for
making only one LV per VG though!

Thanks, Malahal.
