From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] 250G limit........
Message-Id: <20020313120016.A23051@sistina.com>
References: <005a01c1ca5f$5da91330$3200a8c0@warl0k>
MIME-Version: 1.0
In-Reply-To: <005a01c1ca5f$5da91330$3200a8c0@warl0k>; from warl0k@lvcm.com
    on Wed, Mar 13, 2002 at 12:18:26AM -0700
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
Date: Wed Mar 13 05:02:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Mar 13, 2002 at 12:18:26AM -0700, Glenn Shannon wrote:
> I remember something or other about a 250G per vg limit while I was originally setting up my lvm....does this 250G limit still stand?

It is actually a per 'logical volume' not a per 'volume group' limit in LVM1.

A volume group can have up to 256 physical volumes with 2TB size each.

> 
> If so, are there any future plans to remove it? I just thought it would be interesting to have a full TB on LVM, and I've got the disks to test it/try it/crash it.

Will be removed in LVM2.

Probably not in LVM1 because it means an incompatible change of the
on-disk metadata which will be supported by LVM2 anyway.

So you could work around that per LV limit with LVM2 once it is production
ready, which we plan for late summer.

> 
> :)
> 
> Glenn
> 

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
