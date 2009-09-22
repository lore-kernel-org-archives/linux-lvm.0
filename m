Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8MG8BO3021429
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 12:08:11 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8MG7w18017722
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 12:07:58 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e37.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id n8MG6x7F016369
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 10:07:00 -0600
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n8MG7qGS180318
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 10:07:52 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n8MG7pf3032650
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 10:07:51 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n8MG7oJs032585
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 10:07:51 -0600
Date: Tue, 22 Sep 2009 09:07:50 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] I've tried to get some support on this list about lvm
Message-ID: <20090922160750.GA12265@us.ibm.com>
References: <200909152137.44474.whobedobe@dodo.com.au>
	<200909172059.49369.whobedobe@dodo.com.au>
	<4AB88C0B.6020203@redhat.com>
	<200909222318.17782.whobedobe@dodo.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200909222318.17782.whobedobe@dodo.com.au>
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

Hugh [whobedobe@dodo.com.au] wrote:
> Any idea how to resize sdb2? It's lvm and maybe I could delete it and
> recreate it with fdisk but maybe it will break and everything will be
> lost.
> 
> Hugh

You should be able to use fdisk to delete the partition first and then
create a new one with bigger size. MAKE SURE that the new partition's
start sector is same as the old one.

Thanks, Malahal.
