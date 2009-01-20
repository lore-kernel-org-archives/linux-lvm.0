Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0K95uO3000590
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 04:05:56 -0500
Received: from eu3sys201aog003.obsmtp.com (eu3sys201aog003.obsmtp.com
	[207.126.148.183])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n0K92Yl5011608
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 04:02:35 -0500
Received: from [192.168.150.6] (projekte.imos.net [212.87.131.201])
	by nemo.xenovation.com (Postfix) with ESMTP id 49C2A11D31DB
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 10:02:33 +0100 (CET)
Message-ID: <4975932A.6090902@bortal.de>
Date: Tue, 20 Jan 2009 10:02:34 +0100
From: "ml@bortal.de" <ml@bortal.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 2GB limit
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
To: linux-lvm@redhat.com

Hello List,

i have a 32bit Linux box with a 3Ware Raidcontroller and 4x 1TB disks. 
After installing Debian Etch i had to find out that i am running into 
some limits.

Is there a way to use a Partition >2GB with 32Linux/LVM?

Cheers,
Mario
