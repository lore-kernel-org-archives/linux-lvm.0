Message-ID: <3BBB78C0.3060004@st-peter.stw.uni-erlangen.de>
Date: Wed, 03 Oct 2001 22:44:48 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
References: <Pine.LNX.4.33.0110032051000.16480-100000@dunlop.dub.ie.alphyra.com>
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
>
>>i ment he could not patch cleanly vanila 2.4.9 with lvm-0.9.1beta7, and 
>>he is using beta7 tools with beta2 kernel code
>>
>
>see my 2nd mail. it's 2.4.9 patched with beta7:
>
my mistake

>
>[root@dunlop tmp]# cat /proc/lvm/global 
>LVM driver version 0.9.1_beta7 (10/04/2001)
>
>the 1.0.1rc3 tools should be compatible, in fact they are, cause 
>vgscan and vgdisplay work fine.
>
they should, but  i had a problem some time ago with lvm-1.0 kernel code 
and lvm-1.0.1rc2 tools
xxscan and xxdisplay worked but when i tried to make a VG/LV to change 
the name or the size
it didn't work, the tools segfaultet 

>
>--paulj
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
