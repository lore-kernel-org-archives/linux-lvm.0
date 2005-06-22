Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5MKniu24246
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 16:49:44 -0400
Received: from omx3.sgi.com (omx3-ext.sgi.com [192.48.171.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5MKngA8022495
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 16:49:42 -0400
Received: from nodin.corp.sgi.com (nodin.corp.sgi.com [192.26.51.193])
	by omx3.sgi.com (8.12.11/8.12.9/linux-outbound_gateway-1.1) with ESMTP
	id j5MLNCg0009586
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 14:23:12 -0700
Received: from [192.26.74.95] (janus.corp.sgi.com [192.26.74.95])
	by nodin.corp.sgi.com (SGI-8.12.5/8.12.10/SGI_generic_relay-1.2) with
	ESMTP id j5MKncbT87084781
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 13:49:39 -0700 (PDT)
Message-ID: <42B9CEE2.5010200@deadhookers.org>
Date: Wed, 22 Jun 2005 13:49:38 -0700
From: Eric Wagar <eric@deadhookers.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] metadata inconsistancy
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

I am trying to create a lv with two pv's of about 750G.  After doing a 
pvcreate, I am able to see both pv's but both are showing:
  Allocatable           NO

Afterwards, I try doing a vgcreate, and there are no errors, though when 
doing a vgdisplay I see no vg's, and doing a pvdisplay shows the pv's as 
not being allocated to any vg.

The history of these drives is that they were in a vg of 1.5T, but I 
removed it so I could learn the lvm commands and configs.  Now, I can't 
get it back together.  I did read in TLDP (and pvcreate man page) that I 
could dd the volume header, but that is not proving any additional progress.

Am I missing some step that would let me progress to recreate the volume?

Thanks
eric
