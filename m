From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Allocation policies
Message-ID: <20020911122807.C26854@sistina.com>
References: <3D7E4135.9EE88518@storix.com>
Mime-Version: 1.0
In-Reply-To: <3D7E4135.9EE88518@storix.com>; from anthony@storix.com on Tue, Sep 10, 2002 at 12:00:05PM -0700
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
Date: Wed Sep 11 05:53:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Sep 10, 2002 at 12:00:05PM -0700, Anthony Johnson wrote:
> I know there are 2 allocation policies, contiguous and next free. Is
> there any information that describes in detail how LVM determines the
> extents to assign to a logical volume with it is created or extended?

It goes by the sequence defined by the internal PV number shown by
"vgdisplay -v". Free space on PVs with lower internal is allocated first.

> For example, if the policy is "contiguous", must the LV contain all
> contiguous extents

Yes.

> or does it use a "best-case" scenario,

No.

> and how would
> that work? Likewise, in the "next free" scenario, is there any weight
> given to contiguous space, does it automatically allocate across PVs,
> etc?

No, there's no weight.
In both cases it does allocate accross PVs.
In the contiguous case, it can't allocate on the same PV unless there's free
space after the already allocated extents.
You need to use pvmove if there's not free space following to move extents
allocated to other LVs away.

> 
> Thanks!
> Anthony
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
