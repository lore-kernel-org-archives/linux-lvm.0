Return-Path: <h.kerndler@jusline.com>
Message-ID: <3AF8B558.CBAB57EB@jusline.com>
Date: Wed, 09 May 2001 05:11:21 +0200
From: Harald Kerndler <h.kerndler@jusline.com>
MIME-Version: 1.0
Subject: Re: [Fwd: [linux-lvm] LVM export]
References: <3AF6A532.38B30041@lanzenberg.at>
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

We have found the command vgcfgrestore and we have him tested.
We have follow command used: vgcfgrestore -n vol0 /dev/hda4 and then comes this
error:
vgcfgrestore -- ERROR "pv_read(): PV exported" reading physical volume "/dev/hda4"

Is the VG demaged ?

>
>
>   ------------------------------------------------------------------------
>
> Subject: Re: [linux-lvm] LVM export
> Date: Mon, 7 May 2001 13:58:47 +0200
> From: Torsten Landschoff <torsten@pclab.ifg.uni-kiel.de>
> Reply-To: linux-lvm@sistina.com
> To: linux-lvm@sistina.com
> References: <3AF68126.93ACCE81@lanzenberg.at> <20010507134024.A26477@sistina.com>
>
> On Mon, May 07, 2001 at 01:40:24PM +0000, Heinz J. Mauelshagen wrote:
>
> > There's a hack to reactivate it in case you still have a valid VGDA backup,
> > but let me first understand what your actual problem is, before we can decide
> > to try that.
>
> I guess he tried to move a disk to a new one by exporting the volume
> group, moving the data onto the new disk and importing that one. I guess
> the solution would be to import the volume group from the old disk
> (assuming the data is still available on it) and using pvcreate,
> vgextend and pvmove to get the data on the new disk, the use vgreduce
> to remove the pv of the old disk and remove it from the system.
>
> Greetings
>
>         Torsten
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
>   ------------------------------------------------------------------------
>
> Subject: Re: [linux-lvm] LVM export
> Date: Mon, 7 May 2001 13:40:24 +0000
> From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
> Reply-To: linux-lvm@sistina.com
> To: linux-lvm@sistina.com
> References: <3AF68126.93ACCE81@lanzenberg.at>
>
> On Mon, May 07, 2001 at 01:04:06PM +0200, h.kerndler@lanzenberg.at wrote:
> > Hello !
> > Yesterday, I have tested the export/import Funktion from LVM.
> > I have exported the LVM, that has gone.
>
> Without further information, I can't provide a solution.
>
> Do you mean you successfully run "vgexport VGName" on your deactivated VG
> named "VGName"?
>
> > In the next step I would import the LVM on a other disk.
>
> What do you mean with "other disk"?
>
> The vgimport(8) command has the synopsis:
>
>    vgimport VGName PhysicalVolumePath [PhysicalVolumePath...]
>
> If you exported the VG just to test the feature as you mentioned,
> you should run pvscan which should list you all of the physical volume
> pathes belonging to the exported VG and feed those pathes into vgimport.
>
> See "man vgimport" for further details.
>
> > The LVM has not imported the LVM on a other disc, becaus I became a
> > Failure.
>
> What was the failure message?
>
> > My question, can I make a un-export on the old-disk?
>
> No, you can just import it.
>
> There's a hack to reactivate it in case you still have a valid VGDA backup,
> but let me first understand what your actual problem is, before we can decide
> to try that.
>
> >
> > Thanks, Harald
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
>
> --
>
> Regards,
> Heinz    -- The LVM Guy --
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--
mit freundlichen Gr��en
J�rgen Greil

JUSLINE - Direkt zu Ihrem Recht
http://www.jusline.com
e-mail: dev5@jusline.com
