Return-Path: <gramelet@wanadoo.fr>
From: "Guillaume RAMELET" <gramelet@wanadoo.fr>
Date: Tue, 29 May 2001 10:57:19 +0200
Message-ID: <HPEGLNAFMGGOLLPAOCPIOEIHCBAA.gramelet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010529093436.A792@jensbenecke.de>
Subject: [linux-lvm] lvm with lfs
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

hi,

i'm using a lfs box (http://www.linuxfromscratch.org) and decided to pass my
old system (ext2 on /dev/hdx) to a new reiserfs on LVM.

i'm using 2.4.4 and i 'd have liked to checkout LVM CVS server but it has
failed. is my CVSROOT incorrect
(:pserver:cvs@cvs.globalfilesystem.org:/data/cvs) ?

i receive : cvs [login aborted]: connect to
cvs.globalfilesystem.org(208.210.145.138):2401 failed: Connection refused

thank for your help


Guillaume

PS : i'm using lvm_0.9.1_beta7 for now but i have some segmentation fault at
init (and it is working)
