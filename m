Message-ID: <3DB3BDA4.75B552B6@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
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
Date: Mon Oct 21 03:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Since i want to run with ext3 and use snapshots, i applied the 
	linux-2.4.18-VFS-lock.patch
to my default 2.4.18 kernel. I just did that file since making
the patches, and applying that would fail during compilation.
(something about md driver ?, which i dont use)

So, after just getting the VFS-lock patch to work, i've tried
to use it on my debian woody, with 
	lvm-common     1.5.5
	lvm10          1.0.4-4
installed. But i get alot of errors :/
	lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
	lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
	lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
	lvm -- lvm_chr_ioctl: unknown command 0x8004fe97

And sometimes vgscan cant find my VG, and i cant activate it with
	vgchange -a y ...


It _MIGHT_ be because i'm running lvm ontop of a loop-AES, but it does
work most of the time.



JonB
ps: right now i'm starting all over with 
	2.4.19
	lvm_1.1-rc2.tar.gz
and removing those debian packages.
