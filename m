From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Please Help, vgscan finds too much LEs
Message-ID: <20020909125734.C15934@sistina.com>
References: <3D78E549.8408.39D5AA@localhost>
Mime-Version: 1.0
In-Reply-To: <3D78E549.8408.39D5AA@localhost>; from thorsten.pawlak@gmx.net on Fri, Sep 06, 2002 at 05:26:33PM +0200
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
Date: Mon Sep  9 06:26:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Sep 06, 2002 at 05:26:33PM +0200, T. Pawlak wrote:
> Hi,
> 
> this is the second email for my problem. Unfortunately i haven't got an answer to my 
> first one. So i'm posting again.
> 
> After i've pvreduce my VG vgscan can't activate it. here is the output:
> 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- only found 28926 of 28672 LEs for LV /dev/data/home (0)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of 
> volume group "data" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume 
> group
> 
> i don't know what i can do, it is very funny problem because 28926 LEs are found of 
> and only 28672 sems to be needed, where are the 254 LEs from?!?

That looks really odd :(

Could you send me the "dd bs=1k count=4k" of all PVs tar'ed+bzip2'ed to
mge@sistina.com and the /etc/lvmconf/data* archives as well, please.

> 
> i've made a pvdata -Eva from all 5 PEs, the file is about 1mb of size, so dave 
> everyones bandwidth i put it here: http://www.pawlak-world.de/pvdata
> 
> if more infos of my configuration is needed please conact me!
> 
> i'm using LVM v1.0.5 with kernel patch (i upgraded from 1.0.3 before i made the 
> pvreduce)
> 
> I hope someone can help me now! It would be very nice if i can reconstruct my data, 
> although i have a backup, but only of 60gb of the whole 200gb and it would be nice to 
> access the rest again somehow!
> 
> bye Thorsten
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
