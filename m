Date: Mon, 6 Nov 2000 18:01:34 +0100
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] scsi/fc multipath failover patch
Message-ID: <20001106180134.U751@jadzia.josv.com>
References: <3A06D4BC.FE2819CE@dell.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A06D4BC.FE2819CE@dell.com>; from Michael_E_Brown@dell.com on Mon, Nov 06, 2000 at 09:56:44AM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael E Brown <Michael_E_Brown@dell.com>
Cc: linux-lvm@msede.com

Hi,

Does anyone know whether md, lvm and likeminded drivers are resistant
against this alternate pathing solution? I mean, when you connect a SCSI
(or FC disk for that matter) through two controllers, any application or
driver that does scanning of the attached disks and partitions will
encounter the same disk/partitions twice. 

In order to solve this, they must have some way of identifying the disk 
uniquely, and thus being able to conclude that they've seen it before.
HP-UX solves this by having a unique Pyshical Volume ID in the disk
header (PVID), thus it knows that a certain physical disk is an
alternate path for a disk that it has seen before.

Anyone any clues on how this is solved in a LinuxCare T3 patch/lvm/md
environment?

++Jos



And thus it came to pass that Michael E Brown wrote:
(on Mon, Nov 06, 2000 at 09:56:44AM -0600 to be exact)

> All,
>   I've been lurking on the list for a while, and I just found something
> that would probably be of great value to everyone. While I've heard
> people ask for it, I haven't seen anybody who knew of a patch to provide
> multipath failover for Linux.  Linuxcare developed multipath failover
> when they made the Sun T3 driver, although I haven't seen it publicized.
> Their kernel patch provides a generic multipath-failover layer for
> linux. The kernel patch is fairly small and clean, and comes with a
> couple userspace tools to set everything up. The URLS are below
> 
> http://open-projects.linuxcare.com/t3/   <--Generic project homepage
> http://open-projects.linuxcare.com/t3/download/sun-t3-0.3.1.tar.gz
> 
> cheers!
> Michael Brown

-- 
Success and happiness can not be pursued; it must ensue as the 
unintended side-effect of one's personal dedication to a course greater 
than oneself.
