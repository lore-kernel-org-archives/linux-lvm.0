Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2F1THY27386
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2005 20:29:17 -0500
Received: from sif.nh.is (sif.nh.is [81.15.112.68])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2F1TAe7016093
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2005 20:29:11 -0500
Received: from thor.nh.is (thor.nh.is [81.15.112.69])
	by sif.nh.is (Postfix) with ESMTP id 12B7D1CD2CA
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2005 01:28:49 +0000 (GMT)
Received: from [192.168.2.2] (britney.gella.is [81.15.120.92])
	by thor.nh.is (Postfix) with ESMTP id 2BD9061EB
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2005 01:29:11 +0000 (GMT)
Message-ID: <42363A43.9060205@biti.is>
Date: Tue, 15 Mar 2005 01:28:35 +0000
From: =?ISO-8859-1?Q?Andri_=D3skarsson?= <andri@biti.is>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Disk crash, lost volume group, cant remove lost disk
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

I was adding a disk to my volume group and after adding it, extending 
the volume and logical groups I was going to resize my ext3 fs but had 
to do a fsck first (which was good).

One of my drives totally dies on me. After that I can't recover my 
volume group.

Is there any way of removing a physical volume from a volume group by uuid?

vgcfgrestore fails, vgscan returns alot of missing uuids... Been 
Google'ing for hours and no answers yet.

Not on the list but if you have any ideas, it would be much appriciated.

Regards,
Andri
