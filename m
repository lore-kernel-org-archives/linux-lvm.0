Message-ID: <909EA7234316394F80BBB70A85A1EB389609BD@hermes.dimac.net>
From: "Conny Brunnkvist / dimac.net" <conny@dimac.net>
Date: Fri, 28 Sep 2001 16:46:15 +0200
MIME-Version: 1.0
Subject: [linux-lvm] Problems with 2.4.10 > lvm 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hello. I just rebooted to my new 2.4.10 kernel, and my VG was not to be
found. So, I thought I'd better update my userland tools from beta 7 (I
think it was) to 1.0.

Making and installing them worked fine. So did the kernel-patch and its
compilation, but i get the following when trying to install or newly
compiled 1.0 module:

depmod: *** Unresolved symbols in
/lib/modules/2.4.10/kernel/drivers/md/lvm-mod.o
depmod:	get_hardblocksize

I've read somewhere else in the list-archive that changing the
get_hardblocksize lines to get_hardsect_size could help, but I have
absolutely no clue on what difference that'd make: is it all about a
function that have had its name changed, or is there something else to it? 

I _don't_ want to try it if it means risking corruption of my data..

Any ideas would be appreciated.

//conny
