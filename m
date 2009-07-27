Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6REAoGu011113
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 10:10:50 -0400
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6REAXbX005074
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 10:10:33 -0400
Received: from soda.linbit (unknown [10.9.9.55])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id B4C6D1018D52
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 16:10:32 +0200 (CEST)
Date: Mon, 27 Jul 2009 16:10:32 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: Re: [linux-lvm] Mirroring implementation
Message-ID: <20090727141032.GC8046@barkeeper1-xen.linbit>
References: <29ae894c0907260312m3b2ffb2ex5cbef456f3c49bee@mail.gmail.com>
	<20090727135628.GA3782@us.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20090727135628.GA3782@us.ibm.com>
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

On Mon, Jul 27, 2009 at 06:56:28AM -0700, malahal@us.ibm.com wrote:
> brem belguebli [brem.belguebli@gmail.com] wrote:
> >    Hi,
> >    I have a few questions concerning LVM mirror implementation, and I
> >    couldn't find any suitable design doc
> >    I need to setup a dual site ( a few miles between the 2 sites, around 1 ms
> >    RTD) mirror based cluster system.
> 
> You need asynchronous mirroring (remote replication module). This is not
> in mainline (not sure if included in the latest RHEL release). The
> following comments apply to dm-mirror module that is already in the
> mainline.

There is also MD RAID1, see man mdadm, the --write-mostly and --write-behind options.

And of course, DRBD http://www.drbd.org
which is not RAID1 turned into replication,
but a dedicated replication solution.

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com
