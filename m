From: Markus Weiss <mweiss@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200212062032.11584.mweiss@grenoble.cnrs.fr>
Subject: [linux-lvm] / on LVM2
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
Date: Fri Dec  6 13:32:05 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello everbody,

I ran into a problem testing LVM2 on my system.
I have / on LVM, and booting into kernel 2.5.50 (with dm compiled in,
libdevmapper and LVM2-tools installed) fails, because the kernel cannot mount 
the root fs. I have tried building an initrd using SuSE's mk_initrd and 
lvmcreate_initrd, but I get the same problem.

Do these scripts have to be modified in any way to work with LVM2 ?
(something like calling devmap_mknod.sh at some point ?)

Thanks for any advice,

Markus

PS:
Please cc me, as I'm not subscribed
