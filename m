From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Query For MULTIPATH & LVM
Message-ID: <20030523130302.D24103@sistina.com>
References: <005501c31ea7$b52505e0$e0bba5cc@patni.com>
Mime-Version: 1.0
In-Reply-To: <005501c31ea7$b52505e0$e0bba5cc@patni.com>; from sameer.halgatti@patni.com on Tue, May 20, 2003 at 01:43:04PM +0530
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
Date: Fri May 23 06:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, May 20, 2003 at 01:43:04PM +0530, Sameer Halgatti wrote:
> Hi All,
> I am a new user to LVM.
> I have a system with Linux RH 7.2 (Kernel version 2.4.7-10)
> The version of LVM, I am using is lvm-1.0.3-4.
> I have connected a Storage Machine (SAN) to my host. So I could have multiple paths to any LUN. (e.g sda & sdb are pointing to the same LUN).
> So whenever I do "pvcreate" on /dev/sda, PV gets created on /dev/sdb also since they (sda & sdb) are pointing to same disk/LUN.
> In such a scenario can I use lvm-1.0.3.4 ??
> If not then please give me reasons as well as solution.

With LVM1 you can achive multi-pathing with MD (search the Web for raidtools
and raidtab) below LVM _or_ use IBMs multi-path addition which gets shipped
with recent SuSE distros (starting with 8.1).

Sistina's plan is to suport multi-pathing in LVM2.2 later this year.

> 
> Pls REPLY to my QUERY!!!
> 
> Thanks & Regards,
> Sameer Halgatti
> 

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
