Return-Path: <root@srv.sistina.com>
Date: Mon, 23 Apr 2001 10:21:45 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] What have snapshots got to do with LVM ?
Message-ID: <20010423102145.C27367@sistina.com>
References: <20010422130924.A10390@66bassett.freeserve.co.uk>
Mime-Version: 1.0
In-Reply-To: <20010422130924.A10390@66bassett.freeserve.co.uk>; from thornber@btconnect.com on Sun, Apr 22, 2001 at 01:09:24PM +0100
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Apr 22, 2001 at 01:09:24PM +0100, Joe Thornber wrote:
> Just a random Sunday morning thought:
> 
> Why don't we split snapshots off into their own driver so we can
> snapshot any block device, putting the COW tables on any other block
> device ?  

Any other block device devides into PE similar allocation units carrying their
own COW exception table at the beginning?

> 
> We would need to add a per device hook like 'make_request' to the kernel
> (rather than per driver).
> 
> I think it would simplify both LVM and the snapshot code (which at the
> moment knows too much about physical extents etc.).

It would beed to know something similar along the line I pointed to above
anyway.

> 
> 
> - Joe
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
