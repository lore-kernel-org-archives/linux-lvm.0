From: Geert Jansen <geertj@boskant.nl>
Message-ID: <20021027112425.GA2723@vader.boskant.nl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] One cannot read from an lv?
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
Date: Sun Oct 27 05:24:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

I did some further investigations on the problem of reiserfsck and LVM2 that
I posted to this list a few days ago. The problem is caused by the fact that
seek() and read() on the logical volume in /dev/mapper/ fail! For example,
the command "dd if=/dev/mapper/vg0-tmp" fails to read anything.

What does this mean? How can an fsck ever check a volume in this case?

Greetings,
Geert Jansen
