Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0OHL9dJ005361
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2008 12:21:09 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0OHKZx0012621
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2008 12:20:35 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id E3317486C0
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2008 18:20:29 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 63466931B
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2008 18:20:28 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id rOGIEpFs6Ao8 for <linux-lvm@redhat.com>;
	Thu, 24 Jan 2008 18:20:26 +0100 (CET)
Received: from [192.168.10.145] (koln-4d0b0172.pool.mediaWays.net
	[77.11.1.114]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2008 18:20:26 +0100 (CET)
Message-ID: <4798C8D9.6020506@wpkg.org>
Date: Thu, 24 Jan 2008 18:20:25 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] is LVM cluster-aware?
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

Is LVM cluster-aware? Of course it's not, but... Will I loose data if I 
have a LVM physical volume replicated on two machines with DRBD, and I 
want to access two separate logical volumes on different machines?


Machine_1
          \            /--Logical_volume_1
           DRBD-LVM2-PV
          /            \--Logical_volume_2
Machine_2


On Machine_1 I only want to read/write to Logical_volume_1.
On Machine_2 I only want to read/write to Logical_volume_2.

I don't want to add/remove/rename/resize/etc. any volumes - just access 
them on separate machines.


Perhaps the answer is: yes, you will loose your data, but I wanted to be 
sure ;)

Are there any workarounds to that (with just two volumes it's simple - 
don't use LVM; but let's suppose there are many logical volumes)?


-- 
Tomasz Chmielewski
http://wpkg.org
