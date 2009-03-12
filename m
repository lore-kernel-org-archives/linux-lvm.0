Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2C2tP9j003471
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2009 22:55:25 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2C2t6OZ004289
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2009 22:55:06 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Lhb4Y-0001A7-Ij
	for linux-lvm@redhat.com; Thu, 12 Mar 2009 02:55:02 +0000
Received: from 69.196.154.53 ([69.196.154.53])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 02:55:02 +0000
Received: from monnier by 69.196.154.53 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 02:55:02 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Wed, 11 Mar 2009 22:52:27 -0400
Message-ID: <jwvhc1zjvvo.fsf-monnier+gmane.linux.lvm.general@gnu.org>
References: <200903111717.50789.benscott@nwlink.com>
Mime-Version: 1.0
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: moving a partition with a physical volume?
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
To: linux-lvm@redhat.com

> Lets say I have a partition with a physical volume in a volume group. If the 
> group is *not* active, is it safe to move the disk partition to another 
> location on the same disk along with the data? If the device number changed 
> would lvm still be able to cope?

Yes, it's perfectly safe.


        Stefan
