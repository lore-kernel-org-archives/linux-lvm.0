Return-Path: <root@srv.sistina.com>
Date: Tue, 5 Jun 2001 12:34:17 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems with 0.9.1b7 and 2.2.20-2
Message-ID: <20010605123417.A23541@sistina.com>
References: <20010605092436.B856@jaquet.dk>
Mime-Version: 1.0
In-Reply-To: <20010605092436.B856@jaquet.dk>; from rasmus@jaquet.dk on Tue, Jun 05, 2001 at 09:24:36AM +0200
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

Hi Rasmus.

On Tue, Jun 05, 2001 at 09:24:36AM +0200, Rasmus Andersen wrote:
> Hi.
> 
> I have built a 2.2.20-2 kernel with kiobuf-2.2.18pre24-B.tar.gz
> applied and patched with the patch lvm_0.9.1_beta7 created.
> 
> I have begun to get the following in my /var/log/messages in
> conjunction with various programs (tar, cp) failing:
> 
> Jun  4 21:55:05 firewall kernel: attempt to access beyond end of device 
> Jun  4 21:55:05 firewall kernel: 08:01: rw=0, want=530424, limit=410608 
> Jun  4 21:55:05 firewall kernel: dev 3a:03 blksize=1024 blocknr=622593 sector=1060840 size=4096 count=1 
> Jun  4 21:55:05 firewall kernel: EXT2-fs error (device lvm(58,3)): read_inode_bitmap: Cannot read inode bitmap - block_group = 19, inode_bitmap = 622593 
> Jun  4 21:55:05 firewall kernel: EXT2-fs error (device lvm(58,3)): ext2_check_inodes_bitmap: Wrong free inodes count in super block, stored = 307461, counted = 291461 
> 

This sounds like a well known ext2 problem.
Did you run fsck successfully? And if so, didn't it work again?


> 
> I can do a 'dd if=/dev/<diskX> of=/dev/null' for the disks that are
> part of the volume group without problems but if I do it for /dev/vg1/
> lvol4, I get the error above (without the EXT2-part).

Did you *really* run "dd if=/dev/vg1/lvol4 of=/dev/null" and got that error
in the log? Never have seen that before.

> 
> I am now trying to get whatever data I can off the FS and would like
> 1) helpful suggestions, and 2) to provide whatever feedback I can
> before I have to reclaim the disk space. Probably for something
> non-LVM for the moment.
> 
> Please mail me for additional information. I am rather new to LVM
> and have little clue as to what information you might find useful.
> -- 
>         Rasmus(rasmus@jaquet.dk)
> 
> Gates' Law: Every 18 months, the speed of software halves
>   -- Anonymous
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
