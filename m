Date: Tue, 28 Aug 2001 13:57:26 -0500
Message-ID: <20010828135726.A22794@beaver.iucha.org>
From: "Florin Iucha" <florin@iucha.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm-1.0.1-rc1 doesn't generate proper patch for linux-2.4.10-pre1
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

Hello,

There is a problem with generating the lvm-1.0.1-rc1 patch for kernel
2.4.10-pre1. 

The patched kernel will not compile because of the
   get_hardsect_size/get_hardblocksize problem that occured in the transition
from 2.4.2 to 2.4.3.

Thinking about it a little, it looks like the patching mechanism got confused
about the kernel version and generated a patch for 2.4.1 . I am not sure about
this and I have not investigated it, but it smells like it.

Please look into it.

florin

-- 

"If it's not broken, let's fix it till it is."

41A9 2BDE 8E11 F1C5 87A6  03EE 34B3 E075 3B90 DFE4
