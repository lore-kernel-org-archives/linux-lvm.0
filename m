From: "Ryan Davis" <rrdavis@ucdavis.edu>
References: <016e01cf504d$68e3b0d0$3aab1270$@edu>	<5342A6A9.6060104@redhat.com>
	<5345703E.2050401@ucdavis.edu>	<5346A663.502@redhat.com>
	<006a01cf5b33$47f5bb20$d7e13160$@edu> <53564F0C.3080402@redhat.com>
In-Reply-To: <53564F0C.3080402@redhat.com>
Date: Tue, 22 Apr 2014 11:43:55 -0700
Message-ID: <007b01cf5e5a$d1293500$737b9f00$@edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Subject: Re: [linux-lvm] Can't mount LVM RAID5 drives
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'Peter Rajnoha' <prajnoha@redhat.com>
Cc: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi Peter,


Thanks for the support.

Everything ran smooth until I did a fsck on the FS on the LV.  It's
complaining about a bad superblock

[root@hobbes ~]# e2fsck -f -n /dev/vg_data/lv_home 
e2fsck 1.39 (29-May-2006)
e2fsck: Filesystem has unsupported feature(s) while trying to open
/dev/vg_data/lv_home

The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>


Should I now run mke2fs on the LV and see what happens?
#mke2fs -n /dev/vg_data/lv_home
And then try different superblocks.  I also found this:
http://docs.oracle.com/cd/E19455-01/805-7228/6j6q7uf0i/index.html



In the original reply we briefly touched on this:

On 04/04/2014 11:32 PM, Ryan Davis wrote:
> [root hobbes ~]# mount  -t ext4 /dev/vg_data/lv_home /home
> 
> mount: wrong fs type, bad option, bad superblock on /dev/vg_data/lv_home,
> 
>        missing codepage or other error
> 
>        (could this be the IDE device where you in fact use
> 
>        ide-scsi so that sr0 or sda or so is needed?)
> 
>        In some cases useful info is found in syslog - try
> 
>        dmesg | tail  or so
> 
>  
> 
> [root hobbes ~]# dmesg | tail
> 
>  
> 
> EXT4-fs (dm-0): unable to read superblock
> 
>  
> 

That's because an LV that is represented by a device-mapper
mapping doesn't have a proper table loaded (as you already
mentioned later). So such device is unusable until proper
tables are loaded...

> [root hobbes ~]# mke2fs -n /dev/sdc1
> 
> mke2fs 1.39 (29-May-2006)
> 
> Filesystem label=
> 
> OS type: Linux
> 
> Block size=4096 (log=2)
> 
> Fragment size=4096 (log=2)
> 
> 488292352 inodes, 976555199 blocks
> 
> 48827759 blocks (5.00%) reserved for the super user
> 
> First data block=0
> 
> Maximum filesystem blocks=4294967296
> 
> 29803 block groups
> 
> 32768 blocks per group, 32768 fragments per group
> 
> 16384 inodes per group
> 
> Superblock backups stored on blocks:
> 
>         32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632,
> 2654208,
> 
>         4096000, 7962624, 11239424, 20480000, 23887872, 71663616,
78675968,
> 
>         102400000, 214990848, 512000000, 550731776, 644972544
> 

Oh! Don't use the PV directly (the /dev/sdc1), but always use the
LV on top (/dev/vg_data/lv_home) otherwise you'll destroy the PV.
(Here you used "-n" so it didn't do anything to the PV fortunately.)
