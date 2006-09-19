Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8JMBsP8013224
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 18:11:54 -0400
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8JMBqXQ012652
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 18:11:52 -0400
Received: from d216-220-25-57.dynip.modwest.com (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id 8C9C125026
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 16:11:28 -0600 (MDT)
Date: Tue, 19 Sep 2006 16:11:26 -0600
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] LVM on RAID
Message-ID: <3C43314DD3F67327AB0CC3D7@d216-220-25-57.dynip.modwest.com>
In-Reply-To: <Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<1158608557.19905.37.camel@bounty.rider.geekspirit.net>
	<1158609135.7182.21.camel@localhost.localdomain>
	<1158609477.19905.38.camel@bounty.rider.geekspirit.net>
	<Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



--On September 19, 2006 4:53:58 PM -0500 Alexander Lazarevich 
<alazarev@itg.uiuc.edu> wrote:

> We have several RAID devices (16-24 drive Fiber/SCSI attached RAID) which
> are currently single devices on our 64bit linux servers (RHEL-4, core5).
> We are considering LVM'ing 2 or more of the RAID's into a LVM group. I
> don't doubt the reliability and robustness of LVM2 on single drives, but
> I worry about it on top of RAID devices.
>
> Does anyone have any experience with LVM on to of RAID volumes, positive
> or negative?

This is nearly the exact scenario we use.  Works great.  LVM is indifferent 
to the backend block device.
