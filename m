Message-ID: <20021204161957.GA608@reti>
Mime-Version: 1.0
Content-Disposition: inline
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] 2.4.20-dm-2
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
Date: Wed Dec  4 10:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, lvm-devel@sistina.com

A new stable release of dm for 2.4.20 is available:

http://people.sistina.com/~thornber/patches/2.4-stable/2.4.20/2.4.20-dm-2.tar.bz2


Changes
-------

Revision 13:
  Give each device its own io mempool to avoid a potential
  deadlock with stacked devices.  [HM + EJT]

Revision 14:
  Let the persistent/non persistent arg to the snapshot constructor
  be case insensitive. [Heinz Mauelshagen]

Revision 15:
  queue_io() was checking the DMF_SUSPENDED flag rather than the new
  DMF_BLOCK_IO flag.  This meant suspend could deadlock under load.

Revision 16:
  dm_suspend(): Stop holding the read lock around the while loop that
  waits for pending io to complete.

Revision 17:
  Add a run_task_queue(&tq_disk) to encourage pending io to flush
  when we're doing a dm_suspend().
