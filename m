Subject: Re: [linux-lvm] S.A.M.E methodology
From: Jord Tanner <jord@indygecko.com>
In-Reply-To: <1DCD421BDE8C3C478E9A0A84B75702931165D6@srv-pae-ex01.rge-rs.com.br>
References: 
	 <1DCD421BDE8C3C478E9A0A84B75702931165D6@srv-pae-ex01.rge-rs.com.br>
Message-Id: <1073584771.14632.20.camel@gecko.indygecko.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Jan  8 13:01:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: linux-lvm@redhat.com

This technique, also called RAID 1+0, is often used in database
installations. The basic logic is that with 4 or more drives you can get
the redundancy of RAID 1 with the performance of RAID 0. RAID 5
generally has poor performance for database use. If you have a hardware
RAID card let it do the mirroring (reduces bandwidth on the PCI bus) and
let the OS do the striping. This would require 2 RAID 1 mirror sets,
then striping to those virtual devices. Theoretically in a 4 drive setup
you could tolerate 2 drive failures if the drives are in different
mirror sets. Personally I would use Linux software RAID to create the
RAID 0, then create the LVM volumes on top of that. I'm currently
planning this type of installation, but I've not received the hardware
yet, so I can't tell you my experience.

This has been talked about extensively on the PostgreSQL performance
mailing list. Check out this thread.

Jord Tanner


On Thu, 2004-01-08 at 03:01, Ricardo Mattia wrote:
> Hello.
> 
> 	Today we have a host running Oracle 8.1.7 on AIX 4.3.3.
> 	We decided to migrate this system from RISC to Intel and the
> choosed operating system was SUSE Linux.
> 	Besides that, we are changing the way Oracle Datafile's are
> distributed. After some internet research, we got in touch with a
> methodology called S.A.M.E, which stands for Stripe and Mirror
> Everything. 
> 	Basicaly, we need to Stripe all the storage available using LVM
> (on operating system level) and mirror everything (on storage level). Of
> course we increase our risk of an entire system failure in case of just
> "one" RAID crash.
> 	This methodology is explained on Juan Loaiza's whitepaper, from
> Oracle Corporation.
> 
> 	So, my question is : Has anyone implemented this stuff using
> Linux SUSE and LVM? If yes, is it work and could you give me some tips
> about it? 
> 	
> Thanks in advance.
> 
> Best Regards,
> Ricardo Mattia
> http://www.rge-rs.com.br
> 51 3218-3168
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Jord Tanner <jord@indygecko.com>
