Return-Path: <setha@plaza.ds.adp.com>
Date: Wed, 27 Jun 2001 10:24:56 -0700
From: "Seth D. Alford" <setha@plaza.ds.adp.com>
Message-Id: <20010627102456.B9715@mallard.plaza.ds.adp.com>
References: <20010625100253.A2770@mallard.plaza.ds.adp.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010625100253.A2770@mallard.plaza.ds.adp.com>; from setha@plaza.ds.adp.com on Mon, Jun 25, 2001 at 10:02:53AM -0700
Subject: [linux-lvm] Re: pvcreate: possible problem near line 98 of lib/pv_get_size.c
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
Cc: "Seth D. Alford" <setha@plaza.ds.adp.com>

On Mon, Jun 25, 2001 at 10:02:53AM -0700, Seth D. Alford wrote:
> I'm trying to install RedHat 7.1 onto a system which has no existing partitions.
> I want one of the filesystems to be an LVM volume.  I modified the RH 7.1
> BOOT kernel to include an lvm-mod.o, and I managed to get the LVM binaries
> included in the ramdisk itself.  When I try to run pvcreate, though, it
> gets a segmentation fault.
> 
> The partitions which RedHat is trying to create are in /mnt/sysimage.
> Part of my installation process runs chrooted in /mnt/sysimage.

There appears to be a workaround: make sure that all the /dev/ entries
for the disk drives exist.  When we do that, the problem disappears.

--Seth
