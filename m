Return-Path: <mauelshagen@sistina.com>
Date: Wed, 15 Aug 2001 10:56:23 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Adding a mirror after-the-fact
Message-ID: <20010815105623.A29693@sistina.com>
References: <20010814171159.B28266@linux.com>
Mime-Version: 1.0
In-Reply-To: <20010814171159.B28266@linux.com>; from tack@linux.com on Tue, Aug 14, 2001 at 05:11:59PM -0400
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

On Tue, Aug 14, 2001 at 05:11:59PM -0400, Jason Tackaberry wrote:
> I know this isn't strictly an LVM question, but ...
> 
> Suppose I have a volume group with 1 physical volume, say a 9GB disk.
> Now, after some time, I decide I want to mirror this VG with another 9GB
> disk.  What options do I have?  AFAICS, the only way to do this would be
> to start from scratch?  This is a pretty simple and presumably common
> thing to want to do, so I hope I'm wrong.  :)

Yes, you are (with 2.4 kernels) ;-)

You could either mirror the whole disk using MD *without* persistent superblocks

*or*

use MD and mirror all logical volumes.

The later needs an additional VG on the second disk with logical volumes of the
same size of those in the first VG you already have.

Say you have a volume group named "vg". Then you could create a volume group
"vg_mirror" on the other disk, create logical volumes named after the ones
you already have in "vg" and set up an /etc/raidtab file with mirrors for
all the logical volumes.


Pro of first approach is, that you don't need to worry about new logical volumes
which will be mirrored automatically because you mirror the whole underlying
device.

With the second approach, you need to create a mirror logical volume, extend
your raidtab and activate mirrors for every new logical volume.

> 
> Cheers,
> Jason.
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
