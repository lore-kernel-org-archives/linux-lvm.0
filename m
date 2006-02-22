Received: from o.ww.redhat.com (vpn-4-2.stuttgart.redhat.com [10.32.4.2])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	k1M8n3Cb004386
	for <linux-lvm@redhat.com>; Wed, 22 Feb 2006 09:49:03 +0100
Date: Wed, 22 Feb 2006 09:49:02 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Volume Groups and Clusters
Message-ID: <20060222084902.GB23655@redhat.com>
References: <BD8C22BB-D4AF-4117-A615-D67AAD9E81F3@kivasystems.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BD8C22BB-D4AF-4117-A615-D67AAD9E81F3@kivasystems.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Feb 21, 2006 at 04:22:10PM -0500, Joshua ChaitinPollak wrote:
> Hello, I found this mention of sharing Volume Groups across Clusters  
> on the LVM howto:
> 
> http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html
> 
> Am I right in assuming that this means you can have a single volume  
> group active on multiple nodes in a cluster, provided that you doing  
> mount the same logical volume on more than one node at a time?

Yes, you assume right *but* you need a cluster filesystem (eg, GFS)
as well to be able to mount shared logical volumes on multiple nodes
at once or you mess up the data.

> 
> Thanks,
> 
> Josh
> 
> -- 
> Joshua ChaitinPollak
> Software Engineer
> Kiva Systems
> 
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
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
