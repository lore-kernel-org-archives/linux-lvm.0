From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] flascopy lvm
Message-ID: <20031013102159.G25676@sistina.com>
References: <E6FD503F6B73D31192DB0008C7E6346407E1AF13@pinemail1.phs.org>
Mime-Version: 1.0
In-Reply-To: <E6FD503F6B73D31192DB0008C7E6346407E1AF13@pinemail1.phs.org>; from CLeon@phs.org on Fri, Oct 10, 2003 at 07:08:02AM -0600
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
Date: Mon Oct 13 03:36:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Cynthia,

with any kind of block level copies you get an identical copy
of your existing volume group(s), therefore doubling the VG(s) if
attached to the same system.

A way to get the copy online is to temprarily rename the source VG using
vgrename (any mounted/opened logical volumes will stay in place unless you
reboot), attach the LUNs with the copy, run vgscan and activate the copy,
use vgrename to give the copy a new name and rename the source VG back.

Regards,
Heinz    -- The LVM Guy --



On Fri, Oct 10, 2003 at 07:08:02AM -0600, CLeon@phs.org wrote:
> We have our SAN disk attached to our Linux Red Hat 7.3 server and we are
> using LVM.  We are using a flashcopy utility to flash the drives.  After we
> flash the drives, we attach the flashed luns to the host.  When we do this,
> the logical volume has the flashed drive in it's volume list (vgdisplay -v).
> How can I prevent the this from happening?  I would like to mount the
> flashed volume as a different logical volume name.
> 
> Thanks,
> Cynthia Leon
> 
> ==============================================================================
> --- PRESBYTERIAN HEALTHCARE SERVICES DISCLAIMER ---
> 
> This message originates from Presbyterian Healthcare Services or one of its
> affiliated organizations. It contains information, which may be confidential
> or privileged, and is intended only for the individual or entity named above.
> It is prohibited for anyone else to disclose, copy, distribute or use the
> contents of this message. All personal messages express views solely of the
> sender, which are not to be attributed to Presbyterian Healthcare Services or
> any of its affiliated organizations, and may not be distributed without this
> disclaimer. If you received this message in error, please notify us
> immediately at postmaster@phs.org. 
> ==============================================================================
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

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
