From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] file system larger than lv
Message-ID: <20021118162556.C25728@sistina.com>
References: <OF1EE49BDF.AE37C6D0-ON86256C71.005578CE@TEXASMUTUAL.COM> <20021115115831.B11618@sistina.com> <20021115122708.GK8377@pc.ilinx> <20021115135424.A12164@sistina.com> <20021115134816.GL8377@pc.ilinx>
Mime-Version: 1.0
In-Reply-To: <20021115134816.GL8377@pc.ilinx>; from lvm@interlinx.bc.ca on Fri, Nov 15, 2002 at 08:48:20AM -0500
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
Date: Mon Nov 18 09:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 15, 2002 at 08:48:20AM -0500, lvm@interlinx.bc.ca wrote:
> On Fri, Nov 15, 2002 at 01:54:24PM +0100, Heinz J . Mauelshagen wrote:
> > 
> > Brian,
> 
> Hi Heinz.
> 
> > yes, at the end of the day you can't prevent people with the necessary
> > credentials from shooting themselves in the foot anyways.
> > That occasionally includes me.
> > At least at ~4pm in the morning ;)
> 
> I hear ya.  Me too.  :-)

:)

> 
> > Because LVM is a block layer service transparent to filesystems or any other
> > arbitrary block device user, it should just cover the necessary block device
> > functionality.
> 
> I don't disagree with that.
> 
> > Putting additional overloading block/filesystem layer services not necessarily
> > needed there into the kernel is unlikely to be accepted either IMO.
> 
> No.  No.  Not in the kernel.  I mean the user space tools can simply
> check what data is on the block device (i.e. look for a known
> signature of given filesystems) and see if it can determine if it is
> indeed a filesystem.

Yep. We share the same opinion I guess.
The user space tool shall be pattern configurable in order to "learn" about
new filesystem types (config file ala /etc/magic).

> 
> > Controlling LVM block device and filesystem changes in userspace with an
> > (e2)fsadm tool is a "helping hand" for the unexperienced, not limiting
> > the experienced user.
> > This is our prefered way to go.
> 
> That is fair enough.  And I don't care that strongly about this issue,
> but just thought of how many tools (in their "interactive mode"
> anyway) stop and ask a user before they are about to do something
> potentially disasterous.

lvreduce warns.
As mkfs does ;)

> 
> b.
> 
> -- 
> Brian J. Murrell



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
