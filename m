From: Dustin Cooper <dcooper@deepthought.org>
Message-Id: <Pine.LNX.4.33.0204011838250.25307-100000@cobalt.deepthought.org>
MIME-Version: 1.0
Subject: [linux-lvm] lvcreate -- couldn't read physical volume "/dev/md/0"
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
Date: Mon Apr  1 17:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I'm trying to specify a physical volume on the command line when creating
a new logical volume.  If I use a disk partition, it works perfectly.
Specifying a software RAID device generates the error:

lvcreate -- couldn't read physical volume "/dev/md/0"

I'm using LVM 1.0.3 with kernel 2.4.14 and XFS 1.0.2 patches.

I know this is a repeat question, but the only post in this list's
archives I could find describing this problem had no replies.

Thanks,

Dustin Cooper
