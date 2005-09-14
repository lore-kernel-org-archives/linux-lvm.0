Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8EGpuV30037
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2005 12:51:56 -0400
Received: from mail-webmail.redshift.com (mail-webmail.redshift.com
	[216.228.2.16])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8EGplfL020976
	for <linux-lvm@redhat.com>; Wed, 14 Sep 2005 12:51:49 -0400
Message-ID: <4328551F.7070104@redshift.com>
Date: Wed, 14 Sep 2005 09:51:43 -0700
From: Sam Rogers <srogers@redshift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM disk from another system.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com



I have a disk create with LVM 1 on another system and is in the form of 
a removable disk format. I want to put into another (which is running 
LVM 2) system. How do I recognize it and mount it. Also under LVM 1 we 
could change the group and volume names and so I did with vg00 being the 
group name and lvol01 be the volume name. Under LVM 2 it seems to not 
like that. I will submit another e-mail on the whole subject as well.

I suspect that I may have to do a vgscan or something, but I am not sure 
if it will work on a LVM system scanning a LVM create volume.

Please be detailed in you description of how to do this by giving 
command examples. One liners will most like not help.

Thank you,

    Sam Rogers.
