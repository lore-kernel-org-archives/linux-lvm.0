Date: Wed, 1 Nov 2000 01:34:33 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] Exporting VG
Message-ID: <20001101013433.B30322@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <20001031203559.A8120@gondor.com> <200010312105.e9VL5XY11520@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200010312105.e9VL5XY11520@webber.adilger.net>; from adilger@turbolinux.com on Tue, Oct 31, 2000 at 02:05:33PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

On Tue, Oct 31, 2000 at 02:05:33PM -0700, Andreas Dilger wrote:
> Jan writes:
> > > When you do vgexport, this does not do anything like NFS export (does NOT
> > > allow network access to the VG).  It allows you to physically move the
> > > disks to another machine.
> > 
> > Is vgexport/vgimport doing something important? I just moved a harddisk with
> > a vg to another computer without vgexport/vgimport and didnot notice any 
> > problems. Or is it only needed if I add a vg to an already running system?
> 
> I think the only thing that vgexport does is mark on disk that the VG
> is "exported" and not shown on vgscan or imported when a "vgchange -a"
> is done.

Correct.

> On AIX, there is no difference on disk for imported and exported
> VGs, the VG state is stored in a config file.
> 
> IMHO, we should not store this state in the VG, nor advocate running
> "vgscan" on each boot.

You are right that there is no need to run vgscan on each boot.
Nevertheless vgscan takes care of any changes in the i/o configuration of the
system in order to make physical volumes accessable using different
device nodes.

> From what I have read in the past on this mailing
> list, running vgscan on boot is likely to delete important info from
> /etc/lvmtab if there is a minor problem, that has to later be restored
> (if possible).

Assumed that it is really that likely it s rather easy to get /etc/lvmtab.d/
files containing the metadata copies back, because they are format
identical to /etc/lvmconf/ files.
/etc/lvmtab contains the 0 delimited volume group names.

> 
> It would be a lot safer to keep the state of LVM in /etc/lvmtab, and
> only add or remove VGs with administrator actions (explicit vgimport,
> vgexport, vgscan (for a new system or major problems).  This at least
> lets you know at boot time that a VG has a problem, rather than vgscan
> simply deleting it from lvmtab.

If we had a database keeping track of changes in the i/o configuration
of the system, we could run vgscan conditionally if needed. Because there's
none I recommended to run it at every boot to avoid i/o path inconsistencies.

> 
> What will make this a lot more likely is the work that Heinz is doing
> on PVIDs, so that you only store the VGID + vgname in /etc/lvmtab
> and then only the PVIDs in the VGDA.

/etc/lvmtab only contains the 0 delimited volume group names.

/etc/lvmtab.d/VolumeGroupName contains a metadata copy of the current
state of a volume group. In case of i/o configuration changes it is up
to vgscan to update this file's contents.
In order to do i/o to the physical volumes we need to know the actual
device node to access the device anyway. This could well happen at
vgchange time wich wouldn't be a valuable different solution.
We could change the concept though to deal with pv_uuids to access a device
in the kernel as well but we needed a mapping function between uuids and
device addresses within the kernel in order to achieve this.

> You don't have to worry about
> device names changing if disks are added/moved/removed, because you
> never depend on the device name.
> 
> PVIDs will also make vgimport much easier (like AIX) so you only specify
> a single device and the VGDA knows all of the PVIDs that belong to that
> volume group.

All right.
Need to implement vgimport support for this though....

> Using VG names is dangerous if you are moving VGs between
> systems in case the two systems have identical VG names.

That's why you should use vgexport/vgimport which avoids problems with
regard to identical volume group names.

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
