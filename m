From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] upgrade to rh7.3 broke lvm
Message-ID: <20020722130252.B23420@sistina.com>
References: <3D358A8D.27A77928@mooncrest.net>
Mime-Version: 1.0
In-Reply-To: <3D358A8D.27A77928@mooncrest.net>; from yossi@Mooncrest.Net on Wed, Jul 17, 2002 at 05:17:33PM +0200
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
Date: Mon Jul 22 06:13:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Yossi,

the upgrade should have brought you compatible user space and kernel LVM parts.

Can you find your VG(s) running vgdisplay?

/dev/mg0 is no valid logical volume name to be use for mounting.
Must be something like /dev/YourVGName/YourLVName.

On Wed, Jul 17, 2002 at 05:17:33PM +0200, Yossi wrote:
> Upgraded from RH7.1 to RH7.3. The 7.1 was built with the lvm patch to
> the kernel. The 7.3 RH kernel has lvm built in. After the upgrade, I
> receive the message "/dev/mg0 not a block device" when I try to mount
> it. I tried exporting the vg and importing it without errors but it
> still doesn't mount. I suspect that this may be due to different
> versions of the kernel part of the lvm versus the usermode parts of lvm.
> 
> Thanks for any help,
> 
> L. Baker
> MVS, Ltd.
> 
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
