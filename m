Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8JM5FDJ011024
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 18:05:15 -0400
Received: from arvo.suso.org (mail.suso.org [216.9.132.134])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8JM5EaH009909
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 18:05:14 -0400
Date: Tue, 19 Sep 2006 22:04:55 +0000
From: Mark Krenz <mark@suso.org>
Subject: Re: [linux-lvm] LVM on RAID
Message-ID: <20060919220454.GE28043@arvo.suso.org>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<1158608557.19905.37.camel@bounty.rider.geekspirit.net>
	<1158609135.7182.21.camel@localhost.localdomain>
	<1158609477.19905.38.camel@bounty.rider.geekspirit.net>
	<Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


  I couldn't imagine using LVM on a server without it being on RAID.
Although I've only been using LVM for less than a year, I've installed
it ontop of hard and software RAID-1 on several different servers
including on Xen virtual machines and it has all been fine.

 Just make sure that you don't expect LVM to keep your data if you lose
a drive and are not doing RAID underneath.  ;-)


On Tue, Sep 19, 2006 at 09:53:58PM GMT, Alexander Lazarevich [alazarev@itg.uiuc.edu] said the following:
> We have several RAID devices (16-24 drive Fiber/SCSI attached RAID) which 
> are currently single devices on our 64bit linux servers (RHEL-4, core5). 
> We are considering LVM'ing 2 or more of the RAID's into a LVM group. I 
> don't doubt the reliability and robustness of LVM2 on single drives, but I 
> worry about it on top of RAID devices.
> 
> Does anyone have any experience with LVM on to of RAID volumes, positive 
> or negative?
> 
> Thanks,
> 
> Alex
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


-- 
Mark S. Krenz
IT Director
Suso Technology Services, Inc.
http://suso.org/
