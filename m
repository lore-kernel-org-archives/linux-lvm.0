Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 9 Jul 2001 08:40:31 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm on sparc 20
Message-ID: <20010709084031.A528@tykepenguin.com>
References: <Pine.LNX.4.33.0107081335390.3853-100000@willow.nutstreet.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0107081335390.3853-100000@willow.nutstreet.net>; from eric@nutstreet.net on Sun, Jul 08, 2001 at 01:44:29PM -0500
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

On Sun, Jul 08, 2001 at 01:44:29PM -0500, Eric Smith wrote:
> Hola!
> 
> I've had great success using LVM with my x86 systems.  But I'm trying it
> on my sparc 20 right now (RH 6.2, 2.2.19) and even though I've applied the
> patches I don't see LVM in the block devices config page.  I used a clean
> 2.2.19 kernel, _not_ the RH kernel.
> 
> Any ideas?
> 

Try this patch:

--- arch/sparc/config.in.orig   Mon Jul  9 08:36:13 2001
+++ arch/sparc/config.in        Mon Jul  9 08:36:15 2001
@@ -94,6 +94,8 @@
   tristate '   RAID-4/RAID-5 mode' CONFIG_MD_RAID5
 fi
 
+tristate 'Logical volume manager (LVM) support' CONFIG_BLK_DEV_LVM N
+
 tristate 'RAM disk support' CONFIG_BLK_DEV_RAM
 if [ "$CONFIG_BLK_DEV_RAM" = "y" -o "$CONFIG_BLK_DEV_RAM" = "m" ]; then
   int '   Default RAM disk size' CONFIG_BLK_DEV_RAM_SIZE 4096



patrick
