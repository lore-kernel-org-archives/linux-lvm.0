From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Warning message with lilo about /proc/partitions
Message-ID: <20031026140200.J848@sistina.com>
References: <20031026123054.GG1569@tangerine.coulon.evette>
Mime-Version: 1.0
In-Reply-To: <20031026123054.GG1569@tangerine.coulon.evette>; from jean-luc.coulon@wanadoo.fr on Sun, Oct 26, 2003 at 01:30:54PM +0100
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
Date: Sun Oct 26 07:01:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Oct 26, 2003 at 01:30:54PM +0100, Jean-Luc Coulon (f5ibh) wrote:
> Hi,
> 
> When I start lilo, I've the following warning mesage:
> 
> Reading boot sector from /dev/hda
> Warning: '/proc/partitions' does not match '/dev' directory structure.
>     Name change: '/dev/lvma' -> '/dev/vg00/root_lv'
>     Name change: '/dev/lvmb' -> '/dev/vg00/var_lv'
>     Name change: '/dev/lvmc' -> '/dev/vg00/usr_lv'
>     Name change: '/dev/lvmd' -> '/dev/vg00/home_lv'
>     Name change: '/dev/lvme' -> '/dev/vg00/opt_lv'
> 
> 
> The /proc/partitions is:
> major minor  #blocks  name
> 
>   58     0    1048576 lvma
>   58     1    1572864 lvmb
>   58     2   10485760 lvmc
>   58     3    3145728 lvmd
>   58     4    1572864 lvme
>    3     0   30029328 hda
>    3     1      16033 hda1
>    3     2   28057522 hda2
>    3     3    1951897 hda3
>    3    64   29316672 hdb
>    3    65    4883728 hdb1
>    3    66   17583142 hdb2
>    3    67    1951897 hdb3
>    3    68    4891792 hdb4
> 
> This seems to be harmless.

Yes, it is.

> What does /proc/partitions does not reflect  
> the real ones?

Because the related (ancient) patch never got accepted ;)

> 
> --
> Regards
> 		- Jean-Luc
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
