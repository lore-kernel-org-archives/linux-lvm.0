Received: from o.ww.redhat.com (vpn50-11.rdu.redhat.com [172.16.50.11])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i2VDYCmX010179
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 15:34:12 +0200
Date: Wed, 31 Mar 2004 15:34:12 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] LVM LUNs and scsi reserve/release
Message-ID: <20040331133412.GB29222@redhat.com>
References: <2F75AEE4E86FDE44BF97709D289BAA7C7196EC@vega.voltaire.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2F75AEE4E86FDE44BF97709D289BAA7C7196EC@vega.voltaire.com>
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

On Tue, Mar 30, 2004 at 10:55:19AM +0300, Dan Bar Dov wrote:
> 
> I wonder if LVM LUNs (LVs) have any means of dealing with scsi
> reserve/release commands, and if so how?

No, LVM completely ignores SCSI specific features.

> 
> 
> Dan
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
