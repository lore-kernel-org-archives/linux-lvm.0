Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5K3Pf011721
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 23:25:41 -0400
Received: from alias-2.uta.edu (alias-2.uta.edu [129.107.56.96])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5K3Pee1020115
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 23:25:40 -0400
Received: from 21ens8.uta.edu (21ens8.uta.edu [129.107.21.62])
	by alias-2.uta.edu (8.12.11/8.12.11) with ESMTP id i5K3PYYQ020361
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 22:25:34 -0500
Subject: Re: [linux-lvm] lvcreate complains and fails
From: Anoop Rajendra <arajendr@cse.uta.edu>
In-Reply-To: <20040619214306.GO6302@agk.surrey.redhat.com>
References: <200406192123.i5JLNqmv007695@cse.uta.edu>
	<20040619214306.GO6302@agk.surrey.redhat.com>
Message-Id: <1087701972.1477.4.camel@Pluto>
Mime-Version: 1.0
Date: Sat, 19 Jun 2004 22:26:13 -0500
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
lvm version gives me 2.00.16
Library version is 1.00.17-ioctl
And the dm_mod driver gives me 4.1.0. This last one is from the kernel
logs.. not from when I run lvm version. When I run lvm version it still
says /dev/mapper/control not found.

> Should be 3 versions: If it doesn't give the dm kernel driver version, 
> look in the kernel message log for it.
>  
> Alasdair

Anoop
