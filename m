Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5K3VQ012316
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 23:31:26 -0400
Received: from alias-2.uta.edu (alias-2.uta.edu [129.107.56.96])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5K3VKXn015905
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 23:31:20 -0400
Received: from 21ens8.uta.edu (21ens8.uta.edu [129.107.21.62])
	by alias-2.uta.edu (8.12.11/8.12.11) with ESMTP id i5K3VERX022357
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 22:31:14 -0500
Subject: Re: [linux-lvm] lvcreate complains and fails
From: Anoop Rajendra <arajendr@cse.uta.edu>
In-Reply-To: <20040619214306.GO6302@agk.surrey.redhat.com>
References: <200406192123.i5JLNqmv007695@cse.uta.edu>
	<20040619214306.GO6302@agk.surrey.redhat.com>
Message-Id: <1087702313.1477.6.camel@Pluto>
Mime-Version: 1.0
Date: Sat, 19 Jun 2004 22:31:53 -0500
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Actually, for some reason a reboot was required.
I didnt touch the kernel or anything. It just seemed to work fine after
a reboot.

Thanks anyway,
Anoop

On Sat, 2004-06-19 at 16:43, Alasdair G Kergon wrote:
> On Sat, Jun 19, 2004 at 04:23:52PM +0000, arajendr@cse.uta.edu wrote:
> > tells me dev mapper is in the kernel.
>  
> > Yet when I run lvcreate it gives me an error saying no /dev/mapper/control.
> There's a script to create it correctly, though it sounds like you did 
> the right thing.
> 
> > One other error it gives me is Incompatible libdevmapper 1.00.17-ioctl, and
> > kernel driver.
> What does 'lvm version' report?
> Should be 3 versions: If it doesn't give the dm kernel driver version, 
> look in the kernel message log for it.
>  
> Alasdair
