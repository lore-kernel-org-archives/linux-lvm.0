Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9QFNFr00379
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2004 11:23:15 -0400
Received: from fedex.ist.ucf.edu (fedex.ist.ucf.edu [132.170.193.23])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id i9QFNEau018627
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2004 11:23:14 -0400
Received: from [132.170.193.89] (wks89.ist.ucf.edu [132.170.193.89])
	by fedex.ist.ucf.edu (8.12.11/8.12.8) with ESMTP id i9QFN5AU016200
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2004 11:23:05 -0400
Message-ID: <417E6BD9.1050102@ist.ucf.edu>
Date: Tue, 26 Oct 2004 11:23:05 -0400
From: Judd Tracy <jtracy@ist.ucf.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Large Partition Problems.
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

I have a system with a 3ware 9000-12 card with 12 250GB harddrives 
running fedora core2.  I am wanting to use this setup with lvm2 but am 
having some problems with it.  When I use the entire device /dev/sdb I 
can setup up the entire array ~2.3TB but when I try to partition the 
array ( I really need to) I can only get a maximum of ~230GB partition 
and the rest of the space is unusable.  Is there anyone out there that 
has seen this problem or know how to fix it.  Thanks

Judd Tracy
jtracy@ist.ucf.edu
