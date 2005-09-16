Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8HEBgV20462
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 10:11:42 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8HEBb1a017995
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 10:11:37 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1EGdOn-0002wV-GM
	for linux-lvm@redhat.com; Sat, 17 Sep 2005 16:10:37 +0200
Received: from ip68-224-126-226.lv.lv.cox.net ([68.224.126.226])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 16:10:37 +0200
Received: from m2ca by ip68-224-126-226.lv.lv.cox.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 16:10:37 +0200
From: hacim llih <m2ca@boxpop.com>
Date: Fri, 16 Sep 2005 13:39:55 -0700
Message-ID: <dgfait$4uc$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] fedoraCore4 on ext3/lvm; suse9.3pro on ext3 fstab probs
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

hello all.. just found the list gladly.. [#lvm on freenode irc NOT 4 
endusers community support obviously lol.. bit spoiled to #fedora 
community ;]]

have recently fell in love with suse9.3pro [soon to switch to its OSS 
sister opensuse stable release] and want to cautiously switch to it for 
my main workstation personal / biz os..

sadly ive spent last 2 wks attempting to get s93pro to mount my fc4' 
hda2 partition on /data1 via fstab upon boot?..

fc4 boots see and mount s93pro's partition without any complaints..

the the reverse has been quite the challenge.. have had few gurus try 
several syntax attempts in s93pro's fstab.. all to no avail..

some manual mount attempts imply with no output that it works.. but 
konqueror still sees nada in /data1 folder fstab points to?..

so.. howto get fc4's ext3 on lvm on my main 80g hdd master.. to be seen 
/ mounted on my 8g slaved hdd running s93pro on ext3 ?

thanks thanks for any / all feedback chums..
