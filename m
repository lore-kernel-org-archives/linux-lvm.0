Received: from o.ww.redhat.com (vpn50-11.rdu.redhat.com [172.16.50.11])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i318qMmX004658
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 10:52:23 +0200
Date: Thu, 1 Apr 2004 10:52:23 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] character device creation
Message-ID: <20040401085223.GC29222@redhat.com>
References: <BAY16-DAV26wjCGSzHV0000c6da@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY16-DAV26wjCGSzHV0000c6da@hotmail.com>
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

On Thu, Apr 01, 2004 at 12:26:39PM -0800, sachin wrote:
> Hi
> Can i Create a character device for a logical volume of lvm
> If yes how to create and how lvm driver manage it or supports it

Yes. Have a look at 'man raw'.

> Thanks ,
> Sachin

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
