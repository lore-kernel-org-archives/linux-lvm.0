Return-Path: <lembark@wrkhors.com>
Message-ID: <3AFB9C00.3ABB90EB@wrkhors.com>
Date: Fri, 11 May 2001 03:00:00 -0500
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] SCSI/LVM problems after power outage
References: <DC5B1A21E9E7D211B0020090273AD628242BE0@summit15.corvallis.summit>
Content-Transfer-Encoding: 7bit
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

"Day, Evan" wrote:
> 
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

LVM -- or raid -- shouldn't normally be able to cause scsi-level 
errors.  ext2 might complain about hoked up data, but the scsi
stuff happens at the circut level.  looks like your disk got fried.

you might want to try running a low-level scsi check on the disk
(non-destructive, hopefully).  this would also be a really good
time to verify your backups...

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
