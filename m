From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan -f created duplicate block devices
Message-ID: <20030527123838.A8430@sistina.com>
References: <20030526032356.20922.h022.c007.wm@mail.ellisw.net.criticalpath.net>
Mime-Version: 1.0
In-Reply-To: <20030526032356.20922.h022.c007.wm@mail.ellisw.net.criticalpath.net>; from lists@ellisw.net on Mon, May 26, 2003 at 03:23:56AM -0700
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
Date: Tue May 27 05:48:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ellis,

with devfs in place, you need to run vgscan _before_ "vgchange -ay" is run
in your system startup script (whatever that is distro-depenedent).

vgscan works on all volume groups (no matter if active or not).

On Mon, May 26, 2003 at 03:23:56AM -0700, Ellis Whitehead wrote:
> Hi Heinz,
> 
> > have you removed _all_ /dev/-Entries for LVs and retried 
> > "vgscan -f" without success so far ?
> 
> I'm using devfs, and removal of the /dev/{VG}/{LV} entries isn't permitted.  The
> VG and LVs show up under /dev if the VG is active, and otherwise they aren't
> present.  Once the VG is active, the LV entries cannot be modified by the usual
> command line tools, as far as I've seen...
> 
> Since vgscan can only works on active volumes, and since active volumes are
> already immutably set in /dev, I'm afraid this solution won't work.
> 
> Is there any way to manually set the block device?  Or is there any way to get
> vgscan to start anew without the block device numbers in /dev?
> 
> Thanks!
> Ellis
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
