Date: Wed, 3 Oct 2001 14:42:36 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] Re: partition table read incorrectly
Message-ID: <20011003144236.A31796@cistron.nl>
References: <20011002202934.G14582@wiggy.net> <E15oUUf-0005Xw-00@the-village.bc.nu> <20011002220053.H14582@wiggy.net> <20011002150820.N8954@turbolinux.com> <20011003142633.A16089@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011003142633.A16089@cistron.nl>; from wichert@cistron.nl on Wed, Oct 03, 2001 at 02:26:33PM +0200
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
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-kernel@vger.kernel.org, linux-lvm@sistina.com

Here are the first 512 bytes for the disk which the kernel gets
wrong (/dev/sdb):

000000 48 4d 01 00 00 00 00 00 00 04 00 00 00 10 00 00
000010 00 10 00 00 00 20 00 00 00 80 00 00 00 a0 00 00
000020 00 48 01 00 00 f0 01 00 00 00 41 00 47 59 75 35
000030 50 30 6a 63 58 57 45 42 74 38 64 44 74 70 51 6d
000040 31 6a 50 38 57 41 31 4e 5a 46 39 65 00 00 00 00
000050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
*
0000a0 00 00 00 00 00 00 00 00 00 00 00 00 76 67 5f 75
0000b0 73 65 72 00 00 00 00 00 00 00 00 00 00 00 00 00
0000c0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
*
000120 00 00 00 00 00 00 00 00 00 00 00 00 63 6c 6f 75
000130 64 31 30 30 31 37 38 30 32 30 38 00 00 00 00 00
000140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
*
0001a0 00 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00
0001b0 01 00 00 00 01 00 00 00 02 00 00 00 70 90 23 02
0001c0 01 00 00 00 00 20 00 00 1b 11 00 00 80 00 00 00
0001d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
*
0001f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 55 aa

Wichert.

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
