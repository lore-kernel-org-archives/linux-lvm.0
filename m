Date: Sat, 22 Sep 2001 19:11:14 -0400 (EDT)
From: Shane Shrybman <shane@zeke.yi.org>
Message-ID: <Pine.LNX.4.21.0109221900090.23118-100000@zeke.goatskin.org>
MIME-Version: 1.0
Subject: [linux-lvm] e2fsck probs with LVM and 2.4.9-ac9+
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
To: linux-lvm mailing list <linux-lvm@sistina.com>

Hello,

When I attempted to upgrade to 2.4.9-ac9 and ac14 from 2.4.9-ac6 I ran
into a problem.

With either of these kernels (I didn't try any others between ac6 and
ac14) the kernel boots fine and lvm-mod gets loaded ok but when the first
filesystem that is on an lv gets mounted e2fsck complains and drops me to
admin prompt. The error message is something like this:

The filesystem size (according to the superblock) is 524288 blocks
the physical size of the device is 57344
...

When I reboot back into 2.4.9-ac6 everything is fine after e2fsck.

I have e2fsprogs version 1.19, do I need a more recent version?

Regards,

Shane


-- 
