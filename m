From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] file system larger than lv
Message-ID: <20021115135424.A12164@sistina.com>
References: <OF1EE49BDF.AE37C6D0-ON86256C71.005578CE@TEXASMUTUAL.COM> <20021115115831.B11618@sistina.com> <20021115122708.GK8377@pc.ilinx>
Mime-Version: 1.0
In-Reply-To: <20021115122708.GK8377@pc.ilinx>; from lvm@interlinx.bc.ca on Fri, Nov 15, 2002 at 07:27:08AM -0500
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
Date: Fri Nov 15 07:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Brian,

yes, at the end of the day you can't prevent people with the necessary
credentials from shooting themselves in the foot anyways.
That occasionally includes me.
At least at ~4pm in the morning ;)

Because LVM is a block layer service transparent to filesystems or any other
arbitrary block device user, it should just cover the necessary block device
functionality.

Putting additional overloading block/filesystem layer services not necessarily
needed there into the kernel is unlikely to be accepted either IMO.

Controlling LVM block device and filesystem changes in userspace with an
(e2)fsadm tool is a "helping hand" for the unexperienced, not limiting
the experienced user.
This is our prefered way to go.


On Fri, Nov 15, 2002 at 07:27:08AM -0500, lvm@interlinx.bc.ca wrote:
> On Fri, Nov 15, 2002 at 11:58:31AM +0100, Heinz J . Mauelshagen wrote:
> > 
> 
> Heinz,
> 
> > LVM1 contains the e2fsadm tool which prevents
> > you form doing things like that.
> 
> I know we are never going to be able to stop everybody who _really_
> wants to shoot themselves in the foot from doing so, but I wonder,
> perhaps if there should be "something extra" that needs to be done to
> manipulate the size of volumes with filesystems on them (i.e. probe
> the lv to see what's on it) directly (i.e.  lvreduce, lvexpand).  This
> would of course be used to encourage the use of the convenience tools
> like e2fsadm.
> 
> Perhaps an environment variable or an "expert switch" on the command
> line or something.  Not using the switch or setting the env. variable
> would cause a probe of the lv and if there was found to be a
> filesystem on it, it would prompt the user to use a convenience tool
> (for that filesystem type) to perform his task, or set the
> switch/variable, if he really wanted to go ahead.
> 
> Or maybe this is all just too much handholding.
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
