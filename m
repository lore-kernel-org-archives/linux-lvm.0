Date: Wed, 3 Oct 2001 20:52:35 +0100 (IST)
From: Paul Jakma <paulj@alphyra.ie>
Subject: Re: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
In-Reply-To: <3BBB69B1.8060901@st-peter.stw.uni-erlangen.de>
Message-ID: <Pine.LNX.4.33.0110032051000.16480-100000@dunlop.dub.ie.alphyra.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, 3 Oct 2001, svetljo wrote:

> i ment he could not patch cleanly vanila 2.4.9 with lvm-0.9.1beta7, and 
> he is using beta7 tools with beta2 kernel code

see my 2nd mail. it's 2.4.9 patched with beta7:

[root@dunlop tmp]# cat /proc/lvm/global 
LVM driver version 0.9.1_beta7 (10/04/2001)

the 1.0.1rc3 tools should be compatible, in fact they are, cause 
vgscan and vgdisplay work fine.

--paulj
