Return-Path: <list@showme.wox.org>
Message-ID: <001601c0ac41$fc35a640$0f01a8c0@myplace.net>
From: "Bas" <list@showme.wox.org>
Date: Tue, 13 Mar 2001 20:48:16 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Changing device numbers.
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

I'm not sure if I'm correct with what I'm about to say, but please correct
me where I'm wrong:

I'm using devfs, (maybe not for long, depends on the answer), and since not
too long 2 SCSI disks. I decided to create striped LV's, and decided to go
all the way, so I included root. That made me create a temp LV, and copy all
the data. I did that with every LV. Now I didn't need my old LV that
contained root, so I deleted it.

I want root to have major 58, minor 0 and usr major 58, minor 1. How can I
get that done.
root is 58,15 now. This also caused trouble when I rebooted after deleting
old root.

Thanks,
Bas
