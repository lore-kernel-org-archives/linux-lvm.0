From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] can i extend a volumen bigger 256 gigas ?thx
Message-ID: <20030505205754.GA15691@localhost>
References: <20030304114851.GA22965@hcsd.de> <3E64B885.1AF49EDA@silicide.dk> <20030304144121.GB23975@hcsd.de> <20030305143938.GI1513@gmx.de> <009601c3133d$fcdd24f0$ec36ca51@desi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <009601c3133d$fcdd24f0$ec36ca51@desi>
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
Date: Mon May  5 15:57:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Monday, 05 May 2003, at 21:39:04 +0200,
fnt wrote:

> It is possible to extend a volumen more than 256 gigas?
>
Yes.

> it doesnt let me grow the space.
> this is muy info :
> root]# cat /proc/lvm/global
> VG:  gl  [2 PV, 1 LV/1 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 294883328 /71993 total  113950720 /27820 used  180932608
>
Directly from vgcreate(8) (lvm2 tools, version 1.95.15-1 (Debian Sid)):

   To limit kernel memory usage,  there  is  a  limit  of  65536 physical
   extents  (PE) per logical volume, so the PE size determines the maximum
   logical volume size.  The default PE size of 4MB limits a single logi-
   cal  volume to 256GB (see the -s option to raise that limit). There is
   also (as of Linux 2.4) a kernel limitation of 2TB per block device.

As far as I remember, this limit is also there in LVM1.

Hope it helps.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.5.68)
