Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p51EDuPF032279
	for <linux-lvm@redhat.com>; Wed, 1 Jun 2011 10:13:56 -0400
Received: from agslnx2.affinitygs.com (ns6.affinitygs.com [69.84.79.108] (may
	be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p51EDqVU028703
	for <linux-lvm@redhat.com>; Wed, 1 Jun 2011 10:13:54 -0400
Received: from [10.1.10.82] (bisleglnx2.affinitygs.com.10.1.10.in-addr.arpa
	[10.1.10.2] (may be forged))
	by agslnx2.affinitygs.com (8.14.3/8.14.3) with ESMTP id p51EUnto009485
	for <linux-lvm@redhat.com>; Wed, 1 Jun 2011 09:30:49 -0500
Message-ID: <4DE64912.70506@affinitygs.com>
Date: Wed, 01 Jun 2011 09:13:38 -0500
From: Anthony Nelson <anthonyn@affinitygs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvscan is not recognizing physical volumes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

We have a system that pvscan is not recognizing the physical volumes 
which is preventing it from cleanly booting. The linux kernel images are 
on the lvm partitions. The partitions correctly show as LVM partitions 
when doing an fdisk -l, but the pvscan says "No matching physical volume 
found".

I was suggested to try doing a vgscan -vvvv and the only thing that 
looked odd was a message saying "No label detected" prior to closing the 
disk.

Some of the steps I have gone through and documentation of this issue 
can be found on the serverfault question I opened yesterday. You can see 
that here: 
http://serverfault.com/questions/275679/rescue-disk-is-unable-to-see-the-lvm-physical-volumes

Thanks,
Anthony

-- 
Anthony Nelson
Affinity Global Solutions
701.223.3565 Ext: 13
