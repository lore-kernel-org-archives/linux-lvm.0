Date: Tue, 2 Oct 2001 22:00:53 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Message-ID: <20011002220053.H14582@wiggy.net>
References: <20011002202934.G14582@wiggy.net> <E15oUUf-0005Xw-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E15oUUf-0005Xw-00@the-village.bc.nu>
Subject: [linux-lvm] Re: partition table read incorrectly
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
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-lvm@sistina.com

Previously Alan Cox wrote:
> Does it complain about wrong block sizes ?

No
 
> The partition code will look for tables. That bit is fine

If that bit is fine then how can it differ in opinion from fdisk?

> The exact error would be good too

 I/O error: dev 08:11, sector 0

Wichert.

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
