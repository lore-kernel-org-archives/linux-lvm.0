Return-Path: <phillips@bonn-fries.net>
From: Daniel Phillips <phillips@bonn-fries.net>
Date: Sat, 14 Jul 2001 22:11:30 +0200
References: <E15LL3Y-0000yJ-00@the-village.bc.nu> <20010715025001.B6722@weta.f00f.org>
In-Reply-To: <20010715025001.B6722@weta.f00f.org>
MIME-Version: 1.0
Message-Id: <0107142211300W.00409@starship>
Content-Transfer-Encoding: 7BIT
Subject: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
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
To: Chris Wedgwood <cw@f00f.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Andrew Morton <andrewm@uow.edu.au>, Andreas Dilger <adilger@turbolinux.com>, "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

On Saturday 14 July 2001 16:50, Chris Wedgwood wrote:
> On Sat, Jul 14, 2001 at 09:45:44AM +0100, Alan Cox wrote:
>
>     As far as I can tell none of them at least in the IDE world
>
> SCSI disk must, or at least some... if not, how to peopel like NetApp
> get these cool HA certifications?

Atomic commit.  The superblock, which references the updated version 
of the filesystem, carries a sequence number and a checksum.  It is 
written to one of two alternating locations.  On restart, both
locations are read and the highest numbered superblock with a correct
checksum is chosen as the new filesystem root.

--
Daniel
