Return-Path: <root@srv.sistina.com>
Date: Wed, 9 May 2001 09:35:10 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] SCSI/LVM problems after power outage
Message-ID: <20010509093510.B4918@sistina.com>
References: <DC5B1A21E9E7D211B0020090273AD628242BE0@summit15.corvallis.summit>
Mime-Version: 1.0
In-Reply-To: <DC5B1A21E9E7D211B0020090273AD628242BE0@summit15.corvallis.summit>; from Evan.Day@SUMMITSITE.COM on Tue, May 08, 2001 at 02:05:16PM -0700
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

On Tue, May 08, 2001 at 02:05:16PM -0700, Day, Evan wrote:
> It looks like device 2 is having issues:
> 
> SCSI disk error : host 2 channel 0 id 2 lun 0 return code = 18000002
> 
> However, it has been several years since I worked with Sun machines, so I
> could be wrong.  Regardless, it doesn't sound like an LVM issue, but a
> hardware issue.  Unfortunately, I can't offer much recovery advice - most of
> my LVM experience is with HP-UX, and we use mirroring (RAID-1) at work -
> just unplug the bad drive, plug in a new one, and do a vgsync.  I think you
> can add a replacement drive to the VG and use pvmove to try and move the PEs
> from the bad drive to the new drive, but I wouldn't take my word for it...

In case the PEs on the flaky device are still readable:
extending your VG and using pvmove is the way to go.

Steps needed (crossing your fingers that the flaky drive can still stand this):

- install or use an additional drive of at least the size of the flaky one
- pvcreate that drive
- vgextend the VG by it
- pvmove /dev/FlakyDrive
- wait until pvmove is done
- vgreduce VG /dev/FlakyDrive

You should have your LVs offline in case you have an older version than
LVM 0.9.1 Beta 7, because they had a pvmove related bug which could cause
oopses when you moved PEs in use.

BTW: you need to configure MD (RAID 1 or 5) or use hardware raid subsystems
     to avoid suffering from such flaky disk problems.

Regards,
Heinz    -- The LVM Guy --


> 
> -----Original Message-----
> From: Dave Wapstra [mailto:dave@xs4all.nl]
> Sent: Tuesday, May 08, 2001 9:33 AM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] SCSI/LVM problems after power outage
> 
> 
> Hi all,
> 
> After a power outage, our ftp server with LVM has not survived very well.
> 
> System: UltraSparc II, Linux 2.4(2) + io.path + LVM 0.9.1beta6
> 
> All normal ext2 paritions were fsck'd fine, however, the volume is having
> problems.
> 
> The syslog has a lot of SCSI errors:
> 
> May  7 19:15:52 ftp kernel: sym53c8xx_reset: pid=0 reset_flags=1
> serial_number=0 serial_number_at_timeout=0
<SNIP>
> Read ahead sectors     120
> Block device           58:0
> 
> 
> -Dave
> 
> -- 
> Dave Wapstra
> dave@xs4all.nl
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
