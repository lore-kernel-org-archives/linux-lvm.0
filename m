Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4R7BuO04686
	for <linux-lvm@redhat.com>; Fri, 27 May 2005 03:11:56 -0400
Received: from mauritiustelecom.com (mail.mauritiustelecom.com [202.123.2.83])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4R7BsPw015366
	for <linux-lvm@redhat.com>; Fri, 27 May 2005 03:11:55 -0400
Received: from [202.123.1.2] (account hantzley.tauckoor@telecomplus.net HELO
	[127.0.0.1]) by mauritiustelecom.com (CommuniGate Pro SMTP 4.2)
	with ESMTP id 2809957 for linux-lvm@redhat.com;
	Fri, 27 May 2005 11:13:11 +0400
Message-ID: <4296C82C.6090502@telecomplus.net>
Date: Fri, 27 May 2005 11:11:40 +0400
From: Hantzley Tauckoor <hantzley@telecomplus.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM with Powerpath - incompatibility
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

Hi,

I have a CX300 Clariion and a x445 IBM (4 processors and 4GB RAM) server 
equipped with 2 Emulex FibreChannel cards which are directly connected 
to the cx300's controllers.

My software config is as follows:

Redhat ES 3.0 with Kernel 2.4.21-20.ELsmp
PowerPath 4.3.1
LPFC 2.4 driver kit 7.2.4-1
lvm-1.0.3-15


I created 2LUNs on the cx300, and therefore I can see 4 sd devices on 
linux (2 on one path and 2 on the other). After installing PowerPath, I 
am able to access the LUNs via /dev/emcpowera1 and /dev/emcpowerb1 
respectively.

But I cannot use LVM on these devices directly. However LVM works with 
/dev/sd* devices. I wish to use it with the PowerPath devices instead, 
so as to have dynamic multipathing.

I also tried to install Veritas Volume Manager; no luck, the eval 
version was compiled for kernel.2.4.xx-Hugemem - which is not my present 
kernel. I have incompatibility problems because PowerPath 4.3.1 requires 
at kernel 2.4.21-15 or 2.4.21-20.

Is there someone who had the same type of problem? Any tip on how to 
make LVM run with PowerPath devices?

Thank you in advance for your replies.

Rgds,

Hantzley Tauckoor
----------------------------------------------------
Project Manager
Telecom Plus Ltd
www.telecomplus.net
----------------------------------------------------
