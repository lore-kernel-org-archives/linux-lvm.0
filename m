From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] ext3 slash
Message-ID: <20030606104650.A26768@sistina.com>
References: <1054888476.11446.8.camel@lupin>
Mime-Version: 1.0
In-Reply-To: <1054888476.11446.8.camel@lupin>; from geoff.dolman@cimr.cam.ac.uk on Fri, Jun 06, 2003 at 09:34:37AM +0100
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
Date: Fri Jun  6 03:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jun 06, 2003 at 09:34:37AM +0100, Geoff Dolman wrote:
> Hi
> 
> I have installed a machine with a /boot in a normal partition and all
> other partitions including / on ext3 logical volumes.
> (Red Hat 9/lvm 1.0.3).
> 
> I want to snapshot dump these partitions but I didn't realise at the
> time of the install that I would have to patch the kernel to be able to
> do this with ext3 filing systems.
> I don't want to have to do this so I migrated the partitions to ext2
> using tune2fs and changed fstab.
> 
> In the case of / and /var I booted into rescue mode from cd to run
> tune2fs against those volumes read-only.
> 
> When I rebooted the machine I got a panic because there was no journal
> found on /. Rebooting into rescue mode and restoring the journal on
> slash cures this problem.
> 
> How can I change the slash volume from ext3 to ext2? As I mentioned I
> edited fstab so there must be some other record somewhere telling the
> kernel that slash is ext3 but what? Do I need to make a new initrd.img?

Check if your lilo/grub entry contains a "rootfstype=" entry and change that
if it says ext3.

> 
> Many thanks
> -- 
> Geoff Dolman <geoff.dolman@cimr.cam.ac.uk>
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
