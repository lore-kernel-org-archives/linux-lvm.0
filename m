From: galt <galt@fiberpimp.net>
Message-ID: <20020921020632.O68896-100000@true.fiberpimp.net>
MIME-Version: 1.0
Subject: [linux-lvm] raid1+lvm without initrd
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
Date: Sat Sep 21 01:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

A few of the regulars on this list seem to have a setup like this working.

I have 2 disks mirrored with linux software raid-1. on top of this I have
created 3 lv's: root, var, and swap. So far I have not been able to figure
out the boot=,root= parameters that'll coax lilo into booting this.

A few of the regulars on this list seem to have something like this
working. Would someone post a working lilo configuration for a raid1+lvm
noninitrd setup?

references to setups like this working:
http://lists.sistina.com/pipermail/linux-lvm/2002-September/012245.html
http://lists.sistina.com/pipermail/lvm-devel/2001-October/000686.html

galt
