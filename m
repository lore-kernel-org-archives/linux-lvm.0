Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m29M5qN2015888
	for <linux-lvm@redhat.com>; Sun, 9 Mar 2008 18:05:52 -0400
Received: from pollux.sshunet.nl (pollux.sshunet.nl [145.97.192.42])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m29M5JFU013539
	for <linux-lvm@redhat.com>; Sun, 9 Mar 2008 18:05:20 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by pollux.sshunet.nl (Postfix) with ESMTP id 23B92580020
	for <linux-lvm@redhat.com>; Sun,  9 Mar 2008 23:05:14 +0100 (CET)
Received: from pollux.sshunet.nl ([127.0.0.1])
	by localhost (pollux.sshunet.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vR4KUYdQmu+q for <linux-lvm@redhat.com>;
	Sun,  9 Mar 2008 23:05:14 +0100 (CET)
Received: from guust.tuxes.nl (15pc197.sshunet.nl [145.97.197.15])
	by pollux.sshunet.nl (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Sun,  9 Mar 2008 23:05:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by guust.tuxes.nl (Postfix) with ESMTP id C801AA8094
	for <linux-lvm@redhat.com>; Sun,  9 Mar 2008 23:05:13 +0100 (CET)
Received: from guust.tuxes.nl ([127.0.0.1])
	by localhost (guust.tuxes.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wuZxR7ivFPtz for <linux-lvm@redhat.com>;
	Sun,  9 Mar 2008 23:05:11 +0100 (CET)
Received: from [192.168.101.4] (15pc197.sshunet.nl [145.97.197.15])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by guust.tuxes.nl (Postfix) with ESMTP id AB317A807E
	for <linux-lvm@redhat.com>; Sun,  9 Mar 2008 23:05:11 +0100 (CET)
Message-ID: <47D45F39.4090502@tuxes.nl>
Date: Sun, 09 Mar 2008 23:05:45 +0100
From: Bas van Schaik <bas@tuxes.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Restore LVM snapshot without creating a full dump to an
 "external" device?
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

Hi all,

When I started to use LVM snapshots, I presumed that it was easy to
restore a system to such a snapshot. As far as I can see now, this
presumption was incorrect... People on the internet write that I should
dump the whole snapshot using dd and then write it over the original
volume. This actually implies that I need another device with at least
the size of the original volume available to dump to. In my situation,
this means that I need about 2 TB free space to recover this snapshot!

Isn't there a more sophisticated way to restore the snapshot than just
dumping it?
 1) create snapshot of /dev/myvolumegroup/myvolume to
/dev/myvolumegroup/mysnapshot
 2) dd if=/dev/myvolumegroup/mysnapshot of=/tmp/mysnapshot.dd
 3) lvremove /dev/myvolumegroup/mysnapshot
 4) dd if=/tmp/mysnapshot.dd of=/dev/myvolumegroup/myvolume

Something like:
 1) lvrevert /dev/myvolumegroup/mysnapshot /dev/myvolumegroup/myvolume

I'd like to hear your thoughts on this, because I think it should be
fairly easy to restore a COW snapshot. Or am I wrong and missing something?

Regards!

  Bas
 
