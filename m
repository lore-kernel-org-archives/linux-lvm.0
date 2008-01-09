Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m09Ghbvg008199
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 11:43:37 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m09Gh4WI013633
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 11:43:04 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 21E46379AF
	for <linux-lvm@redhat.com>; Wed,  9 Jan 2008 17:43:01 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 06E8D9383
	for <linux-lvm@redhat.com>; Wed,  9 Jan 2008 17:42:57 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id C1pGVrV4+EyB for <linux-lvm@redhat.com>;
	Wed,  9 Jan 2008 17:42:54 +0100 (CET)
Received: from [192.168.10.145] (xdsl-87-79-218-67.netcologne.de
	[87.79.218.67]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Wed,  9 Jan 2008 17:42:54 +0100 (CET)
Message-ID: <4784F989.3030801@wpkg.org>
Date: Wed, 09 Jan 2008 17:42:49 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] can't use LVM2 - "Failed to write physical volume"?
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

It seems to me that for some reason it's not possible to create a 
physical volume on a DRBD device. Below, we can see that running 
"pvcreate" succeeds and than fails, then it succeeds again etc.:

# pvcreate -d -v /dev/drbd0
     Set up physical volume for "/dev/drbd0" with 976544952 available 
sectors
     Zeroing start of device /dev/drbd0
   Physical volume "/dev/drbd0" successfully created

# pvcreate -d -v /dev/drbd0
     Wiping cache of LVM-capable devices
     Set up physical volume for "/dev/drbd0" with 976544952 available 
sectors
     Zeroing start of device /dev/drbd0
   Failed to write physical volume "/dev/drbd0"

# pvcreate -d -v /dev/drbd0
     Set up physical volume for "/dev/drbd0" with 976544952 available 
sectors
     Zeroing start of device /dev/drbd0
   Physical volume "/dev/drbd0" successfully created


Running vgcreate fails:

# vgcreate san2_data /dev/drbd0
   No physical volume label read from /dev/drbd0
   /dev/drbd0 not identified as an existing physical volume
   Unable to add physical volume '/dev/drbd0' to volume group 'san2_data'.



This is the setup used:

encrypted /dev/sdb -> unencrypted /dev/mapper/san2_crypt -> partition 
/dev/mapper/san2_crypt1 -> /dev/drbd0


I can create physical volume on /dev/mapper/san2_crypt2 (no DRBD) just fine.


The machine is running Debian Etch on a 2.6.23.12 kernel.

# lvm version
   LVM version:     2.02.07 (2006-07-17)
   Library version: 1.02.08 (2006-07-17)
   Driver version:  4.11.0


I found a similar post, where DRBD wasn't used:

http://linux.derkeiler.com/Mailing-Lists/Ubuntu/2006-11/msg00414.html


Any clues why this happens?


-- 
Tomasz Chmielewski
http://wpkg.org
