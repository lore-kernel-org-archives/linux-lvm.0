Date: Tue, 2 Oct 2001 20:29:34 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Message-ID: <20011002202934.G14582@wiggy.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] partition table read incorrectly
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
To: linux-kernel@vger.kernel.org, linux-lvm@sistina.com

I seem to run into a weird problem. LVM refused to work properly,
after a "vgscan" command "vgchange -a y" would still complain
that things weren't consistent and I got a messages about an
I/O error on 08:11.

Interestingly my sdb does not have any partitions since it's one
big PV, and fdisk agrees with me on that. However the kernel
seems to thing I do have a partition there and as a result LVM
seems to get somewhat confused.

This happens with both 2.4.9-ac17 and 2.4.10-ac3. If anyone has
any ideas on how to go about fixing this don't hestitate to ask
me for more details.

Wichert.

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
