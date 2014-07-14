Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s6EJflNp026760
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2014 15:41:47 -0400
Received: from gscsmtp.wustl.edu (watson.wustl.edu [128.252.233.26])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id s6EJfjYr022213
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2014 15:41:46 -0400
Received: from Matt-Weils-MacBook-Pro.local (unknown [10.0.7.38])
	by gscsmtp.wustl.edu (Postfix) with ESMTPSA id 6344F40096
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2014 14:41:45 -0500 (CDT)
Message-ID: <53C4327E.1020501@genome.wustl.edu>
Date: Mon, 14 Jul 2014 14:41:50 -0500
From: Matt Weil <mweil@genome.wustl.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove taking for ever to complete
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello all,

doing a pvmove from old to new storage and it is taking for ever.

command

pvmove /dev/mpath/gxfer4_1 /dev/mapper/compel1_gxfer1

progress after about two weeks
   /dev/mpath/gxfer4_1: Moved: 42.1%

version
   LVM version:     2.02.74(2)-RHEL5 (2011-01-28)
   Library version: 1.02.55-RHEL5 (2010-11-09)
   Driver version:  4.11.5

The devices are 10TB each but it should not be taking this long.

Any assistance is appreciated.

Thanks

Matt

____
This email message is a private communication. The information transmitted, including attachments, is intended only for the person or entity to which it is addressed and may contain confidential, privileged, and/or proprietary material. Any review, duplication, retransmission, distribution, or other use of, or taking of any action in reliance upon, this information by persons or entities other than the intended recipient is unauthorized by the sender and is prohibited. If you have received this message in error, please contact the sender immediately by return email and delete the original message from all computer systems. Thank you.
