Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8E0mJV19559
	for <linux-lvm@redhat.com>; Tue, 13 Sep 2005 20:48:19 -0400
Received: from mail.asp.co.id (asp.co.id [202.169.38.67])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8E0mFn2007292
	for <linux-lvm@redhat.com>; Tue, 13 Sep 2005 20:48:16 -0400
Received: from localhost (mail.asp.co.id [127.0.0.1])
	by mail.asp.co.id (Postfix) with ESMTP id A9E2585447D
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2005 07:53:04 +0700 (WIT)
Received: from mail.asp.co.id ([127.0.0.1])
	by localhost (mail.asp.co.id [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 13224-04 for <linux-lvm@redhat.com>;
	Wed, 14 Sep 2005 07:52:59 +0700 (WIT)
Received: from mail.asp.co.id (mail.asp.co.id [127.0.0.1])
	by mail.asp.co.id (Postfix) with ESMTP id 51DDC85444A
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2005 07:52:59 +0700 (WIT)
Message-ID: <1101.192.168.1.111.1126659179.squirrel@192.168.1.111>
Date: Wed, 14 Sep 2005 07:52:59 +0700 (WIT)
From: "Subhan" <subhan@asp.co.id>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Merge logical volume
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

Hello guys,

im new in this LVM, i wanna ask how to merge two logical volume in
lvm..i've read the doc but still dunno how to do it...the doc say to use
lvmerge to merge the logival volume.. but i cant find that command in
mybox...btw im currently using redhat 9... here the list of my
partition...  as we see in this case i want to merge the /usr partition 
to / partition.

Filesystem               Size  Used  Avail Use% Mounted on
/dev/Volume01/LogVol01   3.9G  3.4G  300M  92%  /
/dev/sda1                 76M  9.5M   63M  14%  /boot
/dev/Volume01/LogVol02   9.9G  1.7G  7.7G  18%  /home
none                     567M     0  567M   0%  /dev/shm
/dev/Volume01/LogVol00   2.9G  1.5G  1.3G  55%  /usr


Thanks before for all u guys.....


rgrds,
=sbhn=
