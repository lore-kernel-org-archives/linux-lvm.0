Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6DHYOZK011698
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 13:34:24 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6DHY8IJ006298
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 13:34:08 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e36.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6DHWY1O025678
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 11:32:34 -0600
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6DHXvn5233578
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 11:34:03 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6DHXsGB026940
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 11:33:54 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n6DHXntA026715
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 11:33:52 -0600
Date: Mon, 13 Jul 2009 10:33:49 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] LVM mirroring or mdadm
Message-ID: <20090713173349.GB9504@us.ibm.com>
References: <200907131732.20178.imobachgs@banot.net>
	<1247504764.4530.20.camel@blue.colorful.local>
	<5de034af0907131014w1c424d83rc4d6034804b5e395@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5de034af0907131014w1c424d83rc4d6034804b5e395@mail.gmail.com>
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

Diego Jacobi [jacobidiego@gmail.com] wrote:
> Hi.
> 
> 
> For te mirrorlog you can partition your new disk with 2 lvm
> partitions. One for logs.
> A mirror log are normally 4 Mb for each mirror, at least in my current system.
> I maked a 1Gb partition only for logs and it is way too much, but 1 Gb
> in current disks is nothing.

You don't need to partition the disk and create a new PV just for the
LVM mirror log. You can use "--alloc anywhere" while creating the mirror
volume and LVM will gladly allocate mirror log on one of your mirror
legs.

--Malahal.
