From: Vincent AE Scott <linux.lvm@codex.net>
Message-Id: <20020221143602.F328@majestic.ukshells.co.uk>
MIME-Version: 1.0
Subject: [linux-lvm] is devfs required?
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
Date: Thu Feb 21 08:36:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM <linux-lvm@sistina.com>

Hi there,
i've been tinkering with LVM, but i'm having some issues with it, and i
was wondering if anyone here could help shed some light for me?

i'm using LVM on a 2.4.17-19mdk kernel patched up to 1.0.3
it *appears* that when i boot up without devfs support, i frequently
cant create/extened/mount filesystems.  but when i boot up with devfs
support it seems to work.

is devfs required to use LVM?

without it, ive seen lvcreate SEGV when attempting to create a new
volume.  

or are there any known problems with using LVM on an SMP host?  i cant
think of anything else that might be causing these strange problems.

oh, and FYI, it was setup up using 1.0.1-rc4ish

TIA,
-vince

-- 
PGP key:  http://codex.net/pgp/pgp.asc

 Smash forehead on keyboard to continue... 
