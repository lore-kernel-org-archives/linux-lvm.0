Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB1GMQr32110
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2004 11:22:26 -0500
Received: from cc.iut.ac.ir ([217.219.18.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iB1GMENS010180
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2004 11:22:15 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by cc.iut.ac.ir (Postfix) with ESMTP id 5CB4F2C803B
	for <linux-lvm@redhat.com.>; Wed,  1 Dec 2004 19:01:47 +0330 (IRT)
Received: from cc.iut.ac.ir ([127.0.0.1])
	by localhost (cc.iut.ac.ir [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 09217-01 for <linux-lvm@redhat.com.>;
	Wed,  1 Dec 2004 19:01:47 +0330 (IRT)
Received: from cc.iut.ac.ir (localhost.localdomain [127.0.0.1])
	by cc.iut.ac.ir (Postfix) with ESMTP id 658392C8020
	for <linux-lvm@redhat.com.>; Wed,  1 Dec 2004 19:01:46 +0330 (IRT)
From: "Fathianpour Farahnaz" <fathianf@cc.iut.ac.ir>
Date: Wed, 1 Dec 2004 19:01:46 +0330
Message-Id: <20041201152348.M80591@cc.iut.ac.ir>
MIME-Version: 1.0
Subject: [linux-lvm] Please Help me on LVM partitioning
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi, I am new in LVM partitioning, I have a new supermicro with 2 hard disk 
(120GB) and I must install mail server on fedora core 3. So I need to use 
both hards to enlarge my /var and /home.  Would you let me know how should I 
partition my hards.
At the moment I partitioned my first hard (with Disk Druid) 
for /,/boot,/swap and /home and put /var on whole second hard and then I 
changed partition type of /home and /var to physical volume, but I don't 
know what else I should do to be able to enlarge these partitions with LVM 
and Volume Group. 
I realy appreciate your help in this regard.

Regards
F. Fathianpour
Webmaster of IUT

--
IUT WebMail Service at CIS (https://cc.iut.ac.ir/webmail/)
