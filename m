Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2TJbLFZ026424
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 15:37:22 -0400
Received: from hv.sbgnet.com (hv.sbgnet.com [216.141.80.5])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2TJbHXf015580
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 15:37:18 -0400
Received: from [127.0.0.1] ([10.99.99.53])
	by mail.sbgnet.com (8.11.6/8.11.6) with ESMTP id l2TJbGE22891
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 15:37:16 -0400
Message-ID: <460C1570.7030504@sbgnet.com>
Date: Thu, 29 Mar 2007 15:37:20 -0400
From: Gordon <gb-mail@sbgnet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] To fdisk or not to fdisk, that is my question
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


I had a 4TB array on a 32bit system and the kernel could not deal with 
such a large partition so I did not use fdisk

Now I have a 64bit system with basically the same setup (migrating) and 
wonder what is the best practice for fdisk in this situation?

Do I fdisk one large partition  or do I just pvcreate and lvcreate on 
naked drives?
Aside for the oops factor of someone else thinking I forgot to partition 
4TB of space in fdisk and destroying my lvm partitions.  What are the 
pluses and minuses of fdisk and LVM?


Thanks,
Gordon
