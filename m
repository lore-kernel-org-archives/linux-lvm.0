Message-ID: <3E70411C.AC385DAD@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Help: LVM on top of SW RAID0+1
References: <Pine.LNX.4.53.0303121824410.2531@light.webcon.net>
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
Date: Thu Mar 13 02:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"Ian E. Morgan" wrote:
> 
> Current config:
> 
> md1: raid0 of hda3, hdb3
> md2: raid0 of hdc3, hdd3
> md3: raid1 of md1, md2

hmm. I tried various combinations of raid0 and raid1 ontop
of each other. One combination had a REALLY REALLY severe
performance penalty.


> md1 was created first, and is currently one big PV in VG "foo".
> 
> md2 was created identically to md1, and then md3 was created causing md2 to
> be synced to be identical to md1.
> 
> I would now like VG "foo" to use md3 instead of md1.
> 
> I tried:
> 
> # vgexport foo
> # vgimport foo /dev/md3
> 
> This seemed to suceed, but vgdisplay says that VG "foo" is still only using
> PV md1.
> 
> It seems that pvscan and friends see md[123] all as belonging to VG "foo".
> 
> How do I make LVM ignore md1 and md2, and force only md3 to be used on VG
> "foo"?

shut down the raid.
use only md1.
Make md2 and md3, with md1 MARKED AS FAILED.
create new VG, move data.
mark md1 okay, and include it into md3 with mdadm/raidhotadd




JonB
