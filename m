From: Andries.Brouwer@cwi.nl
Date: Thu, 4 Oct 2001 16:22:55 GMT
Message-Id: <200110041622.QAA24650@vlet.cwi.nl>
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
To: linux-lvm@sistina.com, wichert@cistron.nl
Cc: alan@lxorguk.ukuu.org.uk, linux-kernel@vger.kernel.org

[if you answer me, please do not remove my email address -
these are rather busy times, and I glance only very superficially
at linux-kernel]

> I deleted all partitions with fdisk so I expect none to be there.
> fdisk shows none, but the kernel does.

You should have looked with sfdisk :-)

But the conclusion is that nothing is wrong with the kernel,
but that some lvm utilities and fdisk could stand improvement.
I changed fdisk a little.

Andries
