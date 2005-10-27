Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9R8agV26844
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2005 04:36:42 -0400
Received: from feel.to (sv.digitalhouse.co.jp [211.10.15.172])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9R8aepn019234
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2005 04:36:40 -0400
Received: from [192.168.0.12] (172.pool5.dsltokyo.att.ne.jp [165.76.172.172])
	by feel.to (8.11.6/3.7W/POP-auth(00031322)) with ESMTP id
	j9R8aY616336
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2005 17:36:34 +0900
Message-ID: <43609147.7090205@snow.email.ne.jp>
Date: Thu, 27 Oct 2005 17:35:19 +0900
From: Mark Sargent <powderkeg@snow.email.ne.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Resizing LVM Revisited
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

Hi All,

to resize a LV in CentOS4.0, I had to use the 1st install CD and Linux 
Rescue. I then had to umount /mnt/sysimage/dev, /mnt/sysimage/proc, 
/mnt/sysimage/boot, /mnt/sysimage/sys before I could umount 
/mnt/sysimage. After doing this, I lose the commands, vgscan, lvscan and 
resize2fs. Why is this, and how can I get around it.? Cheers.

Mark Sargent.
