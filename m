From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvreduce
Message-ID: <20030627112559.A27001@sistina.com>
References: <20030626163644.GA25171@defiant.sonsofthunder.yi.org>
Mime-Version: 1.0
In-Reply-To: <20030626163644.GA25171@defiant.sonsofthunder.yi.org>; from storm@tux.org on Thu, Jun 26, 2003 at 12:36:44PM -0400
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
Date: Fri Jun 27 04:41:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Bradley,

could it accidentially be, that your LV was 2GB large before ?

That'ld explain the resulting 1GB, because lvreduce shows the absolute
resulting size.


On Thu, Jun 26, 2003 at 12:36:44PM -0400, Bradley M Alexander wrote:
> I ran across this today, and wanted some clarification if I could. I am
> running kernel 2.4.21 and lvm 1.0.7.
> 
> I needed to resize a partition, reducing it by 1GB. As I have done in the
> past, went into single user mode, umounted the partition did a
> resize_reiserfs -s-1GB /dev/vg00/var
> 
> This went fine, then I tried to reduce the size of the lv, using 
> lvreduce -L-1G /dev/vg00/var
> 
> lvreduce -- WARNING: Reducing active logical volume to 1 GB
> lvreduce -- THIS MAY DESTROY YOUR DATA (filesystem etc.)
> lvreduce -- do you really want to reduce "/dev/vg00/var"? [y/n]:
> 
> Isn't the -L-1G option for lvreduce supposed to reduce the lv _by_ the
> requested amount rather than _to_ that size?

Yes.

> If specify -L1G, that should
> be an absolute value rather than a relative value.

Correct.

> 
> Am I missing something here?

No.

> Would this be better addressed to the Debian
> maintainer for the lvm tools?

Well, that's Patrick Caulfield and he's on my team reading this mail as well :)

> 
> Thanks,
> -- 
> --Brad
> ============================================================================
> Bradley M. Alexander                |
> gTLD SysAdmin, Security Engineer    |   storm [at] tux.org
> Debian/GNU Linux Developer          |   storm [at] debian.org
> ============================================================================
> Key fingerprints:
> DSA 0x54434E65: 37F6 BCA6 621D 920C E02E  E3C8 73B2 C019 5443 4E65
> RSA 0xC3BCBA91: 3F 0E 26 C1 90 14 AD 0A  C8 9C F0 93 75 A0 01 34
> ============================================================================
> If all you can see out of the window is ground that's going
> round and round and all you can hear is commotion coming from the
> passenger compartment, things are not at all as they should be.
> 					--Rules of the Air, #18
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
