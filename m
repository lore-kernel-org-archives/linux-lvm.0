Date: Thu, 06 Sep 2001 00:02:31 +0200
From: Olivier Sessink <olivier@lx.student.wau.nl>
Subject: Re: [linux-lvm] PBs with LVM over software RAID
In-reply-to: <3B900E92.7060607@st-peter.stw.uni-erlangen.de>; from
 galia@st-peter.stw.uni-erlangen.de on Sat, Sep 01, 2001 at 12:24:18AM +0200
Message-id: <20010906000231.A4373@fender.fakenet>
MIME-version: 1.0
Content-disposition: inline
References: <3B8E3F0E.8050609@st-peter.stw.uni-erlangen.de>
 <20010830083546.A20989@sistina.com>
 <3B8EC633.40202@st-peter.stw.uni-erlangen.de>
 <3B8F8C5E.7030603@st-peter.stw.uni-erlangen.de>
 <20010831110512.V541@turbolinux.com>
 <3B8FD95C.60702@st-peter.stw.uni-erlangen.de>
 <20010831130718.C541@turbolinux.com>
 <3B900E92.7060607@st-peter.stw.uni-erlangen.de>
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

On  0, svetljo <galia@st-peter.stw.uni-erlangen.de> wrote:
> hi
> it works with IMB's JFS
> when i try mkfs -t reiserfs -f /dev/myData/SRC it segfaults :
> 
> [root@svetljo mnt]# mkfs -t reiserfs -f /dev/myData/SRC
> mkreiserfs, 2001 - reiserfsprogs 3.x.0j
> ===================================================================
> LEAF NODE (8211) contains level=1, nr_items=2, free_space=3932 rdkey
> -------------------------------------------------------------------------------
> |###|type|ilen|f/sp| loc|fmt|fsck|                   
> key                      |
> |   |    |    |e/cn|    |   
> |need|                                            |
> -------------------------------------------------------------------------------
> Segmentation fault
> 
> isn't that a bit strange that reiserfs and xfs doesn't handle it, but 
> jfs does

reiserfs is known to stress hardware more, a lot of people with
almost-stable hardware get problems when using reiserfs. XFS might behave
the same. Test your system using memtest86, and run 'make -j3 clean bzImage'
in a loop for a while to check if your hardware is OK.

regards,
	Olivier
-- 
begin signature_virus.TXT.vbs
Hi, I'm a signature virus. plz set me as your signature and help me
spread :)
end
