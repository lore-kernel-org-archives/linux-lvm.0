Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8LFlAr06274
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 11:47:10 -0400
Received: from mail.cisko.org (zibbe@as1-1-6.b.bonet.se [194.236.143.15])
	by mx3.redhat.com (8.12.11/8.12.10) with SMTP id i8LFl3W7006508
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 11:47:03 -0400
Message-ID: <41504CEF.8090508@cisko.org>
Date: Tue, 21 Sep 2004 17:46:55 +0200
From: Sebastian Hyrwall <zibbe@cisko.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Hello. About a bug in lvm2
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hey.

Im not sure but i may have found a bug in the lvm2 userspace-tools. Im 
using gentoo right now and right now
lvm2 cant "see" some harddrives.

I first discovered the problem when i changed from 2.4 -> 2.6. In 2.6 it 
didnt find all my discs. Later on i saw that when i did
"pvcreate /dev/hdd1" (tried the devfs-link also /dev/ide/....) it 
reported that the device couldnt be found.
There isnt anything wrong with the hd or anything. It shows up in 
cfdisk/fdisk and i can use it as a normal hd (not in an lvm).

This occurs for 2 of my disks. hde and hdd. I cant find any difference 
between them and the other drives. They are all the same size.


Unfortunently i cant provide any more information because i didnt think 
about mailing this to you until after i went back to 2.4.


Sincerely, Sebastian Hyrwall
