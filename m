From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] problem of snapshot on XFS
Message-ID: <20030623102949.B31281@sistina.com>
References: <3EF69479.7060709@sina.com>
Mime-Version: 1.0
In-Reply-To: <3EF69479.7060709@sina.com>; from more0401@sina.com on Mon, Jun 23, 2003 at 01:47:37PM +0800
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
Date: Mon Jun 23 03:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

The snapshot stores any exceptions on the original LV
(IOW: changed chunks of 32KB default size) synchronously in LVM1.

In your testcase this obviously keeps an XFS dirty status on the snapshot
during file writes at reboot.

XFS experts are the guys to ask how that happens
(and can be avoided).

On Mon, Jun 23, 2003 at 01:47:37PM +0800, more wrote:
> Hi,
> 
> I am using XFS on LVM1 now.
> 
> I build snapshot LV using xfs_freeze and not using norecovery mount 
> option. This is commended in lvm-howto.
> But in my test, if I reboot the system in the progress of file writing 
> on a LV that has snapshot,  the next time mounting snapshot will report 
> XFS error and the system wants to repair the snapshot. So I will have to 
> use norecovery option now.
> 
> I feel puzzled that why XFS repairing is needed on snapshot, I am now 
> building an enterprise network file server, the robust is very important 
> for us.
> 
> Very thanks for any feeding, by the way, it is not possible for me to 
> use LVM2 in current.
> 
> 
> Regards,
> more
> 
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
