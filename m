Return-Path: <mauelshagen@sistina.com>
Date: Mon, 20 Aug 2001 12:53:36 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Duplicate device numbers -- my fault.
Message-ID: <20010820125336.A26824@sistina.com>
References: <4.3.1.1.20010817140622.00b1b200@popin.ncl.ac.uk>
Mime-Version: 1.0
In-Reply-To: <4.3.1.1.20010817140622.00b1b200@popin.ncl.ac.uk>; from C.R.Ritson@ncl.ac.uk on Fri, Aug 17, 2001 at 02:33:15PM +0100
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

Chris,

the upgrade instructions are obsolete now for users, who want to upgrade beyond
LVM 0.9.1 Beta 7 as announced on Friday, because we found a neater way to
update *without* running an explicite upgrade tool.

LVM 1.0.1-rc1 is able to read the old metadata fromat directly and
support it :-)

Well, we really had prefered to have the idea for this earlier ;-)

On Fri, Aug 17, 2001 at 02:33:15PM +0100, Chris Ritson wrote:
> I have now RRRTFM and have realised that when upgrading with 
> pvversion(0.91-b8) I had the beta8 tools first in my path. Presumably this 
> explains my corrupt logical volumes. I have recovered from backups.
> 
> Now the real reason for sending this. For people like me, could the upgrade 
> instuctions be changed to include the following:-
> 
> 2a) Check that the OLD pvm tools are first in your path:
>      # pvdisplay -?
>      The first line of output shows the version of pvdisplay this should be 
> the OLD version 0.91_beta7 or earlier. Maybe the pvversion script could be 
> updated to automate this, making it fail safe.
> 
> 
> Another enhancement would have made my life easier, but this could be harder:-
> 
> Presumably when vgscan is run at boot time, it is reading metadata from the 
> volume groups it finds, including their last used minor device numbers. If 
> this tool finds duplicates (as I ended up with) would it make sense for it 
> to stop and report the error. Maybe even "vgchange -ay" could be arranged 
> not to activate the offending volume groups. This would have alerted me to 
> my error far earlier, but could I suppose have cuased problems had I had 
> root-on-LVM.

We already planned to change the minor number allocation scheme in a future
release in order to avoid this (and other problems).

> 
> Chris Ritson
> --
> EMAIL:	C.R.Ritson@newcastle.ac.uk	POST:	Chris Ritson,
> PHONE:	+44 191 222 8175			Department of Computing Science,
> FAX :	+44 191 222 8232				University of Newcastle upon Tyne,
> ROOM:	618 Claremont Bridge (the Mill)		United Kingdom NE1 7RU.
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
