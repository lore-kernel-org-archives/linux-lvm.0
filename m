Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0KNDIO14618
	for <linux-lvm@redhat.com>; Thu, 20 Jan 2005 18:13:18 -0500
Received: from neuralscape.com (synapse.neuralscape.com [198.144.200.82])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0KNDCZ1030019
	for <linux-lvm@redhat.com>; Thu, 20 Jan 2005 18:13:12 -0500
Received: from shaeffer by neuralscape.com with local (Exim 4.12)
	id 1CrlRK-0003X8-00
	for linux-lvm@redhat.com; Thu, 20 Jan 2005 15:10:10 -0800
Date: Thu, 20 Jan 2005 15:10:10 -0800
From: Karen Shaeffer <shaeffer@neuralscape.com>
Subject: Re: [linux-lvm] LVM + SAN Behavior
Message-ID: <20050120231010.GA13560@synapse.neuralscape.com>
References: <s1ee8563.047@kumc-smtpout.kumc.edu>
	<OFF2B16D91.6DB8D9FD-ONC1256F8F.0021A89D-C1256F8F.00235D23@restena.lu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFF2B16D91.6DB8D9FD-ONC1256F8F.0021A89D-C1256F8F.00235D23@restena.lu>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Jan 20, 2005 at 07:26:46AM +0100, gilles.massen@restena.lu wrote:
> 
> Concerning the enlargement of partitions: from what I saw, the kernel does 
> not re-read the partition table easily. Short of rebooting, this can be 
> achieved by starting fdisk (which should reread the partition table on its 
> own) and writing it to the disk.


Hello,

Have you tried running:

blockdev --rereadpt <device>


Thanks,
Karen
-- 
 Karen Shaeffer
 Neuralscape, Palo Alto, Ca. 94306
 shaeffer@neuralscape.com  http://www.neuralscape.com
