Message-ID: <20030321122848.GA3352@birko.cjb.net>
Mime-Version: 1.0
Content-Disposition: inline
From: Dave Lister <dave@birko.cjb.net>
Subject: [linux-lvm] ext2resize "compat 20 feature" error
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
Date: Fri Mar 21 06:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM Mailing List <linux-lvm@sistina.com>

Hi, I've recently set up LVM on my computer. I've created VG "birko"
and on that, LV "share" (ext3). Later, I added two other disks to VG
"birko" and lvextend-ed "share". Everything worked fine until I've 
tried to ext2resize LV "share". This error message emerged:

# ext2resize /dev/birko/share
ext2resize v1.1.17 - 2001/03/18 for EXT2FS 0.5b
ext2resize: ext2_open: fs has unsupported feature(s) enabled: compat 20ext2resize: can't open /dev/birko/share

See, I'd like to use all of that 134.90GB available to the LV, but
I just cannot resize it's filesystem. :(
Any help much appreciated!! Thank you.

Dave


Additional information follows...

# lvdisplay /dev/birko/share
--- Logical volume ---
LV Name                /dev/birko/share
VG Name                birko
LV Write Access        read/write
LV Status              available
LV #                   4
# open                 1
LV Size                134.90 GB
Current LE             34534
Allocated LE           34534
Allocation             next free
Read ahead sectors     1024
Block device           58:3

# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda5             1.9G  1.7G  190M  90% /
/dev/hda6             244M  135M   96M  59% /var
/dev/hda7             244M  4.8M  226M   3% /tmp
/dev/birko/home        12G  5.6G  5.8G  49% /home
/dev/birko/share       99G   27G   73G  27% /mnt/share
