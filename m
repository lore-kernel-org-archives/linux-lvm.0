Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2NGa01q027472
	for <linux-lvm@redhat.com>; Sun, 23 Mar 2008 12:36:00 -0400
Received: from osiris.centershock.net (osiris.centershock.net [84.19.178.252])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2NGZSPf026096
	for <linux-lvm@redhat.com>; Sun, 23 Mar 2008 12:35:29 -0400
Received: from [192.168.0.169] (p4FD37C5A.dip.t-dialin.net [79.211.124.90])
	by osiris.centershock.net (Postfix) with ESMTP id 69F202018124
	for <linux-lvm@redhat.com>; Sun, 23 Mar 2008 17:35:26 +0100 (CET)
Message-Id: <1FB59F48-143C-4EBC-953E-08F6C4C3F259@xgm.de>
From: Florian Lindner <mailinglists@xgm.de>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v919.2)
Date: Sun, 23 Mar 2008 17:35:26 +0100
Subject: [linux-lvm] JBOD/NRAID configuration with LVM
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-lvm@redhat.com

Hello,
I'm the administrator of a file server from a student residential  
accommodation (from Munich, so pardon my English).

The machine is an ordinary PC (currently one HD for system, one for  
data, both paralell ATA). Due to the intendend use storage space is a  
primary issue while data safety is not too important neither is speed.  
Since money is also always low we need to be flexible with how we use  
the harddisks. For example it's unlikely to be possible to buy two or  
more identic harddisk to form a RAID 0.

My idea:

- Create an JBOD/NRAID of a all harddisks (except the system disk)

- The JBOD should be flexible when it comes to removing or adding  
another disk. For example if I want to remove a harddisk I a) unmount  
the JBOD b) say some kind of tool to free the harddisk to remove as  
completely as possible c) remove the disk software and hardware wise.

- If we manage to get our hands on another harddisk it is added to the  
volume. It there are already more than three disk present it replaces  
the smallest one.

- Hot swapping is not important. I don't think it's possible anyway  
due to the desktop PC hardware

- If a disk is broken the data loss should be limited to the data that  
actually is on that disk, the rest of the JBOD should remain  
functional (it is ok if it is not functional before a manual repair run)

How far is this possible with LVM? The distribution is Debian etch.

Thanks,

Florian
