Return-Path: <markv@wave.co.nz>
Date: Wed, 28 Mar 2001 02:14:21 +1200
From: Mark van Walraven <markv@wave.co.nz>
Message-ID: <20010328021421.B4557@mail.wave.co.nz>
Mime-Version: 1.0
Subject: [linux-lvm] safe to ru-run vgscan after mounting LV root?
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

Hi All,

First, let me say how impressed I am with LVM.  I've just set up a 2.4.2
system with all filesystems in logical volumes, on an MD mirror.  I am
an experienced (i.e., "jaded") sysadmin, so please take my enthusiasm
as a truly singular occurrence.  Kudos to you.

Now for my question: The system above runs vgscan (and vgchange) from an
initrd before mounting the root filesystem.  After that, the /etc/lvmtab*
files and directories need to be refreshed from the initrd.  Instead of
keeping the initrd hanging around until then, could vgscan simply be
run again to recreate /etc/lvmtab*, even though PVs and LVs are active?

Thanks,

Mark.
