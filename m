Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0LMPfO13649
	for <linux-lvm@redhat.com>; Fri, 21 Jan 2005 17:25:41 -0500
Received: from postfix2-c.free.fr (postfix2-c.free.fr [213.228.0.80])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0LMPd4G032691
	for <linux-lvm@redhat.com>; Fri, 21 Jan 2005 17:25:39 -0500
Received: from postfix3-2.free.fr (postfix3-2.free.fr [213.228.0.169])
	by postfix2-c.free.fr (Postfix) with ESMTP id 423A2A2C2F1
	for <linux-lvm@redhat.com>; Fri, 21 Jan 2005 23:25:39 +0100 (CET)
Received: from eric.placeverte.home
	(lns-vlq-9-lil-82-65-151-242.adsl.proxad.net [82.65.151.242])
	by postfix3-2.free.fr (Postfix) with SMTP id 5242FC1BC
	for <linux-lvm@redhat.com>; Fri, 21 Jan 2005 23:25:35 +0100 (CET)
Date: Fri, 21 Jan 2005 23:25:33 +0100
From: messmate <messmate@free.fr>
Message-ID: <20050121232533.38a267e4@eric.placeverte.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] access files in an ext3 filesystem from lvm
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
To: linux-lvm <linux-lvm@redhat.com>

Hi,
I've 2 distributions, one with LVM/ext3 configured and the second with
only an ext3 filesystem.
How can i acces the files in the LVM/ext3 from distribution 2 ??
LVM/etx3 is as follows:

                                       |-> lv1   
                                       |
pv1,pv2,pv3 -->vg1---|-> lv2
                                       |
                                       |-> lv3

Thanks for your help in advance
mess-mate
