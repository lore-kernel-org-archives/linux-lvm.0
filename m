From: Urs Thuermann <urs@isnogud.escape.de>
Message-Id: <m28z9guz53.fsf@isnogud.escape.de>
Subject: [linux-lvm] snapshots of busy ext2 file system corrupt
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
Date: Tue Feb 26 07:55:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I tried creating a snapshot of a ext2 file system on a LV.  I expected
a fsck on the snapshot device to give no errors, i.e. a consistent
file system.  This is ok, as long as there is no (or little) load on
the file system when creating the snapshot.

However, on a busy file system, the created snapshot has lots of
errors found by fsck.

Is it this what the VFS lock patch is for?  If so, why hasn't it been
integrated into the standard kernel?  Has it flaws in it?  Maybe
performance wise?


urs
