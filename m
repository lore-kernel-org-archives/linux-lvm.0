Message-ID: <3D358A8D.27A77928@mooncrest.net>
From: Yossi <yossi@Mooncrest.Net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] upgrade to rh7.3 broke lvm
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
Date: Wed Jul 17 10:11:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Upgraded from RH7.1 to RH7.3. The 7.1 was built with the lvm patch to
the kernel. The 7.3 RH kernel has lvm built in. After the upgrade, I
receive the message "/dev/mg0 not a block device" when I try to mount
it. I tried exporting the vg and importing it without errors but it
still doesn't mount. I suspect that this may be due to different
versions of the kernel part of the lvm versus the usermode parts of lvm.

Thanks for any help,

L. Baker
MVS, Ltd.
