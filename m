Message-ID: <3BC88AA4.56395248@divsol.com>
Date: Sat, 13 Oct 2001 12:40:36 -0600
From: Jim Cromie <jcromie@divsol.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pv recovery after trashing partition table.  OK - back 
 to normal
References: <20011012.181856.-303677.1.james.cromie@juno.com>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

Jim N Cromie wrote:

>  /dev/hda4 used to have a good PV.

Somehow, it does again.

this morning, the box booted clean, and LVM found all logical partitions
and mounted them properly.
I did vgcfgbackup, rebooted to be sure, it rebooted w/o errors.

I dont know why - I did nothing that I thought 'THIS WILL FIX IT'   My
only WAGs are that all those fdisks,
(now including sfdisk - which apparently is more correct) fixed
something that was broken.  Or maybe
one of the many LVM tools fixed it on a *scan, *display, etc.


One of these days Ill actually use a new drive to back stuff up, rather
than filling it with more toys & music.
