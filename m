From: Daniel Savard <dsavard@videotron.ca>
MIME-Version: 1.0
Message-Id: <01111500471301.02493@dirac.cids.ca>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] root fs on a LVM cause kernel panic
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
Date: Wed Nov 14 23:53:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Hi everyone,

I am using LVM 1.0.1-rc4 and Linux 2.4.13.

I read the lvmcreate_initrd man page and followed the instructions to create
the kernel image with LVM support. However, I am unsuccessful to make it
working properly. The system boot and is showing its messages, including the
message about LVM support in the kernel and while it is trying to mount the
root filesystem, I am getting a kernel panic message saying the "root=" stanza
should be provided with a valid device for the root filesystem.

What am I doing wrong? Is there anything missing? Any way to get extra
debugging messages?


-- 

================================
Daniel Savard
CIDS Inc.
551, boul. Sir Wilfrid Laurier
suite 105
Beloeil, (Qu�bec)
Canada

J3G 4J1

T�l: (450) 467-8014
Internet: dsavard@videotron.ca
================================
