From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] kernel BUG at dm-snapshot.c:986!
Message-ID: <20030520093717.D9086@sistina.com>
References: <91120000.1052757190@valkyrie.lsit.ucsb.edu> <20030516130800.E24422@sistina.com> <1481523360.1053068601@[192.168.23.5]>
Mime-Version: 1.0
In-Reply-To: <1481523360.1053068601@[192.168.23.5]>; from max@lsit.ucsb.edu on Fri, May 16, 2003 at 07:03:21AM -0700
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
Date: Tue May 20 02:46:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 16, 2003 at 07:03:21AM -0700, Max Kalika wrote:
> Quoting "Heinz J . Mauelshagen" <mauelshagen@sistina.com>:
> > 
> > that code has changed recently. Have you tried if public device-mapper
> > cvs  fixes it?
> > 
> > Keep in mind, that code is under construction there!
> 
> Heinz,
> 
> Thank you for your reply.  Could you provide a pointer or to as to how to
> try the CVS device-mapper?  I just checked out the tree and the patches
> look the same as those that are in the release tarball (0.96.08).

Sorry, I assumed you had an older content.

> I'm
> assuming I have to do something with the dm-ioctl.[ch] files found under
> the kernel directory in the device-mapper CVS tree as that is where I
> noticed a lot of activity last month.  Do I just copy these manually into
> my kernel tree or is there something else that needs to be done as well?
> (Or do you know if there will be a new set of kernel patches cut soon?)

They'll be released with LVM 2.0 ASAP (delayed by a bug fix).


> Thank you for your time and patience.
> 
> --
> ---max kalika
> --max@lsit.ucsb.edu
> -lsit systems administrator
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
