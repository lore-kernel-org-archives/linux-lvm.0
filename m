Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A64338A@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] about to give up
Date: Wed, 11 Jul 2001 10:30:10 -0500
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

perhaps just blowing away your VG, then re-setting the volumes as PVs in
that vg, then growing them one at a time?

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Eli Criffield [mailto:eli@zendo.net]
> Sent: Wednesday, July 11, 2001 8:30 AM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] about to give up
> 
> 
> 
> Well I've run out of things to try and am about to start the 
> process of
> reinstalling everything. But i thought I'd give it one last 
> try to see if
> anyone had any ideas?
> 
> The story goes, I have three partitions on one hard drive 
> /dev/hda1 (a 30
> meg /boot) /dev/hda2, and /dev/hda3 are both LVM.
> 
> /dev/hda3 was the only LVM partition. I vgextened to include 
> /dev/hda2,
> then rebooted and now vgscan finds no volume groups.
> 
> pvscan only shoes that /dev/hda3 is part of a volume group 
> and doesn't see
> anything about /dev/hda2
> 
> uud_fixer gives me 
> #./uuid_fixer /dev/hda2 /dev/hda3
> /dev/hda2 - pv_read{}: PV identifier invalid 
> 
> but if i run it just against /dev/hda3 i get
> #./uuid_fixer /dev/hda3                                               
> Error: number of PVs passed in does not match number of PVs 
> in /dev/hda3s       
> VG                                                            
>                   
> 1 PVs where passed in and 2 where expected        
> 
> #pvdata -U /dev/hda2 gives
> pvdata -- ERROR "pv_read{}: PV identifier invalid" reading 
> physical volume       
> uuid list from physical volume "/dev/hda2"   
> 
> #pvdata -U /dev/hda3 gives
> --- List of physical volume UUIDs ---                         
>                    
>                                                               
>                   
> 000: elhLXoMw5J8qaEgN2DzEYoWoqhqH7H5a                         
>                   
> 001: 9AoOf5F6c58dcyJ30pfwNp153TI5PjLF 
> 
> 
> So /dev/hda2 has no information about being in volumegroup rootvg but
> rootvg thinks it is, or at least thats as near as i can tell what's
> wrong. Is there some way to remove /dev/hda2 from the volume 
> group even if
> i can't find it with vgscan. Is there some way to change 
> /dev/hda2 so it
> thinks there it is part of the volume group?
> 
> 
> Thanks again for any help
> 
> 
> eli
> 
