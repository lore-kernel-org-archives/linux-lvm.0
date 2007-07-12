Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6C8rsH8002932
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 04:53:54 -0400
Received: from web94412.mail.in2.yahoo.com (web94412.mail.in2.yahoo.com
	[203.104.16.237])
	by mx2.redhat.com (8.13.1/8.13.1) with SMTP id l6C8rlG0029285
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 04:53:47 -0400
Date: Thu, 12 Jul 2007 09:53:40 +0100 (BST)
From: Indraveni <indraveni@yahoo.co.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <489446.83468.qm@web94412.mail.in2.yahoo.com>
Subject: [linux-lvm] how to activate the lvm partition which is not detected
Reply-To: indraveni@yahoo.co.in,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hi all,

 I have two harddisks, each of 80GB, sda1 and sdb1,
sdb1 is added as lvm partition and thus all the data
resides in that lvm parition only. It was working fine
from some months. Suddenly the system showed the
content as readonly content of that lvm partition and
when I tried restarting the system, I am not able to
find my lvm partition. lvdisplay command is showing
output like , No Volume Groups available. fdisk -l
command, is showig the partions of the sda1 only and
sdb1 its showign a message like, no partition table
available for sdb1, and thus its not getting mounted. 
  Could some one please tell me how to recover my data
back. How can I reactivate my lvm partition.

Awaiting for your reply.

Regards
Indraveni



      Get the freedom to save as many mails as you wish. To know how, go to http://help.yahoo.com/l/in/yahoo/mail/yahoomail/tools/tools-08.html
