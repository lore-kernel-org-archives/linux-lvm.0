From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvextend-lvreduce
Message-Id: <20020425115740.A16336@sistina.com>
References: <E04CF3F88ACBD5119EFE00508BBB2121026DCB00@exch-01.noida.hcltech.com>
MIME-Version: 1.0
In-Reply-To: <E04CF3F88ACBD5119EFE00508BBB2121026DCB00@exch-01.noida.hcltech.com>;
    from cbehera@noida.hcltech.com on Wed, Apr 24, 2002 at 12:48:56PM +0530
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
Date: Thu Apr 25 04:58:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 24, 2002 at 12:48:56PM +0530, Chitaranjan Behera, Noida wrote:
> Hi,
> 
> I tried to do lvextend and then lvreduce (same space) without unmounting the
> file system, bcoz of online read/write operation on that file system. System
> seems slow (almost hanged). So can anybody please tell me whether the SAME
> extended block is reduced by the lvreduce command or not.

If you extend a LV, N extents are added to its former end.
If you reduce it by the very same amount N of extents afterwards the very
same N extents are freed.

> And what could be
> the reason of system hang.

Probably locking caused by the filesystem accesses.
Which version of LVM are you using?

Regards,
Heinz    -- The LVM Guy --


>   
> --
> Regards,
> Chitaranjan
> 91-4510701/02   Ext -3159
> 
> " Make sincerity and innocence as your real strengths !! "
> --
> Disclaimer
> This document is intended for transmission to the named recipient only.  If
> you are not that person, you should note that legal rights reside in this
> document and you are not authorized to access, read, disclose, copy, use or
> otherwise deal with it and any such actions are prohibited and may be
> unlawful. The views expressed in this document are not necessarily those of
> HCL Technologies Ltd. Notice is hereby given that no representation,
> contract or other binding obligation shall be created by this e-mail, which
> must be interpreted accordingly. Any representations, contractual rights or
> obligations shall be separately communicated in writing and signed in the
> original by a duly authorized officer of the relevant company.
> --
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
