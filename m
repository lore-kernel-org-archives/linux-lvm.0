From: Daniel Savard <dsavard@cids.ca>
Content-Transfer-Encoding: 7bit
Message-Id: <1053563322.5733.3.camel@dirac.cids.ca>
Mime-Version: 1.0
Subject: [linux-lvm] modprobe block-major-43 error at boot time
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
Date: Wed May 21 19:29:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I am getting the following error at boot time:

modprobe: modprobe: Can't locate module block-major-43 
kernel: kmod: failed to exec /sbin/modprobe -s -k block-major-43, err

This error happen just after vgscan and vgchange in my rc.sysinit file.

Anybody can help me understand what I am doing wrong?


-- 

=======================================
Daniel Savard

Internet: dsavard(at)cids.ca
=======================================
