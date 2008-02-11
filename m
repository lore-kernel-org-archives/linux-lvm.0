Received: from [192.168.1.101] (vpn-248-139.boston.redhat.com [10.13.248.139])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1BEnVAn016771
	for <linux-lvm@redhat.com>; Mon, 11 Feb 2008 09:49:32 -0500
Message-Id: <4078129D-6D0E-4879-B909-2BE67695EC85@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <fe11eda90802080606m1d35da7dv755b7a4331681002@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v915)
Subject: Re: [linux-lvm] Disk dying and LVM2
Date: Mon, 11 Feb 2008 08:49:31 -0600
References: <fe11eda90802080606m1d35da7dv755b7a4331681002@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

I haven't ever tried moving a root partition, but it should be possible.

pvmove will ignore the errors it encounters and "do the best it can"  
to transfer all data.  If it can't read a certain sector, that will be  
missing from the move.

  brassow

On Feb 8, 2008, at 8:06 AM, Martin Sarsale wrote:

> Guys,
>
> I have a volume made up by two SATA disks, one 80g other 250g. The 80g
> is dying and I'm about to replace it.
> The volume is mounted as the root fs.
>
>
> This is my plan, can you tell me if I'm on the right track?
>
> 1) empty at least 80g in the volume
> 2) reboot, mount readonly and resize the reiserfs to 80gb less than
> current (this is, to 250g)
> 3) pvmove /dev/old_disk
> 4) reboot
> 5) take the old disk out
>
> While the system boots and works more-or-less, when trying to open
> some files I get input/output errors: what will happen when pvmove
> tries to move the sector containing this file? After the pvmove the
> system shouldn't be in a worse condition that it's now, right?
>
> thanks!
>
> -- 
> Martin Sarsale - martin@malditainternet.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
