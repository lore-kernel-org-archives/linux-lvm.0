Date: Thu, 4 Oct 2001 01:39:50 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] Re: partition table read incorrectly
Message-ID: <20011004013950.A16757@cistron.nl>
References: <200110031901.TAA04080@vlet.cwi.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200110031901.TAA04080@vlet.cwi.nl>; from Andries.Brouwer@cwi.nl on Wed, Oct 03, 2001 at 07:01:10PM +0000
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
To: linux-lvm@sistina.com
Cc: alan@lxorguk.ukuu.org.uk, linux-kernel@vger.kernel.org

Previously Andries.Brouwer@cwi.nl wrote:
> But why do you call it wrong?

I deleted all partitions with fdisk so I expect none to be there.
fdisk shows none, but the kernel does.

Wichert.

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
