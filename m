Date: Tue, 2 Oct 2001 19:42:13 +0100 (BST)
In-Reply-To: <20011002202934.G14582@wiggy.net> from "Wichert Akkerman" at Oct 02, 2001 08:29:34 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <E15oUUf-0005Xw-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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
To: Wichert Akkerman <wichert@cistron.nl>
Cc: linux-kernel@vger.kernel.org, linux-lvm@sistina.com

> I seem to run into a weird problem. LVM refused to work properly,
> after a "vgscan" command "vgchange -a y" would still complain
> that things weren't consistent and I got a messages about an
> I/O error on 08:11.

Does it complain about wrong block sizes ?

> Interestingly my sdb does not have any partitions since it's one
> big PV, and fdisk agrees with me on that. However the kernel
> seems to thing I do have a partition there and as a result LVM
> seems to get somewhat confused.

The partition code will look for tables. That bit is fine

The exact error would be good too
