Return-Path: <claudio@conectiva.com>
Date: Wed, 20 Dec 2000 21:42:12 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
Subject: Re: [linux-lvm] vgextend segfaults (lvm 0.9, kernel test10)
In-Reply-To: <20001216171754.J20332@jensbenecke.de>
Message-ID: <Pine.LNX.4.21.0012202133160.3255-100000@scuzzlebutt.helllabs>
MIME-Version: 1.0
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
To: linux-lvm@sistina.com
Cc: aris@conectiva.com

On Sat, 16 Dec 2000, Jens Benecke wrote:

> Additionally, (very strange) since I patched my 2.2.17 with ReiserFS and
> LVM I get occasional network outages (rtl8139). ifconfig down ; ifconfig up
> with IP addr. etc brings it back up, but that' not a solution for a server.

My 8139s were giving me so much problems (with both 2.2.17 and 2.4.0-test)
that I decided to replace them by a couple of 3c905C cards. From our
tests with the 8139 at Conectiva, rev. "A" RTLs and a motherboard with
a SiS chipset (but also VIA and PIIX3) is very crash-prone. Rev. "B" cards
seem to be a bit better.
