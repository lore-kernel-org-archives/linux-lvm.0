Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i81I0x309117
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 14:00:59 -0400
Received: from stl.rural.usda.gov (stl.rural.usda.gov [199.159.138.244])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i81I0qAk029979
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 14:00:52 -0400
Received: from [192.168.123.4] (monkey.rural.usda.gov [199.159.140.179])
	by stl.rural.usda.gov (8.12.11/8.12.10) with ESMTP id i81Hv10o010936
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 12:57:02 -0500
Message-ID: <41360E48.3030709@charter.net>
Date: Wed, 01 Sep 2004 13:00:40 -0500
From: James P <superfueld@charter.net>
MIME-Version: 1.0
References: <63BAEF7DCB973A469B1A60CBE113C1650872A631@cmss-mail.Tickets.com>
	<20040901152234.GB4300@localhost.localdomain>
In-Reply-To: <20040901152234.GB4300@localhost.localdomain>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM and Ghost
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Some of our admins are running into trouble running Norton Ghost on 
our RHEL ES 3.0 boxes. Ghost claims it doesn't recognize what's on 
the disk so it just does a raw dump of the entire (36 Gig) disk. 
This offers practically zero compression, so we're getting ghost 
images that are many times larger than the amount of actual used 
space on the machine.

The only difference I can think of between these machines and our 
other Linux boxes that ghost perfectly well is that these are using 
LVM. Is this causing the problem with Ghost? Has anyone else run 
into this? What can we do to get Ghost to recognize where the data 
is on the disk so we can get some sort of reasonably sized images? 
Anything?

--James
