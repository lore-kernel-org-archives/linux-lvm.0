Return-Path: <root@srv.sistina.com>
Date: Mon, 7 May 2001 13:40:24 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM export
Message-ID: <20010507134024.A26477@sistina.com>
References: <3AF68126.93ACCE81@lanzenberg.at>
Mime-Version: 1.0
In-Reply-To: <3AF68126.93ACCE81@lanzenberg.at>; from h.kerndler@lanzenberg.at on Mon, May 07, 2001 at 01:04:06PM +0200
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

On Mon, May 07, 2001 at 01:04:06PM +0200, h.kerndler@lanzenberg.at wrote:
> Hello !
> Yesterday, I have tested the export/import Funktion from LVM.
> I have exported the LVM, that has gone.

Without further information, I can't provide a solution.

Do you mean you successfully run "vgexport VGName" on your deactivated VG
named "VGName"?

> In the next step I would import the LVM on a other disk. 

What do you mean with "other disk"?

The vgimport(8) command has the synopsis:

   vgimport VGName PhysicalVolumePath [PhysicalVolumePath...]


If you exported the VG just to test the feature as you mentioned,
you should run pvscan which should list you all of the physical volume
pathes belonging to the exported VG and feed those pathes into vgimport.

See "man vgimport" for further details.

> The LVM has not imported the LVM on a other disc, becaus I became a
> Failure.

What was the failure message?

> My question, can I make a un-export on the old-disk?

No, you can just import it.

There's a hack to reactivate it in case you still have a valid VGDA backup,
but let me first understand what your actual problem is, before we can decide
to try that.

> 
> Thanks, Harald
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
