Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k13K2A102807
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 15:02:10 -0500
Received: from swlx167.swmed.edu (swlx167.swmed.edu [199.165.152.167])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k13K28bZ023475
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 15:02:08 -0500
Received: from peters.swmed.org ([129.112.118.137])
	by swlx167.swmed.edu with esmtp (Exim 4.44) id 1F5782-0005Gm-4A
	for linux-lvm@redhat.com; Fri, 03 Feb 2006 14:01:58 -0600
Message-ID: <43E3B6B5.5080409@utsouthwestern.edu>
Date: Fri, 03 Feb 2006 14:01:57 -0600
From: Peter Smith <peter.smith@utsouthwestern.edu>
MIME-Version: 1.0
References: <43E24A37.6010801@cup.hp.com>
In-Reply-To: <43E24A37.6010801@cup.hp.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgchange -an question with disconnected disks
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

John DeFranco wrote:

> I have a question regarding the behavior of vgchange -a n on lvm2 when 
> there are disk failures. Specifically the following:
>
> 1. vgchange -a y vg00
> 2. disconnect the disks
> 3. vgchange -a n vg00

Are you doing this in the correct order?  Shouldn't you _de_activate the 
VG _before_ removing the disks?  And besides, shouldn't you remove the 
offending disks from the VG _before_ deactivating and then removing the 
disks physically?  Or at least something equivalent.

1.  vgreduce vg00 <offending disks>
2.  vgchange -a n vg00
3.  disconnect the disks
4.  vgchange -a y vg00

...

Peter
