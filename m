From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] still problems with removing "non existant" dead snapshots :/
Message-ID: <20021028101305.E16452@sistina.com>
References: <20021025143323.B4081@sistina.com> <Pine.LNX.4.44.0210251321380.17565-100000@pzat.meep.org>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0210251321380.17565-100000@pzat.meep.org>; from oolon@ankh.org on Fri, Oct 25, 2002 at 01:23:18PM +0000
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
Date: Mon Oct 28 03:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 25, 2002 at 01:23:18PM +0000, James Hawtin wrote:
> 
> 
> On Fri, 25 Oct 2002, Heinz J . Mauelshagen wrote:
> 
> > You should give LVM2 + device-mapper a try or downgrade to 1.0.5.
> 
> Hmmm what are the problems with 1.1-rc2? thats the version I am currently
> running, 1.0.5 I beleive has a problem with pvmove > 2 gig? or am I
> rembering the wrong version.

No, there's no such problem in 1.1.

It is just an intermediate development version which got replaced by
LVM2/device-mapper.

Use that combination if you want stable, cutting-edge Linux LVM :)

> 
> James
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
