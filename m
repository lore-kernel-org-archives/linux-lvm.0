Received: from o.ww.redhat.com (vpn50-50.rdu.redhat.com [172.16.50.50])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i46B3Gt1009835
	for <linux-lvm@redhat.com>; Thu, 6 May 2004 13:03:17 +0200
Date: Thu, 6 May 2004 13:03:16 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] LVM upgrade from 1.0.5 to 2.0
Message-ID: <20040506110316.GB1719@redhat.com>
References: <OFEDF86624.B504213B-ON85256E8B.00614708-85256E8B.0061DF99@wiley.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFEDF86624.B504213B-ON85256E8B.00614708-85256E8B.0061DF99@wiley.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Wed, May 05, 2004 at 01:49:00PM -0400, CZachary@wiley.com wrote:
> Hello,
> 
> I would like to update my lvm on my linux server from 1.0.5 to version 
> 2.0.0.  I am running Fedora Core 1 with kernel version: 
> linux-2.4.22-1.2188.nptl.
> 
> What steps do I need to take to install this correctly without damaging 
> the LVM?

Update to Fedora Core 2 (which has Linux 2.6 with device-mapper and LVM2) and
it will recognize your VG(s) your created with LVM1 under FC1.

> 
> Thanks
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
