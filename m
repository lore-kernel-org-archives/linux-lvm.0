Message-ID: <3BBB69B1.8060901@st-peter.stw.uni-erlangen.de>
Date: Wed, 03 Oct 2001 21:40:33 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
References: <Pine.LNX.4.33.0110031956510.16480-100000@dunlop.dub.ie.alphyra.com> <3BBB6328.8020504@st-peter.stw.uni-erlangen.de> <20011003133021.K8954@turbolinux.com>
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

>
>Actually no, you _should_ be able to use different kernel and tools
>together _provided_ that the IOP version is the same.  Conversely,
>no changes should be made to the tools which break the IOP verion
>(either by forcing it to change under 2.4 kernels if it is not needed,
>or by changing the data structures and NOT updating the IOP version).
>
so i'm wrong

>>in the case with 0.9.1beta7,
>>i didn't know that it is possible to use any lvm code prior lvm-1.0.1rc1
>>( the min -max changes in linus's 2.4.9 -- the reason for lvm-1.0.1rc1)
>>and thats making me to think that you didn't patch the kernel,
>>the plain kernel comes with lvm-0.9.1beta2
>>so see again the begining 
>>
>
>The min/max issues are easily fixed (and have been reverted in 2.4.10).
>Also, the tool version and kernel version SHOULD NOT need to match
>exactly (that's what IOP is for).
>
i ment he could not patch cleanly vanila 2.4.9 with lvm-0.9.1beta7, and 
he is using beta7 tools with beta2 kernel code
