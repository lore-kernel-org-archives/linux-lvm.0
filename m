From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvscan showing 0 free on all PV's.
Message-ID: <20030919123523.P2618@sistina.com>
References: <3F679A44.6121.CED1C6A@localhost> <3F68AE62.7000103@tupshin.com>
Mime-Version: 1.0
In-Reply-To: <3F68AE62.7000103@tupshin.com>; from tupshin@tupshin.com on Wed, Sep 17, 2003 at 11:56:34AM -0700
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
Date: Fri Sep 19 05:46:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 17, 2003 at 11:56:34AM -0700, Tupshin Harper wrote:
> Rene Olsen wrote:
> 
> > So what I should do is the following:
> >
> > Lets say the 200GB disc is 6000 PE's big.
> >
> > e2fsadm -v -l -6076 /dev/vol1/lv_vol
> 
> yup,
> 
> > This should make the lvm 200GB smaler.
> >
> > Then after that I do
> >
> > pvmove /dev/hdh1
> 
> Not yet. e2fsadm reduced the size of the filesystem. But you need to 
> then reduce the sze of the lvm with:
> lvreduce -l 6076 /dev/vol1/lv_vol
> Then use the pvmove command.

No need to lvreduce after running e2fsadm.

e2fsadm extends/reduces an unmounted ext[23] and grows/shrinks the Logical
Volume as well (unless a not automatically fixible fsck error occurs).

> 
> -Tupshin
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
