From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvscan and vgscan
Message-ID: <20030425105718.A16006@sistina.com>
References: <1051208166.1179.9.camel@rich>
Mime-Version: 1.0
In-Reply-To: <1051208166.1179.9.camel@rich>; from rich@storix.com on Thu, Apr 24, 2003 at 11:16:07AM -0700
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
Date: Fri Apr 25 04:03:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Apr 24, 2003 at 11:16:07AM -0700, Rich Turner wrote:
> how does pvscan and vgscan know what devices to scan to search for pv's
> and vg's? is there a file that it uses to determine which disks to open?
> it does not appear to try to open all devices when their respective
> modules have not been loaded yet.

LVM1 has the tradeoff that all supported devices are hard-coded which we
changed in LVM2 to be configurable (using regular expressions).

> 
> my situation is that i have volume groups on multiple scsi devices but
> the scsi modules are not being loaded before vgscan is being run in the
> rc.sysinit. i realize that this is a problem inherent with the
> rc.sysinit and can be fixed within it. but, my question is how does
> vgscan scan all devices without opening them? normally when a device is
> opened all of the modules are automatically loaded, hence vgscan will
> find them.

It does open them. You likely have a kmod misconfiguration preventing
module load if it fails to.
> 
> using lvm 1.0.3
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
