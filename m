Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 25 Apr 2001 08:35:38 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] I need to convert my root file system to LVM (adding a 2nd disk as well).
Message-ID: <20010425083538.B806@tykepenguin.com>
References: <200104241645.f3OGjE001662@west.navpoint.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200104241645.f3OGjE001662@west.navpoint.com>; from raheesom@navpoint.com on Tue, Apr 24, 2001 at 11:39:02AM -0400
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

On Tue, Apr 24, 2001 at 11:39:02AM -0400, Rupert Heesom wrote:
> My current partition config is -
> 
> Device Boot    Start       End    Blocks   Id  System
> /dev/sda1   *         1         3     24066   83  Linux
> /dev/sda2             4      1116   8940172+   5  Extended
> /dev/sda5             4      1099   8803588+  83  Linux
> /dev/sda6          1100      1116    136521   82  Linux swap
> 
> /dev/sda1 has /boot in it
> /dev/sda5 has / in it.
> 
> I will be adding a 2nd disk onto the PC (/dev/sdb).
> 
> >From what I read in the LVM-HOWTO, converting the root file system
> needs < 1/2 the disk to be full.  Mine is > 1/2 full (~70%).
> Apparantly one can convert the file system to LVM by 
> 
> 1) creating an LVM partition on the 2nd disk, then 
> 2) copying the root files to the LVM partition, then 
> 3) adding the original file system to LVM.
> 
> I'm not sure I want to do all that copying, etc.   Is it possible to -
> 1)  Convert 2nd disk to LVM  
> 2) extend the LV to the 1st disk.

Yes you should be able to do that. Follow the instructions in the HOWTO
(without shrinking the main disk obviously!) substituting hdb1 for hda4.

When you've got it working you can then make a PV on sda5 and 
pvmove hdb1 back onto it if you want to keep root on the SCSI disk.

If you're not very familiar with LVM I recommend you have a play with it on the
new disk before attempting to convert the root filesystem though.

patrick
