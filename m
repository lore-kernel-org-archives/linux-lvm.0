Message-ID: <3B96757E.9010201@st-peter.stw.uni-erlangen.de>
Date: Wed, 05 Sep 2001 20:57:02 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PBs with LVM over software RAID ( and XFS ? ext2 reiserfs?)
References: <B45465FD9C23D21193E90000F8D0F3DF404FF5@mailsrv.linkvest.com> <3B95E36E.6070703@st-peter.stw.uni-erlangen.de> <20010905120549.H32553@turbolinux.com> <3B966C63.7080309@st-peter.stw.uni-erlangen.de> <20010905123211.J32553@turbolinux.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

i can not understand one thing

Andreas Dilger wrote:

>If you had one that previously worked, then start with that one and
>work forwards until it stops working (maybe dividing the kernel version
>numbers in half for each try to narrow it down quicker).
>
i maked the VG and the LV's under 2.4.9-xfs lvm-1.0.1rc1
but i had the XFS- mount problem with it and JFS had no problems
and i upgraded to 2.4.10-pre2-xfs lvm-1.0.1rc2 and had no problems with 
JFS and XFS
i tried with 2.4.9-ac5 lvm-1.0 and vanila 2.4.9 lvm-1.0.1rc1
with all these kernels it seemd that the LVM is working but i couldn't 
format the LV with reiserfs and ext2
mke2fs and mkreiserfs simply segfaults without errors

>If you have never had this working properly, try some early kernel like
>2.4.5 and see if it works.  If not then I suspect you have a RAM problem,
>and you may want to swap/remove SIMM/DIMMs to see if you can isolate it.
>
i can not understand why do you think that i could have RAM problems
if i had RAM problems why would XFS and JFS working without problem and
mke2fs and mkreiserfs segfaulting

>
>There is a whole document in linux/Documentation/, like Oops-tracing.txt,
>BUG-HUNTING, etc.
>
i'll take a look at it

>
>Nobody HAS to help you with this problem (and it seems the Sistina
>folks are quiet on this issue) because you are not paying them anything.
>That is one of the good/bad features of Linux - you can _usually_ get
>free support for a problem, but you may have to do it yourself too.
>
>Cheers, Andreas
>
i know that and i really appreciate that you are trying to help me
