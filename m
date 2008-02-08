Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m18C5V06024443
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 07:05:31 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m18C4trV027158
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 07:04:59 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 90D1B62871
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2008 13:04:51 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 45E6D9383
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2008 13:04:49 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id k5DVgKeG5t3w for <linux-lvm@redhat.com>;
	Fri,  8 Feb 2008 13:04:47 +0100 (CET)
Received: from [192.168.10.145] (koln-4d0b07e2.pool.mediaWays.net
	[77.11.7.226]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2008 13:04:47 +0100 (CET)
Message-ID: <47AC455E.4030502@wpkg.org>
Date: Fri, 08 Feb 2008 13:04:46 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshots and filesystem freezing
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Some filesystems, like xfs, have a "freeze" feature. There was a 
discussion on lkml about implementing it in ext3, too.

What is the relationship between a filesystem freeze and LVM snapshots?

As far as I understand, snapshotting a filesystem in any random 
timepoint can mean that the snapshotted fs will be inconsistent (i.e., 
may need fsck).
"Freezing" the filesystem will flush all writes to the media, and a 
snapshotted fs should be consistent then (in theory; without an 
interface between filesystem freeze and LVM snapshot it does not 
guarantee that the operation is "atomic").

Am I correct?


-- 
Tomasz Chmielewski
http://blog.wpkg.org
