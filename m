Message-ID: <20020603193550.73967.qmail@web14602.mail.yahoo.com>
From: Adrian Noland <anoland@yahoo.com>
In-Reply-To: <20020422023605.A12545@golem.blacknet.de>
MIME-Version: 1.0
Subject: [linux-lvm] lvmcreate_initrd problem
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
Date: Mon Jun  3 14:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,
I'm trying to create an initrd and I'm hitting my head against this
error:

lvmcreate_initrd -- ummounting ram disk
umount: /tmp/initrd.2400: not mounted
lvmcreate_initrd -- ERROR umounting /tmp/initrd.2400
                 -- removing /tmp/initrd.2400
                 -- removing /tmp/mnt.2400
rmdir: `/tmp/mnt.2400': Device or resource busy
                 -- removing /tmp/lib.2400
                 -- exit with code 1

How do I find out why /tmp/initrd.$$ isn't mounted? Furthermore, can I
unmount it on my own and complete the script my self? What values would
I use for $DEVRAM and $INITRD?

NB: this isn't a standard install. I'm finishing up a LFS system. This
error only occurs in chroot. Is this a permissions problem or otherwise
related to LFS?

Thanks,
Adrian


=====
"You cannot with logic dissuade someone of a belief that was formulated without logic." --Big Beare's Law

__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com
