Message-ID: <39BD6CDE.821BADCE@artstor.de>
Date: Tue, 12 Sep 2000 01:38:06 +0200
From: Jan Strohbehn <j.strohbehn@artstor.de>
MIME-Version: 1.0
Subject: [linux-lvm] Re: LVM and I2O 
References: <39B68DB7.313C9669@marxmeier.com> <20000907160955.A21633@srv.t-online.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mauelshagen@Sistina.com, linux-lvm@msede.com


Hi,

I have tried all this but the error still appears. Here's the exact
error message:


root@bonita:~/ > mke2fs /dev/raid/vol1
mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
100352 inodes, 401408 blocks
20070 blocks (5.00%) reserved for the super user
First data block=1
49 block groups
8192 blocks per group, 8192 fragments per group
2048 inodes per group
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729, 204801, 221185
 
Writing inode tables: done
ext2fs_mkdir: Attempt to read block from filesystem resulted in short
read while creating root dir
root@bonita:~/ >


Do you have any other idea why this happens ???

Thanks,
Jan


"Heinz J. Mauelshagen" wrote:
> 
> Please look at tools/lib/lvm_dir_cache.c and extend the devdir array,
> tools/lib/lvm_check_dev + tools/lib/lvm_partition_count and extend the
> valid_majors array.
> 
> On Wed, Sep 06, 2000 at 08:32:23PM +0200, Michael Marxmeier wrote:
> >
> > Hello,
> >
> > I'm trying to get the newest lvm working on I2O-devices, but it seems
> > that the LVM-tools aren't able to recognize them. Has anyone a hint
> > are
> > an idea why this problem appears ???
> > Are there any workarounds ???
> >

