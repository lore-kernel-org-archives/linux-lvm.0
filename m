From: Andries.Brouwer@cwi.nl
Date: Wed, 3 Oct 2001 19:01:10 GMT
Message-Id: <200110031901.TAA04080@vlet.cwi.nl>
Subject: Re: [linux-lvm] Re: partition table read incorrectly
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alan@lxorguk.ukuu.org.uk, linux-kernel@vger.kernel.org, linux-lvm@sistina.com, wichert@cistron.nl

> Other data point: the 2.2.19 kernel as found on the lnx bootable business
> card also gets it wrong and detect a sdb1..

But why do you call it wrong?
There is a partition table there, and a signature, and the
single entry describes (in DOS-type partition table style)
a partition with a length of 4GiB with System Id 0.

Some programs will call it an unused partition because of the
type 0, but there is a partition there.

Andries
