Return-Path: <root@srv.sistina.com>
Date: Wed, 20 Jun 2001 21:36:22 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Mandrake 8.0 with LVM and mount
Message-ID: <20010620213622.A26817@sistina.com>
References: <200106201846.OAA08500@interlock2.lexmark.com>
Mime-Version: 1.0
In-Reply-To: <200106201846.OAA08500@interlock2.lexmark.com>; from mowrer@lexmark.com on Wed, Jun 20, 2001 at 02:45:33PM -0400
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

Jim,

where do you activate your VG(s)?
This must happen before local filesystems are mounted and it looks like
"vgchange -ay" runs after that during startup.


On Wed, Jun 20, 2001 at 02:45:33PM -0400, mowrer@lexmark.com wrote:
> 
> 
> Running LVM on Mandrake 8.0.  Have all working well, but upon reboot, my FS on
> this LV does not mount without putting a mount in S99local.
> 
> Where should this happen..  I suppose /etc/fstab wont work! or should it..
> Thanks Jim
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
