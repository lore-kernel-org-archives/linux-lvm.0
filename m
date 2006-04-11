Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3B6U9KO008665
	for <linux-lvm@redhat.com>; Tue, 11 Apr 2006 02:30:09 -0400
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3B6U3Gt022880
	for <linux-lvm@redhat.com>; Tue, 11 Apr 2006 02:30:03 -0400
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] LVM over IP network
Date: Tue, 11 Apr 2006 01:29:56 -0500
References: <1144412972.44365b2c36361@mail.sify.com>
	<00a001c65b62$e7e624a0$64c8a8c0@balefirehome>
	<1144686838.8591.100.camel@localhost.localdomain>
In-Reply-To: <1144686838.8591.100.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200604110129.57029.krakrjak@volumehost.net>
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
To: mingz@ele.uri.edu, LVM general discussion and development <linux-lvm@redhat.com>

On Monday 10 April 2006 11:33, Ming Zhang wrote:
> or put all these disks in one box and let other boxes boot from iscsi
> and use centralized ip storage.
This is the most sensible thought.  It's almost like nfs root only a little 
bit better.  They might need a CD burned that has a kernel and initramfs that 
loads the kernel and modules then loads their rootfs via iSCSI.

Good idea Ming!
-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
