Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2TBhCoF010574
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 07:43:13 -0400
Received: from gulfport.carmen.se (gatekeeper.carmen.se [193.12.210.250])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2TBhAuv004987
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 07:43:10 -0400
Received: from postville.carmen.se (postville.carmen.se [192.168.100.38])
	by gulfport.carmen.se (Postfix) with ESMTP id C993EC021
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 13:42:47 +0200 (CEST)
Received: from lilabari.got.jeppesensystems.com
	(lilabari.got.jeppesensystems.com [192.168.98.32])
	by postville.carmen.se (Postfix) with ESMTP id B98E69FB03
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 13:42:47 +0200 (CEST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by lilabari.got.jeppesensystems.com (8.13.1/8.13.1) with ESMTP id
	l2TBglfv012398
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 13:42:47 +0200
Message-ID: <460BA637.9050604@carmen.se>
Date: Thu, 29 Mar 2007 13:42:47 +0200
From: Olle Liljenzin <olle@carmen.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to re-stripe a LV after pvmove?
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

Hello,

How can I rearrange a striped volume after pvmove has been run, so that 
I get back the original structure with the stripes equally distributed 
on PVs?

/Olle
