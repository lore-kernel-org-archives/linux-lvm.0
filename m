Message-ID: <3EF69789.8060303@sina.com>
From: more <more0401@sina.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem of snapshot on XFS
References: <3EF69479.7060709@sina.com>
In-Reply-To: <3EF69479.7060709@sina.com>
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
Date: Mon Jun 23 01:01:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi,

By the way, I am using 2.4.19 kernel and 1.2 XFS and 1.0.3 LVM1.

more wrote:

> Hi,
>
> I am using XFS on LVM1 now.
>
> I build snapshot LV using xfs_freeze and not using norecovery mount 
> option. This is commended in lvm-howto.
> But in my test, if I reboot the system in the progress of file writing 
> on a LV that has snapshot,  the next time mounting snapshot will 
> report XFS error and the system wants to repair the snapshot. So I 
> will have to use norecovery option now.
>
> I feel puzzled that why XFS repairing is needed on snapshot, I am now 
> building an enterprise network file server, the robust is very 
> important for us.
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
>
>
>
