Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 27 Mar 2001 11:01:58 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM, lilo and MBR?
Message-ID: <20010327110158.A2403@tykepenguin.com>
References: <m2g0fzsghb.fsf@isnogud.escape.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m2g0fzsghb.fsf@isnogud.escape.de>; from urs@isnogud.escape.de on Tue, Mar 27, 2001 at 11:34:08AM +0200
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

On Tue, Mar 27, 2001 at 11:34:08AM +0200, Urs Thuermann wrote:
> 
> 1. Is the first sector of a PV volume use by LVM or can I pvcreate
>    /dev/sda and still use the MBR of /dev/sda to boot the system?
>    Where does the VGDA start and how large is it?

Yes it is. Don't run LILO on /dev/sda if it's a PV because it will destroy it.
You should partition the disk into /dev/sda1 (that way the PV will start further
in and leave space for LILO)
 
> 2. IIRC, someone had a patch for lilo to load the kernel and initrd
>    image from a LV.  Where can I get it?  And will it go into the
>    standard lilo package?

Andreas will be along in a moment !

patrick
