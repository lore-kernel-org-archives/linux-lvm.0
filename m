From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgchange -ay failed with "Bad address"
Message-ID: <20030211152427.B10750@sistina.com>
References: <200302101357.h1ADvVY2022211@joe.freakout.de>
Mime-Version: 1.0
In-Reply-To: <200302101357.h1ADvVY2022211@joe.freakout.de>; from lvm@freakout.de on Mon, Feb 10, 2003 at 02:57:31PM +0100
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
Date: Tue Feb 11 08:28:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Axel,

some snapshot metadata got corrupted.
Do you see any messages in syslog spotting some light on what happened ?

To get your VG back, you need to drop existing snapshots via "vgscan -r".

Regards,
Heinz    -- The LVM Guy --

On Mon, Feb 10, 2003 at 02:57:31PM +0100, Axel Reinhold wrote:
> Hi,
> 
> when I start up my home-server today I was shocked.
> LVM didn't change my volgroup to available. The server
> was shut down yesterday with a normal shutdown properly.
> 
> [root@bongo root]# vgck vg01
> vgck -- VGDA of "vg01" in lvmtab is consistent
> vgck -- VGDA of "vg01" on physical volume is consistent
> 
> vgchange tells me:
> 
> [root@bongo root]# vgchange -ay vg01
> vgchange -- ERROR "Bad address" activating volume group "vg01"
> 
> the kernel says (dmesg):
> lvm -- _pv_get_number failed for rdev = 65535
> lvm -- lvm_snapshot_fill_COW_page failed<3>
> 
> I tried vgscan -> Ok.
> 
> I'm totally lost. It's my home-server.
> I used snapshots (intensively) without problems for a couple of weeks.
> 
> Would you please help me to recover the data.
> There is no hardware problem - I'm sure - The data is still there.
> 
> Used versions:
> Linux 2.4.20
> LVM version 1.0.5+(22/07/2002) module loaded
> Logical Volume Manager 1.0.6
> Heinz Mauelshagen, Sistina Software  25/10/2002 (IOP 10)
> 
> Axel Reinhold
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
