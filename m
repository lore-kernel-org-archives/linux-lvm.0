Return-Path: <root@srv.sistina.com>
Date: Fri, 9 Feb 2001 00:10:11 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] fschk & LVM
Message-ID: <20010209001011.E19887@srv.sistina.com>
References: <F77hOQmIpgVCt3hqAde000059ff@hotmail.com>
Mime-Version: 1.0
In-Reply-To: <F77hOQmIpgVCt3hqAde000059ff@hotmail.com>; from gene_yee@hotmail.com on Thu, Feb 08, 2001 at 02:37:42PM -0800
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

On Thu, Feb 08, 2001 at 02:37:42PM -0800, hail narcissus wrote:
> 
> First of all, I live in California, home of the rolling blackouts.  :)

:-)

> 
> I was wondering what LVM does for 'fschk'.

LVM knows nothing about file system checks because it is a block device layer
entity just supporting io to blocks.

> Can I run it on my volume group 
> or is this considered a pretty bad thing?

You can't access *the* VG directly anyway outside the scope of the LVM tools.
So you can't for eg. not do a fsck on a VG.

> If not, is there something that 
> LVM uses in it's place?

Yes, LVM has a VGDA (Volume Group Descriptor Area; that's the metadata LVM
stores on every device it uses) consistency checker called vgck(8).

Pleas have a look at "man lvm" in order to get an overview of LVM
and pointers to all of its tools.

> 
> Thanks.
> _________________________________________________________________
> Get your FREE download of MSN Explorer at http://explorer.msn.com
> 
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
