Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2FJI6Bp011017
	for <linux-lvm@redhat.com>; Thu, 15 Mar 2007 15:18:07 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.172])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2FJHlC1022785
	for <linux-lvm@redhat.com>; Thu, 15 Mar 2007 15:17:48 -0400
Received: by ug-out-1314.google.com with SMTP id x30so431263ugc
	for <linux-lvm@redhat.com>; Thu, 15 Mar 2007 12:17:43 -0700 (PDT)
Message-ID: <45F99BD3.3000204@gmail.com>
Date: Thu, 15 Mar 2007 19:17:39 +0000
From: Will May <will.j.may@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Aftermath of a dead hard disk
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

I recently had a hard disk die on me that was in my LVM group and so had 
to replace it with a new one. When I added the new hard disk into the 
group, I didn't format it first and so LVM still thinks the new hard 
disk (250GB) is the size of the old one (60GB). I'd like to convince LVM 
of the new size. Anyone know how?

I've tried just formatting the hard disk, but that just causes LVM to 
cry that it can't find the pv on the disk.
