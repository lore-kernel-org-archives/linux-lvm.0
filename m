Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3OCXiwe014714
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 08:33:44 -0400
Received: from smtp.aic.fr (smtp.aic.fr [195.13.32.109])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3OCXgX9029862
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 08:33:43 -0400
Received: from localhost (postfix07.aic.fr [127.0.0.1])
	by smtp.aic.fr (Postfix) with ESMTP id 9C2BD190806A
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 14:33:36 +0200 (CEST)
Received: from smtp.aic.fr ([127.0.0.1])
	by localhost (postfix07.aic.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UYm5nKFK3qwB for <linux-lvm@redhat.com>;
	Tue, 24 Apr 2007 14:33:36 +0200 (CEST)
Received: from localhost (unknown [195.13.32.101])
	by smtp.aic.fr (Postfix) with ESMTP id 86D021908041
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 14:33:36 +0200 (CEST)
Message-ID: <20070424143336.9lp8booi04c04oss@webmail.aic.fr>
Date: Tue, 24 Apr 2007 14:33:36 +0200
From: jmfaidy@aic.fr
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm over iscsi
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: linux-lvm@redhat.com

Hi,
I asked this question in icsci mailing list, with no answer, so I try here.
I'm using fc6 2.6.20 as target and 2.18fc6-xen as initiator, my goal  
is to export a volume group from the target, in order to be abale to  
make a lvscan on the initiator, but i don't succeed.

  iscsiadm --mode node --targetname iqn.2007-05.fr.aic:jimiscsi  
--portal 10.0.22.133:3260 --login

-> end with no error, but i have nothing in /proc/scsi/scsi and no  
volume are detected by lvscan.

is it possible to export volume group instead of logical ?

Thx for any answer or clue...

JiM

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
