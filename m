From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Can't mke2fs lv
Message-Id: <20020211190928.A31248@sistina.com>
References: <20020211173404.GB23@merlins.org>
MIME-Version: 1.0
In-Reply-To: <20020211173404.GB23@merlins.org>; from marc_lvm@merlins.org
    on Mon, Feb 11, 2002 at 09:34:04AM -0800
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
Date: Mon Feb 11 12:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 11, 2002 at 09:34:04AM -0800, Marc MERLIN wrote:
> I've never had this problem before, it's on a 2.4.14 kernel with lvm
> 1.0.1rc4:
> 
> gargamel:~# lvscan 
> lvscan -- ACTIVE            "/dev/BootMylexLVM/usr" [1.50 GB]
> lvscan -- ACTIVE            "/dev/BootMylexLVM/var" [2.00 GB]
> lvscan -- ACTIVE            "/dev/BootMylexLVM/home" [115.00 GB]
> lvscan -- 3 logical volumes with 118.50 GB total in 1 volume group
<SNIP>
>         4096000, 7962624, 11239424, 20480000, 23887872
> 
> File size limit exceeded
> 
> 
> Did I do something stupid, or do I need to upgrade?
> (I did do a quick search on this kind of failure, but didn't find anything)

No, there's an OS bug related to the 2 GB file size limit which causes both your
problems. You must be directly logged in as 'root', *no* 'su root' in order
to run the commands fine.

> 
> 
> Details on the VG:
> gargamel:~# vgdisplay  -v
> --- Volume group ---
> VG Name               BootMylexLVM
<SNIP>
> PV Status             available / allocatable
> Total PE / Free PE    8700 / 1116
> 
> 
> Thanks,
> Marc
> -- 
> Microsoft is to operating systems & security ....
>                                       .... what McDonalds is to gourmet cooking
>   
> Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key
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
