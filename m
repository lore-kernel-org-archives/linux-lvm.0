From: "Jan H. van Gils" <JanVG@Knoware.NL>
Message-ID: <001001c2c581$d7d579a0$240b892c@pe1mhp.ampr.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Howto create a Compressed ROM File initrd with lvmcreate_initrd
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
Date: Sun Jan 26 15:29:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

	Hi,

Thanks for reading,

I am using Debian as a distro and it usses a cramfs initrd file when it
boots.
Here is the output from the original initrd file and the one created by
lvmcreate_initrd.

1. Orginal
initrd.img-2.4.20-686:      Linux Compressed ROM File System data,
little endian size 2920448 version #2 sorted_dirs CRC 0x2e79d9f7,
edition 0, 1565 blocks, 200 files

2. lvmcreate_initrd
initrd-lvm-2.4.20-686.gz:   gzip compressed data, from Unix, max
compression


Has some of you myth have seen in earlier posting my system wil not boot
When I use the initrd I have created with lvmcreate_initrd.

Here is the message:
Kernel panic: VFS: Unable to mount root fs on 3a:00

So I think the problem has to do with the fact that my kernel expects a
cramfs initrd
File and not a gzip compressed.

Any idea's in howto solve this ?

Greetz Jan

----
With regards Jan H. van Gils
Internet web-page http://www.Knoware.NL/users/janvg/
Internet e-mail address JanVG@Knoware.NL
RIPE Whois JHG5-RIPE, 6BONE Whois JHG1-6BONE
