Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i5JLh6j2029370
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 22:43:06 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BbncA-0005fp-9s
	for linux-lvm@redhat.com; Sat, 19 Jun 2004 22:43:06 +0100
Date: Sat, 19 Jun 2004 22:43:06 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvcreate complains and fails
Message-ID: <20040619214306.GO6302@agk.surrey.redhat.com>
References: <200406192123.i5JLNqmv007695@cse.uta.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200406192123.i5JLNqmv007695@cse.uta.edu>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Jun 19, 2004 at 04:23:52PM +0000, arajendr@cse.uta.edu wrote:
> tells me dev mapper is in the kernel.
 
> Yet when I run lvcreate it gives me an error saying no /dev/mapper/control.
There's a script to create it correctly, though it sounds like you did 
the right thing.

> One other error it gives me is Incompatible libdevmapper 1.00.17-ioctl, and
> kernel driver.
What does 'lvm version' report?
Should be 3 versions: If it doesn't give the dm kernel driver version, 
look in the kernel message log for it.
 
Alasdair
-- 
agk@redhat.com
