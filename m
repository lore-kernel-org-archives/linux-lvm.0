Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8JLrxm3006919
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 17:53:59 -0400
Received: from zeus.itg.uiuc.edu (zeus.itg.uiuc.edu [130.126.126.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8JLrw3R005930
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 17:53:58 -0400
Received: from zeus.itg.uiuc.edu (localhost.localdomain [127.0.0.1])
	by zeus.itg.uiuc.edu (8.13.1/8.13.1) with ESMTP id k8JLrwcf005979
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 16:53:58 -0500
Received: from localhost (alazarev@localhost)
	by zeus.itg.uiuc.edu (8.13.1/8.13.1/Submit) with ESMTP id
	k8JLrw2O005976
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 16:53:58 -0500
Date: Tue, 19 Sep 2006 16:53:58 -0500 (CDT)
From: Alexander Lazarevich <alazarev@itg.uiuc.edu>
In-Reply-To: <1158609477.19905.38.camel@bounty.rider.geekspirit.net>
Message-ID: <Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<1158608557.19905.37.camel@bounty.rider.geekspirit.net>
	<1158609135.7182.21.camel@localhost.localdomain>
	<1158609477.19905.38.camel@bounty.rider.geekspirit.net>
MIME-Version: 1.0
Subject: [linux-lvm] LVM on RAID
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

We have several RAID devices (16-24 drive Fiber/SCSI attached RAID) which 
are currently single devices on our 64bit linux servers (RHEL-4, core5). 
We are considering LVM'ing 2 or more of the RAID's into a LVM group. I 
don't doubt the reliability and robustness of LVM2 on single drives, but I 
worry about it on top of RAID devices.

Does anyone have any experience with LVM on to of RAID volumes, positive 
or negative?

Thanks,

Alex
