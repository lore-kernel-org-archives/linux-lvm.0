Return-Path: <michael@visi.com>
Date: Sun, 27 May 2001 12:01:29 -0500
From: idsfa@visi.com
Subject: Re: [linux-lvm] LVM and *bad* performance (counterexample)
Message-ID: <20010527120129.A4460@mitethe.eudyptes>
References: <m2ofsguzp5.fsf@isnogud.escape.de> <200105270747.f4R7lIYa005098@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200105270747.f4R7lIYa005098@webber.adilger.int>; from adilger@turbolinux.com on Sun, May 27, 2001 at 01:47:18AM -0600
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

On Sun, May 27, 2001 at 01:47:18AM -0600, Andreas Dilger wrote:

> I'm not sure if it is an SMP or SCSI issue, or what.  Urs, do you also
> have an SMP system?  Maybe there are locking slowdowns under SMP and
> not under UP?

I haven't got a UP kernel to test right now to confirm, but my SMP
purely IDE system (specs follow) shows rough parity at 512 byte
reads and 2x FASTER on the LV at 4096 byte blocks.  When I switch
to a striped LV I see parity at both sizes, with the LV being
slightly faster.  For giggles, I also checked out a RAID-1 (mirror)
set as well, which smoked everything, as it should.

Device                 Block     Real          User          Sys
/dev/md0                512     2.080s        0.110s        0.660s
/dev/hda1               512     5.079s        0.140s        2.040s
/dev/mitethe/nostripe   512     4.795s        0.300s        2.380s
/dev/mitethe/stripe     512     4.350s        0.090s        2.530s

/dev/md0                4096   16.482s        0.060s        6.090s
/dev/mitethe/nostripe   4096   26.278s        0.010s        7.270s
/dev/mitethe/stripe     4096   32.803s        0.170s       12.020s
/dev/hda1               4096   40.947s        0.180s       13.590s


Now comes the part where I admit we're comparing apples to oranges:

Linux 2.4.3
LVM   0.9.1_beta7
2x Pentium III 600MHz
Tyan Tiger 133 Mobo (running at 133 FSB)

Maxtor 53073U6		30GB ATA/66    hda
WDC WD300AB-00BVA0	30GB ATA/66    hdc

/dev/hda:
 multcount    = 16 (on)
 I/O support  =  1 (32-bit)
 unmaskirq    =  1 (on)
 using_dma    =  1 (on)
 keepsettings =  0 (off)
 nowerr       =  0 (off)
 readonly     =  0 (off)
 readahead    =  8 (on)
 geometry     = 59554/16/63, sectors = 60030432, start = 0

/dev/hdc:
 multcount    = 16 (on)
 I/O support  =  1 (32-bit)
 unmaskirq    =  1 (on)
 using_dma    =  1 (on)
 keepsettings =  0 (off)
 nowerr       =  0 (off)
 readonly     =  0 (off)
 readahead    =  8 (on)
 geometry     = 58168/16/63, sectors = 58633344, start = 0

-- 
$ fortune -m Kellen
