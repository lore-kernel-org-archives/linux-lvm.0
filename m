Message-ID: <3B97A5DB.8000203@st-peter.stw.uni-erlangen.de>
Date: Thu, 06 Sep 2001 18:35:39 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Root on LV
References: <OF44ABFE07.4419EBD8-ONC1256ABF.004C8662@ibcnet.hu> <3B978B57.8000208@st-peter.stw.uni-erlangen.de> <20010906093729.R32553@turbolinux.com>
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


Andreas Dilger wrote:

>On Sep 06, 2001  16:42 +0200, svetljo wrote:
>
>>it probably will hold the kernel also
>>and as far i know there is no bootloader which can access logical volume
>>am i wrong
>>
>
>Yes, you are wrong.  LILO+patch can get a kernel from a logical volume.
>Now that Linus has accepted my patch to fix LV_USER_BMAP from causing
>an oops I will submit the patch to the LILO maintainer.  It can also be
>found in the archives for this mailing list (have posted several times).
>
does this mean that i can have my kernel on LV of any type ( can i have 
it on striped one)
i think i have read some time ago that lilo can boot from linear RAID or 
RAID1 but not from RAID-0
