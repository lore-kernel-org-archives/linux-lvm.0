Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3R7Exv21442
	for <linux-lvm@redhat.com>; Tue, 27 Apr 2004 03:14:59 -0400
Received: from smtp.doruk.net.tr (smtp.doruk.net.tr [212.58.5.248])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3R7EvKG026023
	for <linux-lvm@redhat.com>; Tue, 27 Apr 2004 03:14:57 -0400
Received: from VAHOXP (vahric.doruk.net.tr [212.58.13.17])
	by smtp.doruk.net.tr (8.12.8/8.12.8) with ESMTP id i3R7Ko0c016764
	for <linux-lvm@redhat.com>; Tue, 27 Apr 2004 10:20:50 +0300
Message-Id: <200404270720.i3R7Ko0c016764@smtp.doruk.net.tr>
From: "Vahric MUHTARYAN" <vahric@doruk.net.tr>
Date: Tue, 27 Apr 2004 10:17:22 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Extending LVM and SomeQuestion .. 
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
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi Everybody , 

I created Volume Group and I added 2 disk into VG. That's ok problem is; 

I checked Howto http://tldp.org/HOWTO/LVM-HOWTO/recipeadddisk.html 

it's using only vgextend ( not lvextend ) to extend size of Volume Group and
file system ?! Does it true ?! Do I have to use lvextend ?! don't I ?! 

and 

it's look like ext3 not good choise for resizing filesystem because ext2,
ReiserFS , xfs , jfs have more tools for extending ?! 




Best Regards ..
Vahric MUHTARYAN 
