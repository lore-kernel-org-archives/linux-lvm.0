Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m09DauQ8016069
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 08:36:56 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m09DaNq7015702
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 08:36:23 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 7F5DF604B2
	for <linux-lvm@redhat.com>; Wed,  9 Jan 2008 14:36:19 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id B8B689383
	for <linux-lvm@redhat.com>; Wed,  9 Jan 2008 14:36:15 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id 2Msyia7gwb65 for <linux-lvm@redhat.com>;
	Wed,  9 Jan 2008 14:36:13 +0100 (CET)
Received: from [192.168.10.145] (xdsl-87-79-218-67.netcologne.de
	[87.79.218.67]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Wed,  9 Jan 2008 14:36:13 +0100 (CET)
Message-ID: <4784CDCC.6000809@wpkg.org>
Date: Wed, 09 Jan 2008 14:36:12 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] fdisk and lvs size differences
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

Let's say I have a 500GB logical volume:

# lvs | grep san2_data
   san2_data                  san1 -wi-a- 500.00G


fdisk will report a bigger number:

# fdisk -l /dev/san1/san2_data

Disk /dev/san1/san2_data: 536.8 GB, 536870912000 bytes



Now, if fdisk -l would report 100 GB for some partition/disk/volume, a 
volume of which size should I create with "lvcreate" when I want to copy 
data from that partition/disk/volume to a new logical volume?

I wouldn't like to waste several gigabytes of space (this would happen 
if I create a 100G volume with lvcreate), perhaps there is some magic 
formula?



-- 
Tomasz Chmielewski
http://wpkg.org
