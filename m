Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 7 Aug 2001 20:04:57 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Missing (or double) logical volume after upgrade to 2.4.7 and beta8 (follow-up)
Message-ID: <20010807200457.B15980@tykepenguin.com>
References: <01080621060101.00882@giant.koningspage.nl> <01080720361100.00789@giant.koningspage.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01080720361100.00789@giant.koningspage.nl>; from m.vd.brink@worldonline.nl on Tue, Aug 07, 2001 at 08:36:11PM +0200
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

On Tue, Aug 07, 2001 at 08:36:11PM +0200, Melis van den Brink wrote:
> 
> The problem seems fixed (or at-least worked around): this particular LV/VG is 
> on a SCSI-disk. The SCSI-subsystem as well as the SCSI-driver (aic7xxx.o) 
> were loadable modules. Today I made a new kernel with these parts no longer 
> as a module but in the kernel itself. The result: at boot/initialisation time 
> the SCSI-system gets loaded, the SCSI-drives get their initialisation and LVM 
> when "vgscan"-ing or "vgchange"-ing sees all the volumes.
> Weird as it is: at the moment this doesn't work when the SCSI-stuff is 
> compiled as a loadable module. Any suggestions: some change in the init-stuff 
> (it's on a 7.2 Mandrake system) or is my current setup the only way to go.

I would go with whatever works for you! All I can think of is that the SCSI
modules are loaded after vgscan runs. That would explain the output you posted
earlier.

patrick
