Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAHHkGV24998
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 12:46:16 -0500
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAHHkF0f031053
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 12:46:15 -0500
Received: from smtp1.ptp.hp.com (smtp.cup.hp.com [15.1.28.250])
	by palrel12.hp.com (Postfix) with ESMTP id AA40540311D
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 09:46:14 -0800 (PST)
Received: from [15.244.57.26] (airwolf.cup.hp.com [15.244.57.26])
	by smtp1.ptp.hp.com (Postfix) with ESMTP id 84DD136BB7F
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 17:46:14 +0000 (UTC)
Message-ID: <437CC1DF.7060306@cup.hp.com>
Date: Thu, 17 Nov 2005 09:46:07 -0800
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] clvmd interface question
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

Hi, I'm looking for some information. I'm interested in learning more 
about the clvmd daemon. I've search and found various pieces of info in 
addition to looking at the code. Specifically I looking to for 
information (a spec) on how one might be able to add a new cluster 
manager plugin if you will (if that is even possible). I know that clvmd 
interfaces with a couple of different cluster managers now but I'd like 
to expland this if possible.

Thanks

-- 
==========

John DeFranco
Hewlett-Packard Company
Availability Clusters Solution Division
19111 Pruneridge Ave, M/S 4101
Cupertino, CA 95014 
phone: 408-447-7543
mailto: john.defranco@hp.com
