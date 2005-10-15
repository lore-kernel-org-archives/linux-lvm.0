Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9FHewV27695
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 13:40:58 -0400
Received: from redweb.harvee.org (dsl093-191-107.nyc2.dsl.speakeasy.net
	[66.93.191.107])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9FHeleD022100
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 13:40:52 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
	by redweb.harvee.org (Postfix) with ESMTP id 960E176D47
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 13:40:46 -0400 (EDT)
Received: from harvee.harvee.org (harvee-xeno.harvee.org [192.168.25.100])
	by redweb.harvee.org (Postfix) with ESMTP id 92B6D76D47
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 13:40:10 -0400 (EDT)
Received: from [192.168.0.30] (unknown [192.168.0.30])
	by harvee.harvee.org (Postfix) with ESMTP id 558D63C03B
	for <linux-lvm@redhat.com>; Sat, 15 Oct 2005 13:40:10 -0400 (EDT)
Message-ID: <43513EFB.9030502@harvee.org>
Date: Sat, 15 Oct 2005 13:40:11 -0400
From: "Eric S. Johansson" <esj@harvee.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] couple questions about metadata checksum errors and
	storage
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

** resend gmane gateway either didn't work or was very slow.  Apologies 
for the duplication if it ever shows up

system: Ubuntu 5.10

first mistake was trying to use Ubuntus installer to set up LVM and raid.
second mistake was trying to use EVMS to set up LVM and raid.

resorting to what works (mdadm and LVM2 commands)I found myself getting 
this error message with every LVM command

  Incorrect metadata area header checksum

I deleted the first five or 10 MB of each disk in the raid set but it 
persists.  Everything seems to operate, storage has been allocated, 
filesystems have been built, everything is detected on reboo and I have 
even resized one of the logical volumes and expanded the disk.

however, what I have read says that this warning message about incorrect 
metadata is something to be concerned about.  My question is, how do I fix?

second, this is probably a "RTFWP" question but how do you determine the 
free space on a physical volume.  For example, if I have two logical 
volumes created and I want to know how much space is left on the 
physical?  (apologies if I got the vocabulary wrong)

--- eric
