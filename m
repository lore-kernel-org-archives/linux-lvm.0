Date: Sat, 29 May 2004 10:20:47 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] [RFC] dmraid design 1.0.3
Message-ID: <20040529082047.GA23953@redhat.com>
References: <20040528151953.GK16912@redhat.com>
	<40B77026.5090302@backtobasicsmgmt.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40B77026.5090302@backtobasicsmgmt.com>
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
Cc: heinzm@redhat.com

On Fri, May 28, 2004 at 10:00:22AM -0700, Kevin P. Fleming wrote:
> Heinz Mauelshagen wrote:
> 
> >o do we need to support partitions on RAID sets ?
> 
> IMHO the answer is no, because dmpartx (or whatever it's called) can do 
> this today. It can use dm tables to slice up any existing block device, 
> whether it's a raw disk or a dm-constructed RAID set.

Good, let's see if we get along w/o it.

> 
> >Open questions:
> >---------------
> >
> >o do we need to prioritize on device-mapper targets for higher RAID levels
> >  (in particular we'ld need RAID5 to support some ATARAID formats) ?
> 
> Personally I would be thrilled to see this work move ahead; in fact, I'd 
> be happy to see this dmraid tool support the Linux MD metadata so I can 
> use dm targets for my MD RAID-1 systems (thereby reducing the amount of 
> code I build into my kernel).

Me too ;)
In fact there's an MD metadata format handler template in my
dmraid code base already.

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
