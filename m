From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] First try, first fail with LVM.
Message-ID: <20040116111752.GF2837@redhat.com>
References: <20040114214802.24043.55903.Mailman@hermes.sistina.com> <000801c3dae7$ed845880$0201a8c0@kylie>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000801c3dae7$ed845880$0201a8c0@kylie>
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
Date: Fri Jan 16 08:57:05 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 14, 2004 at 10:46:43PM +0100, Roger Eriksson wrote:
> I'm new at this list and new with linux lvm.
> 
> The story this far. I bought a new hard disk to my file server at home and
> decided to reinstall the thing with a newer version of Linux (Red Hat 6.2
> before, now Mandrake 9.2). I decided to go with LVM and reiserfs, during the
> setup of Mandrake 9.2.

Roger,

we've got one problem report which might be related, where LVM fails to
create UUIDs on Mandrake which is probably related to /dev/urandom used
by LVM to retrieve random numbers. Check if /dev/urandom exists and
is readable.

Please check with pvdisplay on all you PVs and "vgdisplay -D" if
they have UUIDs set fine and report results here.

Regards,
Heinz    -- The LVM Guy --


> 
> On the server I have two sets of disks. Three 4.6 Gb SCSI disks that I
> joined together using LVM and three larger IDE disks that I also joined
> together. Everything went well and I started to copy back the files that I
> earlier copied to my Window and Linux desktop computers. No problems with
> that and since it got late a set the computers to move the files back and
> went to bed. The next morning when I checked the damn thing it had rebooted
> and reiserfs said that it couldn't find a file system on the IDE set. Now,
> after carefully examined the situation I think that it might have something
> to do with LVM. It seems like one disk is missing from the vg.
> 
> This is the things I've done (from notes on paper, so it's not the real
> output from the screen):
> 
> > fdisk /dev/hda
> 
> Device	boot	start	end	blocks	id	system
> /dev/hda1	*	1	13	104391	03	Linux		
> /dev/hda2		14	2482	19832242	5	Extended
> /dev/hda3		14	2482	19832211	8e	Linux lvm
> 
> > fdisk /dev/hdb
> Device	boot	start	end	blocks	id	system
> /dev/hdb1	*	1	5005	40202631	8e	Linux lvm
> 
> > fdisk /dev/hdc
> Device	boot	start	end	blocks	id	system
> /dev/hdc1	*	1	19929	160079661	8e	Linux lvm
> 
> > vgscan
> vgscan -- found active volume group "SystemVolume"
> vgscan  -- ERROR "vg_read_with_pv_and_lv() : current PV" can't get data of
> volume group "DataVolume" from physical volume(s)
> ...
> 
> > pvscan
> -- active PV "/dev/scsi//host0/bus0/target8/lun0/part1" of VG "SystemVolume"
> [4.22 GB/0 free]
> -- active PV "/dev/scsi//host0/bus0/target9/lun0/part1" of VG "SystemVolume"
> [4.22 GB/0 free]
> -- active PV "/dev/scsi//host0/bus0/target10/lun0/part1" of VG
> "SystemVolume" [4.22 GB/0 free]
> -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part5" is associated to
> unknown VG "DataVolume" (run vgscan)
> -- inactive PV "/dev/ide/host0/bus0/target1/lun0/part1" is associated to
> unknown VG "DataVolume" (run vgscan)
> -- total : 5 [70.01 GB] / in use : 5 [70.01 GB] / in no VG : 0 [0]
> 
> 
> And, as I told you, this is my first try with linux lvm. Not sure what to do
> now and I rather try to find some answers before I make a mess on my own. I
> would like to save the files from the system if possible, but it's nothing
> that I can't replace (what I can't replace I have on tapes also).
> 
> Any suggestions how to solve this situation?
> 
> Thank's for reading.
> 
> /Roger E
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
