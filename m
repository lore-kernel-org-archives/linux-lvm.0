Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3LIowWN008359
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 14:50:58 -0400
Received: from igor.wag.caltech.edu (igor.wag.caltech.edu [131.215.26.3])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3LIopmu002521
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 14:50:52 -0400
Received: from welison.com (dell7 [131.215.26.46])
	by igor.wag.caltech.edu (8.9.3/8.9.3) with ESMTP id LAA720716
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 11:50:48 -0700 (PDT)
Message-ID: <44492997.1040402@welison.com>
Date: Fri, 21 Apr 2006 11:51:03 -0700
From: "Welison B. Floriano" <caltech@welison.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to mount a volume group that was not exported
Reply-To: linux-lvm@pbda.us,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hi,

  We had Red Hat Enterprise 3 AS and we tried to upgrade to Red Hat 
Enterprise 4 AS, but it did
not work, so we decide to do a fresh install. The previous OS had one 
Volume Group (home)  with two
PVs:

home /dev/sda1 /dev/sdb1

  We forgot to do a vgexport and now vgscan or vgchange can't find the 
old Volume Group. Is there
a way to mount it? It was LVM1.


Thanks,

Welison.
