Message-ID: <1046196255.3e5bb01f900cd@lola.Pin.LU>
From: Christian Limpach <chris@pin.lu>
Subject: RE: [linux-lvm] Recovering from a hard crash
References: <8075D5C3061B9441944E1373776451180F06F7@cinshrexc03.shermfin.com>
In-Reply-To: <8075D5C3061B9441944E1373776451180F06F7@cinshrexc03.shermfin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Tue Feb 25 11:58:08 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Rechenberg, Andrew" <ARechenberg@shermanfinancialgroup.com>
Cc: linux-lvm@sistina.com

Quoting "Rechenberg, Andrew" <ARechenberg@shermanfinancialgroup.com>:

> Would I then use LVM striping across md[0-9] to get the same effect?
> The reason that this box is configured in such a way is because we want
> the redundancing of RAID1 and the speed of RAID0 (hence RAID10).  Will
> LVM striping give the same performance lift as using Linux RAID0?

I would think that performance will be the same.  I think you'll get better 
performance if you keep some disks apart for your snapshots.  Interesting 
actually...  Which is better:  all striped with md which puts the snapshot 
striped over all the disks or striping with LVM which will put the snapshot 
unstriped on dedicated disks or a combination of these two...

> Also, will the device mapper and LVM2 patches work against a Red Hat
> kernel and are they stable enough to run in a production environment?

device-mapper and LVM2 seem stable, I'm still using LVM1.  The device-mapper 
code is definitely top-notch.  I don't know about Red Hat kernels.

> Also, can anyone see any harm in me modifying the source for vgscan to
> skip /dev/md0 since it will never actually be used in a volume group
> outside of the RAID0 stripe on top of it?  Would I have to modify any
> other commands to make sure that I don't run into any trouble?

I think vgscan is all you need to modify, pvscan and lvmdiskscan just display 
data.  Removing/renaming /dev/md0 is just as good, nothing needs it anyway as 
far as I can tell...

-- 
Christian Limpach <chris@pin.lu>
