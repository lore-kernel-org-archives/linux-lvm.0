Received: from [10.32.4.15] (vpn-4-15.str.redhat.com [10.32.4.15])
	by pobox.stuttgart.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l7GHsuHS019862
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 19:54:56 +0200
Message-ID: <46C48F99.1030407@redhat.com>
Date: Thu, 16 Aug 2007 19:55:37 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove problems
References: <1187283837.16162.2.camel@localhost.localdomain>
	<Pine.LNX.4.64.0708162007140.3563@aski.hut.fi>
In-Reply-To: <Pine.LNX.4.64.0708162007140.3563@aski.hut.fi>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Vesa-Pekka Palmu wrote:
> 2.6.22 has a bug in dm-mirror status reporting, and as lvm relies on that 
> to parse the progress of pvmove, it causes pvmove to fail, use 2.6.21 or 
> patch your kernel.

Please use kernel based on upstream version 2.6.22.2, it is fixed there already.

Thanks,
Milan
--
mbroz@redhat.com
