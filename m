Return-Path: <list@showme.wox.org>
Message-ID: <003601c10af5$102a56c0$0f01a8c0@ws1>
From: "Bas" <list@showme.wox.org>
Date: Thu, 12 Jul 2001 19:06:59 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Oops ...
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
To: linux-lvm@sistina.com

Hi,

I'm afraid I'm not able to get more details right now, if necessary I'll get
'm later on, but I don't like playing with my filesystems ...

Kernel 2.4.6
CVS LVM of 11 July 2001
an XFS enabled kernel
devfs 1.82.

Boots fine, loads the LVM driver, but after it oopses after running
vgchange -a y (line 4, linuxrc).

What can I do ?

Thanks,
Bas.
