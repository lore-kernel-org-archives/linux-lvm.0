Return-Path: <root@srv.sistina.com>
Date: Fri, 9 Feb 2001 11:21:55 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] questions
Message-ID: <20010209112155.C21300@srv.sistina.com>
References: <20010209003003.B29707@vestdata.no> <200102090005.f1905bc08799@webber.adilger.net> <20010209093404.B21158@caldera.de>
Mime-Version: 1.0
In-Reply-To: <20010209093404.B21158@caldera.de>; from hch@caldera.de on Fri, Feb 09, 2001 at 09:34:05AM +0100
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

On Fri, Feb 09, 2001 at 09:34:05AM +0100, Christoph Hellwig wrote:
> On Thu, Feb 08, 2001 at 05:05:36PM -0700, Andreas Dilger wrote:
> > Change all of the code paths in the kernel that assume block size is 512
> > bytes...
> 
> IIRC some S/390 devices already use 4K block size.

Yes. They have so called DASD drives which are 4K hard sectored.

Anyway. if you change the BLOCK_SIZE definition in lvm.h from 1 to 4k
you can build LVs larger than 2TB (or even 4TB which is the default with the
1k block size used by LVM today).
You can't go beyond PAGE_SIZE though because a whole pile of code in
the kernel doesn't support that.
That means that you could even go to 8k block size on machines supporting
that page size.
Remember: you loose comapatibility with 4k page sized systems in this case.

> 
> 	Christoph
> 
> -- 
> Of course it doesn't work. We've performed a software upgrade.
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
