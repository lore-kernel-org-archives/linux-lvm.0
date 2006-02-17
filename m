Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1HE9Y102254
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2006 09:09:34 -0500
Received: from mnementh.dragonhold.org (mnementh.dragonhold.org
	[80.229.192.21])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1HE9Uge002926
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2006 09:09:31 -0500
Received: from rauxon.dragonhold.org ([80.229.192.29])
	by mnementh.dragonhold.org with esmtp (Exim 4.50) id 1FA6IX-0006Ey-15
	for linux-lvm@redhat.com; Fri, 17 Feb 2006 14:09:25 +0000
Message-ID: <43F5D9A6.5000008@dragonhold.org>
Date: Fri, 17 Feb 2006 14:11:50 +0000
From: Graham Wood <gwood@dragonhold.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Booting into LVM
References: <20060217140424.2C07812EC7@bluewhale.planbit.co.uk>
In-Reply-To: <20060217140424.2C07812EC7@bluewhale.planbit.co.uk>
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

Roger Lucas wrote:
> My guess is that LVM isn't being loaded/started/configured correctly at boot
> time or that there is some problem with "/dev"...
>
> Can anyone shed any light on this?
>   
I believe that 2.6.14 is after devfs stopped being supported, so you're 
going to have to go with udev instead - which also means that mkinitrd 
isn't going to work either.  (I think there's lvm2 compatability issues 
as well, but I just went for Sid instead of trying to get sarge working 
with a new kernel)

If you google for 'debian sarge udev' there are quite a few pages that 
give details about what needs to be done - although they may not be 
exactly what you're after...

If that isn't the answer then I'm sure we can help you work through it :)
