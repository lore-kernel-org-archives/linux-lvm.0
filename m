Received: from o.ww.redhat.com (vpn50-9.rdu.redhat.com [172.16.50.9])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i3QMTLNv016433
	for <linux-lvm@redhat.com>; Tue, 27 Apr 2004 00:29:21 +0200
Date: Tue, 27 Apr 2004 00:29:21 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] About extending partiton with lvm+ext3
Message-ID: <20040426222921.GB16292@redhat.com>
References: <200404261903.i3QJ3HTk030443@smtp.doruk.net.tr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200404261903.i3QJ3HTk030443@smtp.doruk.net.tr>
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

On Mon, Apr 26, 2004 at 09:59:54PM +0300, Vahric MUHTARYAN wrote:
> Hi Everybody , 
> 
> I'm reading lvm-how to and I wonder those any tools like e2fsadm ,
> ext2resize ?!! in Redhat ... Because I want to exten ext3 
> 
> Does command for only ext2 ?! 

Yes.

> 
> # export E2FSADM_RESIZE_CMD=ext2resize
> # e2fsadm /dev/ops/batch -L+500M
> 
> Thanks Everybody ... 
> Vahric 
> 
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
