Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k22AnZ124766
	for <linux-lvm@redhat.com>; Thu, 2 Mar 2006 05:49:35 -0500
Received: from gulfport.carmen.se (gatekeeper.carmen.se [193.12.210.250])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k22AnV98025656
	for <linux-lvm@redhat.com>; Thu, 2 Mar 2006 05:49:31 -0500
Received: from postville.carmen.se (postville.carmen.se [192.168.100.38])
	by gulfport.carmen.se (Postfix) with ESMTP id F3E22C007
	for <linux-lvm@redhat.com>; Thu,  2 Mar 2006 11:49:21 +0100 (CET)
Received: from portmoller.carmen.se (portmoller.carmen.se [192.168.98.14])
	by postville.carmen.se (Postfix) with ESMTP id B3C649FB02
	for <linux-lvm@redhat.com>; Thu,  2 Mar 2006 11:49:21 +0100 (CET)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by portmoller.carmen.se (8.12.11/8.12.11) with ESMTP id k22AnLsd012067
	for <linux-lvm@redhat.com>; Thu, 2 Mar 2006 11:49:21 +0100
Message-ID: <4406CDB1.1050000@carmen.se>
Date: Thu, 02 Mar 2006 11:49:21 +0100
From: Olle Liljenzin <olle@carmen.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] cleaning archive directory
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

Is the directory /etc/lvm/archive supposed to be cleaned up manually or 
should it be done by some tool?

I'm asking since the directory has grown to about 100MB on one of our 
machines.

I find parameters like 'retain_min' and 'retain_days' in the file 
/etc/lvm.conf, which I thought was indicating some kind of automatic 
cleaning tool or process. But I can't find any max values for how many 
files or how many days the files should be stored and it looks like the 
archive files are never deleted.

/Olle
