Return-Path: <root@srv.sistina.com>
Date: Mon, 16 Jul 2001 13:26:50 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] im getting: ERROR "vg_read_with_pv_and_lv()
Message-ID: <20010716132650.A11625@sistina.com>
References: <01071516130400.01262@athlon>
Mime-Version: 1.0
In-Reply-To: <01071516130400.01262@athlon>; from logix@t-online.de on Sun, Jul 15, 2001 at 04:13:04PM +0200
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

Robin,

what was you old distro/kernel version?
What's your new distro/kernel version?

On Sun, Jul 15, 2001 at 04:13:04PM +0200, Robin Wenninger wrote:
> hi all,
> i have a problem with my lvm. i have changed my root distribution, after 
> doing this, my lvm doesen't work anymore. i left the lvm-partitions 
> untouched, and after installing the kernel-patch and the lvm-tools for me new 
> distribution, i tried a vgscan to create a new lvmtab and a lvmtab.d. but i 
> get a errormessage:
> 
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data 
> of volume group "vg01" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating 
> "/etc/lvmtab" and "/etc/lvmtab.d"
>  
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "vg01"
> 
> i dont know what do to
> 
> please help me
> 
> cu all
> 
> p.s. i created my lvm with the v0.8 from the lvm tools, now i try to vgscan 
> with the v0.9, can this be the problem?

It shouldn't but it likely is :-(

Could you send the "dd if=/dev/X ibs=1k count=500 of=PV_N" outputs
of all your PVs of vg01 attached compressed to me directly, please?


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
