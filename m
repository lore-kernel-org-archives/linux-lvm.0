Message-ID: <3B96A4CC.2080701@st-peter.stw.uni-erlangen.de>
Date: Thu, 06 Sep 2001 00:18:52 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PBs with LVM over software RAID
References: <3B8E3F0E.8050609@st-peter.stw.uni-erlangen.de> <20010830083546.A20989@sistina.com> <3B8EC633.40202@st-peter.stw.uni-erlangen.de> <3B8F8C5E.7030603@st-peter.stw.uni-erlangen.de> <20010831110512.V541@turbolinux.com> <3B8FD95C.60702@st-peter.stw.uni-erlangen.de> <20010831130718.C541@turbolinux.com> <3B900E92.7060607@st-peter.stw.uni-erlangen.de> <20010906000231.A4373@fender.fakenet>
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

i'll do the loop and i already did the memtest86 i had no probs
and what about mke2fs it also segfaults
and when it stresses the hardware why didn't it crashed the system and 
only segfaults without errors ?

Olivier Sessink wrote:

>On  0, svetljo <galia@st-peter.stw.uni-erlangen.de> wrote:
>
>>hi
>>it works with IMB's JFS
>>when i try mkfs -t reiserfs -f /dev/myData/SRC it segfaults :
>>
>>[root@svetljo mnt]# mkfs -t reiserfs -f /dev/myData/SRC
>>mkreiserfs, 2001 - reiserfsprogs 3.x.0j
>>===================================================================
>>LEAF NODE (8211) contains level=1, nr_items=2, free_space=3932 rdkey
>>-------------------------------------------------------------------------------
>>|###|type|ilen|f/sp| loc|fmt|fsck|                   
>>key                      |
>>|   |    |    |e/cn|    |   
>>|need|                                            |
>>-------------------------------------------------------------------------------
>>Segmentation fault
>>
>>isn't that a bit strange that reiserfs and xfs doesn't handle it, but 
>>jfs does
>>
>
>reiserfs is known to stress hardware more, a lot of people with
>almost-stable hardware get problems when using reiserfs. XFS might behave
>the same. Test your system using memtest86, and run 'make -j3 clean bzImage'
>in a loop for a while to check if your hardware is OK.
>
>regards,
>	Olivier
>
