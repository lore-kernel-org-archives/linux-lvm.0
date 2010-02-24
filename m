Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1OItmjl020537
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 13:55:48 -0500
Received: from e6.ny.us.ibm.com (e6.ny.us.ibm.com [32.97.182.146])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o1OItVD3025113
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 13:55:32 -0500
Received: from d01relay03.pok.ibm.com (d01relay03.pok.ibm.com [9.56.227.235])
	by e6.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id o1OIqJ5x025442
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 13:52:19 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay03.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o1OItVZr074268
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 13:55:31 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	o1OItVCE002144
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 15:55:31 -0300
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av03.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	o1OItUp6002122
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 15:55:31 -0300
Date: Wed, 24 Feb 2010 10:55:30 -0800
From: malahal@us.ibm.com
Message-ID: <20100224185530.GA22199@us.ibm.com>
References: <ece181eaa6b6652da66cb42699955e87.squirrel@fela.liber4e.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ece181eaa6b6652da66cb42699955e87.squirrel@fela.liber4e.com>
Subject: Re: [linux-lvm] Mirror fail/recover test
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

jose nuno neto [jose.neto@liber4e.com] wrote:
> Hi
> 
> I'm trying to test the failure of a SAN Mirrored Lv, and the recover and
> check for data lost.
> 
> Im runing RedHat 5.4
> 2.6.18-164.2.1.el5
> lvm2-2.02.46-8.el5_4.1
> 
> I create a 2mirror+log lv ok, can lvconvert to one leg only, can delete ok.
> But when I simulate a disk fail either with
> dd if=/dev/zero of=pvmirror_device
> echo offline > /sys/block/pvmirror_device/device/status

What is the output of "dmsetup status" at this point?
There must be some messages in the /var/log/messages file if you enable
them.

> lvs -a -o +devices
> stills shows the lv has mirrored ( should switch to non-mirrored right?) ,

Yes, provided you successfully started the dmeventd monitoring thread
and it handled the failure event.

Thanks, Malahal.
