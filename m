Received: from o.ww.redhat.com (vpnuser2.stuttgart.redhat.com [172.16.4.2])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i4BBDMt1024910
	for <linux-lvm@redhat.com>; Tue, 11 May 2004 13:13:22 +0200
Date: Tue, 11 May 2004 13:13:22 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] snapshot with 2.6.5 kernel
Message-ID: <20040511111322.GC31390@redhat.com>
References: <20040503064205.GB1230@synapse.neuralscape.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040503064205.GB1230@synapse.neuralscape.com>
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

On Sun, May 02, 2004 at 11:42:05PM -0700, Karen Shaeffer wrote:
> 
> Hello,
> 
> I am running a patched 2.6.5 kernel and using lvm2. Everything
> looks ok, but the snapshot may be having problems. Else I just
> may be ignorant about how to use the snapshot.
> 
> Here is what I am doing on a generic X86 server. I create a logical
> volume group out of a number of PEs that are properly configured. Then I
> create a logical volume. Then I start to dump a very large tar file
> into the logical volume. As this tar file is inflating the files into
> the logical volume, I then simultaneously create a snapshot volume of
> the recently created logical volume. The very large tar archive that
> was in the process of inflating its contents continues for a while,
> but finally just crashes and hangs at some point.
> 
> Am I missunderstanding how to use snapshot here? Or is this just
> severly broken software? Any advise is appreciated.


You should be able to create a snapshot fine in ythat situation, even though
the creation will happen slow under load.

Can you repeat the case ?
Do you have an oops ? If so, please provide the ksymoops output
for further analysis of the problem.

> 
> Thanks,
> Karen
> -- 
>  Karen Shaeffer
>  Neuralscape, Palo Alto, Ca. 94306
>  shaeffer@neuralscape.com  http://www.neuralscape.com
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
