Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2H5em102531
	for <linux-lvm@redhat.com>; Fri, 17 Mar 2006 00:40:48 -0500
Received: from cheesegrater.eragen.com (mail.eragen.com [66.170.4.35])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2H5eg9l027734
	for <linux-lvm@redhat.com>; Fri, 17 Mar 2006 00:40:42 -0500
Received: from localhost (unknown [127.0.0.1])
	by cheesegrater.eragen.com (Postfix) with ESMTP id 15F0728DE4
	for <linux-lvm@redhat.com>; Fri, 17 Mar 2006 05:41:06 +0000 (UTC)
Received: from cheesegrater.eragen.com ([127.0.0.1])
	by localhost (cheesegrater [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 18330-02 for <linux-lvm@redhat.com>;
	Thu, 16 Mar 2006 23:41:03 -0600 (CST)
Received: from [192.168.1.108] (unknown [192.168.1.108])
	by cheesegrater.eragen.com (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 23:41:03 -0600 (CST)
Message-ID: <441A4BD1.7070107@eragen.com>
Date: Thu, 16 Mar 2006 23:40:33 -0600
From: Chris Black <cblack@eragen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Detecting device growth (SAN environment)
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

Hello all, I have a SAN environment that is working fine but I seem to 
be unable to see new space added to the LUNs via the SAN console. I have 
googled a LOT and even came across this old thread on this list from 
over a year ago:
https://www.redhat.com/archives/linux-lvm/2005-January/msg00080.html

My main problem seems to be that I can not find a way to get the OS to 
see the new size of the LUN, even after rescanning the SCSI bus, running 
fdisk, doing pvscan, etc. I even tried the suggested blockdev --rereadpt 
/dev/sdx command but I got a BLKRRPART: Device or resource busy, even 
tho there is nothing on the device.

Does anyone have any clues on how to get Linux (2.6 kernel, SuSE Linux 
Enterprise Server) to notice that an underlying scsi LUN has changed in 
size?

Thanks in advance,
Chris
