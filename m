Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4MEOhsU015202
	for <linux-lvm@redhat.com>; Mon, 22 May 2006 10:24:43 -0400
Received: from mail.globalsuite.net (mail.globalsuite.net [69.46.103.200])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4MEOfCZ009358
	for <linux-lvm@redhat.com>; Mon, 22 May 2006 10:24:41 -0400
Received: from neuromancer.home.net (unknown [65.205.219.195])
	by mail.globalsuite.net (Symantec Mail Security) with ESMTP id 4344C327
	for <linux-lvm@redhat.com>; Mon, 22 May 2006 08:24:35 -0600 (MDT)
Received: from neuromancer.home.net (neuromancer.home.net [127.0.0.1])
	by neuromancer.home.net (8.13.6/8.13.4) with ESMTP id k4MEOGpc000756
	for <linux-lvm@redhat.com>; Mon, 22 May 2006 07:24:16 -0700
From: Ow Mun Heng <Ow.Mun.Heng@wdc.com>
Date: Mon, 22 May 2006 07:24:15 -0700
Message-Id: <1148307855.28182.4.camel@neuromancer.home.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Removing a Bad disk from LVM w/o a new disk
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Current situation is that I have a bad disk /dev/sdb1 in an existing lvm
partition. (sda1/sda4/sdb1)

I would like to remove it from the VG. (There are no free PE anywhere.
I've maxed it out.)

I've already reduced the existing VG to the size of sda1+sda4
partition. 

I would like to remove entirely the Physical Extents from the volume
group. It doesn't seem like there's a way to do this w/o putting another
disk inside? 

I'm sure that's not true. Doing a 

$vgreduce storage /dev/sdb1
Physical volume "/dev/sdb1" still in use

I have no idea what/who is using it. fuser/lsof etc doesn't show up
anything.

I actually don't much care about the data, I've already copied it
somewhere else. So, instead of just blowing up everything, I rather take
this as a learning experience.


-- 
Ow Mun Heng <Ow.Mun.Heng@wdc.com>
