Return-Path: <m.vd.brink@worldonline.nl>
From: Melis van den Brink <m.vd.brink@worldonline.nl>
Subject: Re: [linux-lvm] Missing (or double) logical volume after upgrade to 2.4.7 and beta8 (follow-up)
Date: Tue, 7 Aug 2001 20:36:11 +0200
References: <01080621060101.00882@giant.koningspage.nl>
In-Reply-To: <01080621060101.00882@giant.koningspage.nl>
MIME-Version: 1.0
Message-Id: <01080720361100.00789@giant.koningspage.nl>
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@sistina.com

On Monday 06 August 2001 21:06, you wrote:
> Hello,
>
> I'm experiencing a bit of trouble with LVM (just as I was becoming very
> happy with it :-().
> I had it running on a 2.4.6 kernel patched with the beta7 lvm-stuff and
> some patches from the reiserfs-guys. That was running quite fine.
> Today I performed the upgrade to linux 2.4.7 and lvm beta8. I followed the
> advice from the README.1st in upgrading to the new meta-format. I installed
> the beta8 tools and booted with the new kernel (including the patches from
> beta8). It seemed to be working until I discovered that one of my LV's was
> missing. Or better it showed the same filesystem as the one mounted on
> /var.
>
> I could try to fix it, but would like to know some options as I am fairly
> new to LVM.
> Attached is some information about the LVM-setup. I can give you some more,
> but I don't know what to provide you with...

OK,

The problem seems fixed (or at-least worked around): this particular LV/VG is 
on a SCSI-disk. The SCSI-subsystem as well as the SCSI-driver (aic7xxx.o) 
were loadable modules. Today I made a new kernel with these parts no longer 
as a module but in the kernel itself. The result: at boot/initialisation time 
the SCSI-system gets loaded, the SCSI-drives get their initialisation and LVM 
when "vgscan"-ing or "vgchange"-ing sees all the volumes.
Weird as it is: at the moment this doesn't work when the SCSI-stuff is 
compiled as a loadable module. Any suggestions: some change in the init-stuff 
(it's on a 7.2 Mandrake system) or is my current setup the only way to go.

Melis
