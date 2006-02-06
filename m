Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k16M4h0B001193
	for <linux-lvm@redhat.com>; Mon, 6 Feb 2006 17:04:43 -0500
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <43E75C4E.4080805@mid.email-server.info>
References: <43E75C4E.4080805@mid.email-server.info>
Message-Id: <433283643dc4f5ced7aa55f173d07eb0@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Mirror - How To Create?
Date: Mon, 6 Feb 2006 16:05:12 -0600
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

1) grab the latest device-mapper and LVM2 sources from cvs, compile, 
and install
2) grab kernel patches (http://www.brassow.com/mirroring/), compile, 
install, reboot
3) be aware that mirroring still has issues (doesn't handle log device 
failure yet) and that it requires more testing before being put into 
production.

  brassow

On Feb 6, 2006, at 8:25 AM, Alexander Skwar wrote:

> Hello!
>
> How do I setup a mirror of a VG or LV on Linux 2.6.15 with
> DM_MIRROR loaded and lvm2?
>
> Thanks,
>
> Alexander Skwar
> -- 
> You have all eternity to be cautious in when you're dead.
> 		-- Lois Platford
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
