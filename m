Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4ELFtO10283
	for <linux-lvm@redhat.com>; Sat, 14 May 2005 17:15:55 -0400
Received: from mailgw.aecom.yu.edu (mailgw.aecom.yu.edu [129.98.1.16])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4ELFsnc009752
	for <linux-lvm@redhat.com>; Sat, 14 May 2005 17:15:54 -0400
Received: from mailvx.aecom.yu.edu (mailvx.aecom.yu.edu [129.98.1.17])
	by mailgw.aecom.yu.edu (8.12.11/8.12.11) with SMTP id j4ELFr4P002466
	for <linux-lvm@redhat.com>; Sat, 14 May 2005 17:15:53 -0400
Received: from post.aecom.yu.edu ([129.98.1.100])
	by mailvx.aecom.yu.edu (SAVSMTP 3.1.1.32) with SMTP id
	M2005051417155309995
	for <linux-lvm@redhat.com>; Sat, 14 May 2005 17:15:53 -0400
Received: from [129.98.90.227] (usseinstein.aecom.yu.edu [129.98.90.227])
	by post.aecom.yu.edu (Postfix) with ESMTP id 6E14A2FC0
	for <linux-lvm@redhat.com>; Sat, 14 May 2005 17:15:53 -0400 (EDT)
Mime-Version: 1.0
Message-Id: <a06210281beac17a8abb2@[129.98.90.227]>
Date: Sat, 14 May 2005 17:18:06 -0400
From: Maurice Volaski <mvolaski@aecom.yu.edu>
Subject: [linux-lvm] disk capacity discrepancy: is it 1000 versus 1024?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I originally had a hardware RAID with fourteen 400 GB drives of 
usable capacity (Hitachi 7K400) . That's 5600 GB altogether. That's 
what both fdisk and df report (filesystem was ext3).

When I instead created an LVM2 physical volume on the device, I get 
just 5.09 TB.

Is LVM eating several hundreds gigabytes of space or is it the case 
that LVM uses terminology in a strict multiply by 1024 fashion versus 
everything else, which is multiplying by 1000. In that case, I guess 
the drives aren't really 400 GBs. :-(

However, it appears that parameters passed to LVM commands are 
interpreted using x1000, not x1024.

other keywords: gigabinarybytes, gibibytes, Gi, terabinarybytes, tebibytes, Ti.
-- 

Maurice Volaski, mvolaski@aecom.yu.edu
Computing Support, Rose F. Kennedy Center
Albert Einstein College of Medicine of Yeshiva University
