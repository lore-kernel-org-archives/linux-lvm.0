From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan -f created duplicate block devices
Message-ID: <20030523122730.A24103@sistina.com>
References: <20030523003626.18233.h022.c007.wm@mail.ellisw.net.criticalpath.net>
Mime-Version: 1.0
In-Reply-To: <20030523003626.18233.h022.c007.wm@mail.ellisw.net.criticalpath.net>; from silleliam@ellisw.net on Fri, May 23, 2003 at 12:36:26AM -0700
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
Date: Fri May 23 05:36:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ellis,

have you removed _all_ /dev/-Entries for LVs and retried "vgscan -f"
without success so far ?

On Fri, May 23, 2003 at 12:36:26AM -0700, Ellis Whitehead wrote:
> Hallo,
> 
> How do you fix an incorrect Block Device assignment?
> 
> When I hooked the harddrive from an old computer into my newer one (both had lvm
> partitions), I got the message that certain IDs were duplicated.  So I ran vgscan
> -f to assign new IDs.  However, vgscan -f duplicated the Block Device on two of
> the logical volumes.  The has the outcome that when I mount the first one, I only
> get access to the second one. :(
> 
> I would show the output of lvdisplay & friends, but I can't get an internet
> connection from that computer anymore because of this. *grin*  Basically:
> 
> /dev/toro1/home, block device 58:5
> /dev/toro1/var, block device 58:6
> /dev/toro1/projekte, block device 58:7
> /dev/toro1/usr, block device 58:8
> /dev/toro1/local, block device 58:9
> /dev/toro1/fileserver, block device 58:5
> 
> Either the drive I added had 5 lv's and so vgscan didn't reassign the 6th on the
> first drive (i.e., /dev/toro1/fileserver), or it cycled back around after 58:9
> for some reason.
> 
> Can anyone tell me how to get my home back??? *grin*
> 
> Many thanks in advance!
> Ellis Whitehead
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
