Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m04GFwSa026788
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 11:15:58 -0500
Received: from mailgw.soe.ucsc.edu (mailgw.cse.ucsc.edu [128.114.48.9])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m04GFRup013321
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 11:15:27 -0500
Received: from CBSE-Powerbook-Pinocchio.local (dsl-63-249-88-71.cruzio.com
	[63.249.88.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailgw.soe.ucsc.edu (Spam Firewall) with ESMTP id 29BB6422F6A
	for <linux-lvm@redhat.com>; Fri,  4 Jan 2008 08:15:27 -0800 (PST)
Message-ID: <477E5B9E.1030605@soe.ucsc.edu>
Date: Fri, 04 Jan 2008 08:15:26 -0800
From: Erich Weiler <weiler@soe.ucsc.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to 'copy' a volume?
References: <477D7E55.3050003@soe.ucsc.edu> <477DEB7B.7050100@gmail.com>
In-Reply-To: <477DEB7B.7050100@gmail.com>
Content-Transfer-Encoding: 7bit
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

David Robinson wrote:
> I find 'dd' is the simplest way of doing this. Unmount the volume, 
> create a new logical volume of equal or greater size, then 'dd' from one 
> to the other:
> 
> lvcreate -L 500G -n clone volgroup00
> dd if=/dev/volgroup00/original of=/dev/volgroup/clone

Hmmm...  I think it didn't work as expected.  I brought down the VM and 
made sure that no LVM volumes were mounted, then:

# lvcreate -L 500G -n clone volgroup00
# dd if=/dev/volgroup00/original of=/dev/volgroup00/clone

The machine then had a kernel panic (I think).  I'm remote so I'm not 
sure, but I'll be going in soon to check on it.  Not a critical system 
so no big deal.  I'll let everyone one what I see at the console.

-erich
