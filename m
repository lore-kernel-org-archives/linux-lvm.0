From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: device-mapper transition
Message-ID: <20021014095249.A6547@sistina.com>
References: <1034276879.2396.11.camel@mars.goatskin.org> <20021011075220.GA1153@fib011235813.fsnet.co.uk> <20021011090446.GA5506@sparcbox.net> <20021011220839.GA8694@chunk.voxel.net> <20021012000702.C3808@uk.sistina.com>
Mime-Version: 1.0
In-Reply-To: <20021012000702.C3808@uk.sistina.com>; from agk@uk.sistina.com on Sat, Oct 12, 2002 at 12:07:03AM +0100
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
Date: Mon Oct 14 02:59:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Oct 12, 2002 at 12:07:03AM +0100, Alasdair G Kergon wrote:
> On Fri, Oct 11, 2002 at 06:08:39PM -0400, Andres Salomon wrote:
> > Support is already in the kernel and libdevmapper for driver version
> > querying; should be just an issue of adding the check to the lvm2 tools.
> 
> The checks are already there - it's just *all* the error messages that need 
> reviewing:-)  I'll deal with these particular ones next week.
> 
> I'd like us to move towards the position where, like many other Unix 
> command line utilities, if no messages are displayed it generally
> means you can assume the command ran successfully.

That's fine as a default which can be configured to fall back to the LVM1
given standard for the success case in order to stay compatible with all
exec output parsers.

> 
> Alasdair
> -- 
> agk@uk.sistina.com
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
