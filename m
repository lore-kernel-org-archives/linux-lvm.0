From: "Jonathan DeHaan" <jdehaan@home.com>
Subject: RE: [linux-lvm] PBs with LVM over linear software RAID ( and XFS ? ext2 reiserfs?)-2.4.7-2.4.4-2.4.5
Date: Sat, 8 Sep 2001 15:13:47 -0400
Message-ID: <000b01c1389a$62777700$0400a8c0@ci696011a.lxintn1.ky.home.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <3B9A02B3.1090006@st-peter.stw.uni-erlangen.de>
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

I've tried my setup with linear RAID and had no problems.
Can you send me your .config file, and I will try to build a kernel for you?
Perhaps it is a compiler problem.

Jonathan DeHaan
jdehaan@home.com

> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of svetljo
> Sent: Saturday, September 08, 2001 7:36 AM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] PBs with LVM over linear software RAID ( and XFS ?
> ext2 reiserfs?)-2.4.7-2.4.4-2.4.5
>
>
> Hi again the mail-server in the student residence was down for 2
> days,but here are the results
>
> vanila 2.4.4 lvm-1.0 and vanila 2.4.5 lvm-1.0
> ----------------------------------------------------------
> mke2fs and mkreiserfs segfaults , nothing in 'demsg | ksymoops'
>
> vanila 2.4.4 lvm-1.0 and vanila 2.4.5 lvm-1.0 with JFS-patch aplied
> ------------------------------------------------------------------
> ----------------------
> mke2fs and mkreiserfs segfaults, nothing in 'demsg | ksymoops'
> jfs seems to work
>
> any ideas
>
> probably from the beginning the name of the thread was wrong
> it had to be more accurate
>
> and i'm wondering whether there is smbd with working LVM over _linear
> software RAID_
>
> i'm going to checkout the XFS-tree and the LVM-tree
> ( there are raid fixes from Neil Brown in 2.4.10pre5 )
> and try again
> and run the benchmarks over the weekend
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
