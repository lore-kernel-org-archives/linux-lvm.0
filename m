Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4E1AsrD024640
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 21:10:54 -0400
Received: from vms046pub.verizon.net (vms046pub.verizon.net [206.46.252.46])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4E1Ag2a023874
	for <linux-lvm@redhat.com>; Tue, 13 May 2008 21:10:42 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms046.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0U0090638YHWMI@vms046.mailsrvcs.net> for
	linux-lvm@redhat.com; Tue, 13 May 2008 20:10:10 -0500 (CDT)
Date: Tue, 13 May 2008 21:10:09 -0400
From: Gerry Reno <greno@verizon.net>
Message-id: <482A3BF1.9020607@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] recovering data from hdd
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

I have a machine that suffered a lightning hit and it's toast.  Even 
with surge protectors it still got zapped.  Anyway, I'm not going to 
rebuild this machine.  What I want to do is to get some information off 
the hard drive.  If I remember it only had one VG VolGroup00.  So can I 
attach this to another machine and read it?  Won't the VolGroup00 
conflict with the hosts VolGroup00?  How can I change it to be some 
other name?

Regards,
Gerry
