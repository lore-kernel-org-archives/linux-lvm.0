Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2U7bGO10236
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2005 02:37:16 -0500
Received: from mrp.swissptt.ch (outmail2.swisscom.com [138.190.3.29])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2U7b8Bs000767
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2005 02:37:09 -0500
Received: from mwdsp001.swissptt.ch (mwdsp001.swissptt.ch [10.221.40.203])
	by mrp.swissptt.ch with ESMTP id j2U7b7vL017170
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2005 09:37:07 +0200 (MEST)
Received: from mwdsp001 (localhost [127.0.0.1])
	by mwdsp001.swissptt.ch (8.12.11/8.12.11) with SMTP id j2U7b6Wo009763
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2005 09:37:06 +0200
Date: Wed, 30 Mar 2005 09:37:06 +0200
From: Chris Osicki <osk@admin.swisscom-mobile.ch>
Message-ID: <20050330093706.608e70ae@mwdsp001>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Q: vgscan and RAID1
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



Hi

I'm using LVM1 (RedHat AS 3, kernel 2.4.21-27.ELsmp) on top of a RAID1
array. I was wondering whether vgscan will _always_ pick-up the md
device and not one of the real block devices forming the RAID1?
Could anyone please comment on this?

Thanks for your time.

Regards,
Chris
