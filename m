Return-Path: <shane@zeke.yi.org>
Date: Fri, 22 Dec 2000 13:46:41 -0500 (EST)
From: Shane Shrybman <shane@zeke.yi.org>
Message-ID: <Pine.LNX.4.21.0012221336250.1585-100000@zeke.goatskin.org>
MIME-Version: 1.0
Subject: [linux-lvm] Can't find ext2 fs with LVM 0.9
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

Hi,

This is most likely a pilot error issue. I have tried
2.2.18aa2 and 2.4.0-test13-pre4 which both contain
LVM 0.9. I installed the lvm 0.9 tools which seem to
work fine, I can vgscan and vgchange -a y and everything
looks fine in the LVM. The only rpoblem is that when
I try to mount my LVs it says it can't find the ext2
fs on the LV. I get a message like this one with kernel
2.2.18aa2:

VFS: Can't find an ext2 filesystem on dev lvm(58,1).
mount: wrong fs type, bad option, bad superblock on /dev/vg01/lv01,
       or too many mounted file systems

The same thing happens with 2.4.0-test13-pre4, but 
all is ok with 2.2.18pre17aa1 which contains LVM 0.8.

What have I missed?

shane



-- 
