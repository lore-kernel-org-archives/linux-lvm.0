Return-Path: <g.liakhovetski@ragingbull.com>
Date: Tue, 17 Jul 2001 12:13:36 +0100 (BST)
From: Guennadi Liakhovetski <g.liakhovetski@ragingbull.com>
Message-ID: <Pine.LNX.4.31.0107171209410.12608-100000@erdos.shef.ac.uk>
MIME-Version: 1.0
Subject: [linux-lvm] HUGE LVM log file...
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
To: linux-lvm@sistina.com, lvm-bugs@sistina.com

Hello

This is a (rather) urgent issue, so, I am posting it to the 2 lists,
although, it might not be a bug.

My /var/log/lvm has grown up to 800MB+... and has filled up the disk...
well, almost... Since it's ext2, there's still some space, only available
for the root, and it is currently filling up that space too... What do I
do with it? Is it ok to chop off its head / remove it, do I need it at
all, how do I limit its size without a need to do it manually every time
(except cron-job)?

Please, help!

Thanks
Guennadi
___

Dr. Guennadi V. Liakhovetski
Department of Applied Mathematics
University of Sheffield, Sheffield, U.K.
email: g.liakhovetski@sheffield.ac.uk
