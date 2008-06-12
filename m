Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5CGd1nY003163
	for <linux-lvm@redhat.com>; Thu, 12 Jun 2008 12:39:01 -0400
Received: from ucsc.edu (massmail.ucsc.edu [128.114.129.84])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5CGcnf8007789
	for <linux-lvm@redhat.com>; Thu, 12 Jun 2008 12:38:49 -0400
Received: from [128.114.125.126] (HELO ucsc.edu)
	by massmail.ucsc.edu (CommuniGate Pro SMTP 5.1.7)
	with ESMTPS id 35637903 for linux-lvm@redhat.com;
	Thu, 12 Jun 2008 09:23:09 -0700
Received: from [128.114.25.105] (account ermorris@ucsc.edu HELO
	dhcp-25-105.ucsc.edu)
	by email-prod-fe-2.ucsc.edu (CommuniGate Pro SMTP 5.1.11)
	with ESMTPSA id 115394160 for linux-lvm@redhat.com;
	Thu, 12 Jun 2008 09:23:02 -0700
Message-Id: <EDDC9BAC-A82E-4D93-AA6D-BDCA1E0E1714@pmc.ucsc.edu>
From: Eli Morris <emorris@pmc.ucsc.edu>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v924)
Date: Thu, 12 Jun 2008 09:23:01 -0700
Subject: [linux-lvm] Volume group "vgs" not found
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-lvm@redhat.com

Dear all,

	I'm running Centos 4, as part of a Rocks cluster. I have a 13 TB lvm2  
volume. At boot up, the volume group doesn't get activated. When I run  
'vgchange -ay' it activates the volume group without error and I can  
then mount it. I've turned lvm logging on and I notice the message  
'toollib.c:508 vgchange  Volume group "vgs" not found'. I don't think  
I have a 'vgs' volume group. At least I don't find I have one if I use  
tools like 'vgscan'. The only thing that shows up is my 13 TB volume,  
as it should be. I haven't been able to find any information on such  
an error. I used yum update to make sure I had the latest lvm2  
packages for my distro. I can't upgrade distros, because that would  
screw other stuff up. Any info on this, or recommendations as to how I  
could track it down?

Thanks,

Eli
