Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3EBqwj10871
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2004 07:52:58 -0400
Received: from mail.werbeagentur-aufwind.de (websrv.werbeagentur-aufwind.de
	[213.239.197.241])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i3EBqv87017486
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2004 07:52:58 -0400
Subject: Re: [linux-lvm] quota command does not work
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20040414083919.GA22343@redhat.com>
References: <20040413151723.GB19598@oddprocess.org>
	<20040414083919.GA22343@redhat.com>
Message-Id: <1081943571.8758.1.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Date: Wed, 14 Apr 2004 13:52:52 +0200
Content-Transfer-Encoding: 7bit
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
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Am Mi, den 14.04.2004 schrieb Heinz Mauelshagen um 10:39 Uhr +0200:

> > I am trying to get quota's working on the system. The quotas themselves
> > are working, however, standard users cannot issue the quota command to
> > inspect their own specific information:
> > 
> > $ quota
> > quota: Can't stat() mounted device /dev/nwlsd_vg/nwlsd_lv: Permission
> > denied
> > Disk quotas for user mellofone (uid 1000): none
>
> chgrp disk /dev/mapper/*
> chmod g=rw /dev/mapper/*
> 
> We need to fix that in dmlib (if not already done ;)

The problem seems to be the volume group directory which is set 700
here. Changing it to 755 fixes the problem for me, even if the device
nodes in /dev/mapper themselves are still 600.
