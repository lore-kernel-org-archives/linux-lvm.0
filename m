Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9RFEPr20358
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2004 11:14:25 -0400
Received: from fedex.ist.ucf.edu (fedex.ist.ucf.edu [132.170.193.23])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id i9RFED9u023772
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2004 11:14:19 -0400
Received: from [132.170.193.89] (wks89.ist.ucf.edu [132.170.193.89])
	by fedex.ist.ucf.edu (8.12.11/8.12.8) with ESMTP id i9RFE6XL026417
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2004 11:14:06 -0400
Message-ID: <417FBB3D.6060002@ist.ucf.edu>
Date: Wed, 27 Oct 2004 11:14:05 -0400
From: Judd Tracy <jtracy@ist.ucf.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] High loads when writting to LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I have a system that I am testing out lvm on to get a feeling about 
stability and performance.  Stability right now seems good, but I am a 
little worried about the performance currently I am writing out a large 
file ~1TB using dd if=/dev/zero of=test bs=1M and am noticing the load 
seams extreamly high "5.21, 5.26, 5.17".  Most of the work is being done 
in dd but I also notice that kswapd0 is also working fairly heavily.  Is 
this to be expected with LVM or do i have things setup wrong.  Write 
performance seems to be around 100MB/s on an XFS filesystem.

System:
Opteron 242 1.4Ghz
2 GB RAM
Tyan S2882
3W-9000-12 in raid-5 with one hot spare
12 Seagate 250MB SATA drives
Fedora Core 2
Kernel 2.6.8-1.521

Judd Tracy
jtracy@ist.ucf.edu
