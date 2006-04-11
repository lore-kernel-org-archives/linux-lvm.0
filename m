Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3BD8QhE018055
	for <linux-lvm@redhat.com>; Tue, 11 Apr 2006 09:08:26 -0400
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3BD8KRv016276
	for <linux-lvm@redhat.com>; Tue, 11 Apr 2006 09:08:20 -0400
Subject: Re: [linux-lvm] LVM over IP network
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <200604110129.57029.krakrjak@volumehost.net>
References: <1144412972.44365b2c36361@mail.sify.com>
	<00a001c65b62$e7e624a0$64c8a8c0@balefirehome>
	<1144686838.8591.100.camel@localhost.localdomain>
	<200604110129.57029.krakrjak@volumehost.net>
Date: Tue, 11 Apr 2006 09:08:05 -0400
Message-Id: <1144760886.26235.21.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
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
Content-Type: text/plain; charset="us-ascii"
To: Zac Slade <krakrjak@volumehost.net>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2006-04-11 at 01:29 -0500, Zac Slade wrote:
> On Monday 10 April 2006 11:33, Ming Zhang wrote:
> > or put all these disks in one box and let other boxes boot from iscsi
> > and use centralized ip storage.
> This is the most sensible thought.  It's almost like nfs root only a little 
> bit better.  They might need a CD burned that has a kernel and initramfs that 
> loads the kernel and modules then loads their rootfs via iSCSI.

no, u do not need a cd at all. 

http://sourceforge.net/mailarchive/message.php?msg_id=14610082
http://groups.google.com/group/open-iscsi/browse_thread/thread/714c8d822df99285/fae407856ec7e744%23fae407856ec7e744

google it or check those iscsi lists, there are such info available.



> 
> Good idea Ming!
