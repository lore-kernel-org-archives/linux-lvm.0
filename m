From: David B Harris <dbharris@eelf.ddts.net>
Message-Id: <20031220215901.321bd6eb.dbharris@eelf.ddts.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 2.6.0, devmapper, LVM2 snapshots
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
Date: Sun Dec 21 15:47:08 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hey folks :) First and foremost, thanks for the great work that is
devmapper and LVM2. Been using it for a good long while now and I've
been quite happy with it.

I'm playing around with stock 2.6.0, checking things out, giving it a
good prod, and I found that creating a snapshot isn't possible. What's
more, I couldn't remove it. I couldn't even access any (uncached) data
on the filesystems therein. I rebooted, and they wouldn't mount at that
point.  I was eventually able to remove the faulty snapshot(s) and mount
the other filesystems, but only after a reboot to init=/bin/sh

It was something of a scary event ;) Is this a known problem that people
are working on, or are you fellas in need of a good reproducible test
case? (I'd rather avoid breaking my machine, but if it's an unreported
problem that others can't easily reproduce, I'd be more than willing
to.)
