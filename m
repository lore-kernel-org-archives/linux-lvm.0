Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8OFiR4v019479
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 11:44:27 -0400
Received: from e3.ny.us.ibm.com (e3.ny.us.ibm.com [32.97.182.143])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id m8OFiG00010591
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 11:44:19 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e3.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m8OFi1p0003285
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 11:44:01 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	m8OFho5n236454
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 11:43:56 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m8OFhod1030169
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 11:43:50 -0400
Received: from malahal.localdomain ([9.47.17.130])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m8OFhn5R030143
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 11:43:50 -0400
Date: Wed, 24 Sep 2008 08:43:49 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Moving a lvm volume to a new computer
Message-ID: <20080924154349.GA10497@us.ibm.com>
References: <67b9580f6a9725a6355067fc1a29dd75@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67b9580f6a9725a6355067fc1a29dd75@localhost>
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

The following links should help you.

https://www.redhat.com/archives/linux-lvm/2007-November/msg00039.html
https://www.redhat.com/archives/linux-lvm/2007-November/msg00040.html

--Malahal.

francois@saidi-oliver.com [francois@saidi-oliver.com] wrote:
> Hi,
> 
> I am little bit new to lvm concept but i've set up a lvm volume on a raid1
> as follow :
> i have two physical disks sda and sdb. They have both 2 partitions which
> makes the md0 and md1 of the raid. I've set up the /boot on the md0 and an
> lvm (called RaidLvm) on md1 (with 4 partitions /, /usr, /home and /var).
> Everything works fine. The problem began when i added a bunch of two disks
> (hda and hdb) with no raid but a large lvm partition over the two of them
> (called data) (this lvm comes from a previous computer).
> When i try to boot, the kernel finds the data lvm but cannot find the
> RaidLvm
> and just stops booting...
> I've tried to export the data lvm, but that doens't help...
> 
> Any idea?
> 
> Thanks,
> Franky
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
