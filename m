From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Troubles
Message-Id: <20020402101639.A13819@sistina.com>
References: <Pine.LNX.4.21.0203240114390.18855-100000@cyberion.pl>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0203240114390.18855-100000@cyberion.pl>;
    from sobol@sobol.org on Sun, Mar 24, 2002 at 01:17:55AM +0100
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
Date: Tue Apr  2 02:16:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Mar 24, 2002 at 01:17:55AM +0100, Przemek Sobieski wrote:
> Hello
> I added new hard drive to my system. Then i maked lvm partition.
> then pvcreate /dev/hdg1 ... and then vgextend blam /dev/hdg1 and then
> lvextend -l+7851 /dev/blam/blam .And then i deleted with fdisk lvm
> partition on hdg and reboot machine. Now i get:
> 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume
> group "blam" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group  
> 
> then my /dev/blam/blam gone. Now i want restore my lvm. How i can fix that
> ? Please help.
> 				SoboL
> 				ps1. dont ask why i deleted it :>

I wont :)

But if you do you should better recreate it the same way it was before and
retry to scan+activate your VG.

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
