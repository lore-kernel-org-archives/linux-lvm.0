From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Quorums / VGDAs
Message-ID: <20020911123312.D26854@sistina.com>
References: <3D7E4050.B3BEEE@storix.com>
Mime-Version: 1.0
In-Reply-To: <3D7E4050.B3BEEE@storix.com>; from anthony@storix.com on Tue, Sep 10, 2002 at 11:56:16AM -0700
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
Date: Wed Sep 11 05:57:56 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Sep 10, 2002 at 11:56:16AM -0700, Anthony Johnson wrote:
> I'm trying to find information on the availability factors of LVM. As I
> understand it, a quorum is required for a volume group to be available.
> I have some questions in this regard:
> 
> 1) What defines a quorum - over 50% of the PVs in the VG, or over 50% 
>    of the VGDAs?

VG quorum is given in case all of its PVs are available.

> 2) How many VGDAs are stored on each physical volume. From AIX 
>    experience, this varied depending on the number of PVs in the VG.

In the LVM1 metadata there's allways 1 VGDA on each PV which has internal
redundancy.
With the new LVM2 formats you can have as many VGDA copies as you like.

> 3) If quorum is lost on an active VG, is the entire VG automatically 
>    varied off?

No, it will stay accessable with the exception of the dead PV(s).

> 4) Can a VG without quorum be forcefully varied on?

With LVM1.1 (see CVS; WARNING: his is interim development code!) and with final
LVM2 later this year, you can activate a VG which has lost quorum.

> 5) Can quorum checking be disabled?

No, but with the above SW you can activate the VG in case there's
at least 1 PV still accessable.

> 
> Thanks,
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
