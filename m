From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] file system larger than lv
Message-ID: <20021115115831.B11618@sistina.com>
References: <OF1EE49BDF.AE37C6D0-ON86256C71.005578CE@TEXASMUTUAL.COM>
Mime-Version: 1.0
In-Reply-To: <OF1EE49BDF.AE37C6D0-ON86256C71.005578CE@TEXASMUTUAL.COM>; from JPolache@texasmutual.com on Thu, Nov 14, 2002 at 09:35:06AM -0600
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
Date: Fri Nov 15 05:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 14, 2002 at 09:35:06AM -0600, Jonathan S. Polacheck wrote:
> I posted the following to the ext2 help forum and got the included
> response;
> 
> By: jpolache ( Jon Polacheck )
>  reasize2fs fails
> 2002-11-13 13:23
> I have an lvm volume for my /usr filesystem on a Mandrake 8.1 server. I did
> a
> lvextend, and am now trying to resize the filesystem into the logical
> volume.
> 
> I went to runlevel 1, unmounted all my filesystems (umount -a) and ran
> e2fsck on /dev/sys/usr. I got output indicating that the superblock size
> was 793600 blocks and the "physical" size was 665600 blocks.
> 
> e2fsck ended with the following;
> 
> Error scanning inodes (336000): can't read next inode
> 
> /dev/sys/usr: 13494/400000 files (1.2% non-contiguous), 578502/793600
> blocks

This was the point in time were you better had stopped and asked for advice :(

> 
> When I then run resize2fs, I get the following output;
> 
> resize2fs: Can't read a block bitmap while trying to resize /dev/sys/usr.
> The file system on /dev/sys/usr is now 665600 blocks long.

Boom. As Ted said: your fs is now smaller and you lost data.

You probably didn't run lvextend but lvreduce instead, which made the logical
volume smaller that the actual filesystem (similar to configuring a partition
conatinig an ext2 fs smaller). LVM1 contains the e2fsadm tool which prevents
you form doing things like that.
The lvreduce alone wouldn't have been the end of the day, because you still had
the old configuration with the prevoius LV size and mapping in the LVM metadata
archive. Deactivating the VG and restoring that state of the metadata would
have cut it.

Now that you run resize2fs and Ted (the ext2/resize2fs guru) can't help
you, it is tape archive time :(


> 
> Any suggestions?
> 
> By: tytso ( Theodore Ts'o )
>  RE: reasize2fs fails
> 2002-11-14 07:28
> That's an LVM problem. e2fsck was very clear when it told you that device
> was smaller than the size specified in the superblock.
> 
> ...there was probably severe damage to the filesystem which was done,
> because resize2fs attempted to shrink the filesystem down to 665600 from
> the superblock size of 793600. But since LVM had apparently already gotten
> the idea that the device was now smaller, any data that was stored in the
> blocks between 665600 and 793600 has been lost.
> 
> ......................................................................................
> 
> Any suggestions as to how I can proceed from here?
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
