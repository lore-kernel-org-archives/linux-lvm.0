From: Andreas Dilger <adilger@turbolabs.com>
Date: Fri, 14 Sep 2001 09:52:31 -0600
Subject: Re: [linux-lvm] Re: =?unknown-8bit?B?W2xp?=
	=?unknown-8bit?Q?nux-lvm=5D_Verst=E4ndnis?= von Stripes bei LVM
Message-ID: <20010914095230.S1541@turbolinux.com>
References: <4C45858D148AD411A8B800A024B36E5009F4C994@granada.fhm.de> <20010914121333.A11814@dragon.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010914121333.A11814@dragon.blacknet.de>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sep 14, 2001  12:13 +0200, Goetz Bock wrote:
> On Fri, Sep 14 '01 at 11:32, Pawlowski Julian wrote:
> > ich habe eine Frage zur Funktion von Stripes beim LVM. Wof?r genau
> > ben?tigt man diese Funktion? Wird damit das LV auf mehrere der reellen
> > Partitionen zwecks Performancegewinn verteilt?
>
> Yes, that's exactly the intended bahaviour. if you have n (e.g. 2 or
> more) PV than a striped LV is splitted between this n PV. This can
> increase performance (like RIAD0 does) but it may backfire, if your PV
> are on the same reald device.
> If you want to use striped LVs, only use one PV per real device.
> 
> e.g.: 4 HDDs of 40GB each (sda, sdb, sdc, sdd)
> 
> you boot from sda and decide to have a 512MB root/boot partition for
> this. Than make 3 swap partitiones on sdb, sdc and sdd.
> 
> on each device make a seccond partition with the rest of the space.
> create a PV out of each of this 4 partitions.
> 
> you now have:
> 
> sda: sda1    512MB  root/boot
>      sda2   39.5GB  PV1
> sdb: sdb1    512MB  swap
>      sdb2   39.5GB  PV2
> sdc: sdc1    512MB  swap
>      sdc2   39.5GB  PV3
> sdd: sdd1    512MB  swap
>      sdd2   39.5GB  PV4
> 
> VG1:       118.0GB  PV1 PV2 PV3 PV4
> 
> if you now make a striped LV of 20GB it will use 5GB on each PV and the
> stripes will be read from PV1 PV2 PV3 PV4 PV1 PV2 PV3 PV4 ...

A note here - very rarely can one really get the theoretical performance
from striped LVs.  There are several problems with stipes:

- bus bandwidth is often limited, so you often do not get N*disk_bandwidth
- application bandwidth is often limited, so you do not NEED N*disk_bandwidth
- for EACH read from a striped LV, you need to seek all disks to that
  spot, which means you often have to wait for the MAXIMUM seek time
  of all disks.  With non-striped LVs, you can do parallel read/write
  from different parts of the each disk (e.g. /usr, /home, /var, swap)
- if you have problems with ANY disk, you have lost ALL of your data

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
