Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3UDUTYX013531
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 09:30:29 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3UDUHRV023942
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 09:30:18 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JrCNw-00019N-SJ
	for linux-lvm@redhat.com; Wed, 30 Apr 2008 13:30:12 +0000
Received: from 202.3.112.9 ([202.3.112.9])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 13:30:12 +0000
Received: from rrs by 202.3.112.9 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 13:30:12 +0000
From: Ritesh Raj Sarraf <rrs@researchut.com>
Date: Wed, 30 Apr 2008 18:27:00 +0530
Message-ID: <st6me5-ohk.ln1@learner.researchut.com>
References: <3120c9e30804290605w774b8bc4s68265a9cc74843e9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8Bit
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: Linux LVM performance using multiple iSCSI targets
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
To: linux-lvm@redhat.com

???? Anuj Singh wrote:

> 
> I used lvm and created a logical volume say MyBigStorage on FileServer
> using /dev/sda1, /dev/sda2, /dev/sda3..../dev/sdaN as physical disks
> (these are the raw disks exported from iscsi-target machines).
>
Is it only sda or sda/sdb and so on?

You should rather be using device IDs. I am not sure how PVs are scanned
during OS boot up. If names are hardcoded, you will be in trouble.
 
> 
> 4. Any other issue which you can suggest with above approach?
> 
You are not using dm-multipath for this setup?
Have you tested the current configuration with some of the iSCSI devices
made unavailable in between and exceeding the timeout period?

Ritesh
-- 
If possible, Please CC me when replying. I'm not subscribed to the list.
