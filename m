Message-ID: <3560BA143F45D5118E670000E82459214C1E1E@ssk.schneiderkenzingen.de>
From: "Koch, Steffen" <steffen.koch@sphinx-electronics.de>
Subject: RE: [linux-lvm] Swap on LVM - swapoff problem
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
Date: Mon Apr  7 03:33:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> I am swapping on lvm devices and aving a strange problem with swapoff.
> 
> I have the swap device configured in /etc/fstab, the relevant line is:
> 
> /dev/vg1/swap   none   swap    sw    0   0
> 
> swap seems to work OK but I have a strange problem with swapoff:
> 
> # swapoff /dev/vg1
> swapoff: /dev/vg1: Invalid argument
devices are no longer available due to system shutdown. LVM's are turned off
before swap space. Try to change that for shutdown.
