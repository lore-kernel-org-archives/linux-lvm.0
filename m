Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8MLLZO5009254
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2008 17:21:36 -0400
Received: from e2.ny.us.ibm.com (e2.ny.us.ibm.com [32.97.182.142])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8MLLYbF011396
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2008 17:21:34 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m8MLLXn4023864
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2008 17:21:33 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	m8MLLK0A164208
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2008 17:21:33 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m8MLLKQn013151
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2008 17:21:20 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130]
	(may be forged))
	by d01av04.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m8MLLKA5012636
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2008 17:21:20 -0400
Date: Mon, 22 Sep 2008 14:21:07 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Mirrored LV
Message-ID: <20080922212107.GA19145@us.ibm.com>
References: <1221592827.6037.57.camel@localhost>
	<20080916204241.GA9810@us.ibm.com>
	<1221599565.6037.82.camel@localhost>
	<20080916215759.GA11670@us.ibm.com>
	<1221836810.4051.8.camel@koenws.oogziekenhuis.lan>
	<20080919173108.GA15000@us.ibm.com>
	<1221861679.4718.1.camel@localhost>
	<C6403FD1-E3EE-45EC-B294-F8C55FB07896@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C6403FD1-E3EE-45EC-B294-F8C55FB07896@redhat.com>
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

Jonathan Brassow [jbrassow@redhat.com] wrote:
> Just to answer some questions:
>
> You can use just 2 disks to create a mirror and a disk log:
> prompt> lvcreate --alloc anywhere -m1 -L 500M -n my_lv my_vg
>
> I wish the allocation policy 'normal' (which is the default) would also do 
> this... but instead you must choose a looser allocation policy to get what 
> you want.
>
> The reason that you want the disk-based log is to prevent all the extra 
> work when you machine comes up.

I wish LVM can detect and only re-sync if needed even with corelog!

> The reason that LVM wants a separate disk for the log is so the head on the 
> storage device doesn't need to go ping-ponging around the device.  (The log 
> is touched for almost every write.)  So, its a performance thing... and 
> possibly a not-wear-out-your-hardware thing too.

Nice to know about guaranteed long disk seeks with this approach!

--Malahal.
