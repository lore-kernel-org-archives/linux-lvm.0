From: Rich Turner <rich@storix.com>
Message-Id: <1074199517.2443.27.camel@rich>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] understanding snapshot
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
Date: Thu Jan 15 15:47:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

i am trying to get a thorough understanding of the snapshot process. i
have searched around for documentation but was unable to find detailed
information. perhaps someone can point me in the right direction or tell
me if my assumptions are correct.

i understand my snapshot lv only needs to be 15-20% the size of my
original lv. that leads me to believe:

1. we only write to the snapshot lv when data from the original lv has
changed. this copies the original version of the file to the snapshot lv
so that when we backup the snapshot lv it uses the original file and not
the changed version. all files that were not changed will be taken from
the original lv. this process requires 2 writes and 1 read.

2. if there are numerous writes to the original lv after the snapshot
has been created (and before it has been removed) we could exceed our
snapshot lv size. this is because we have to copy the original versions
of the file to the snapshot lv, and depending on the number of writes
and the size of the files we could run out of logical extents. when this
happens the snapshot is unusable.

what will happen to the backup process (tar for example) of a snapshot
lv when it runs out of storage?

do chunks contain the metadata for the data in the original lv?

what is the effect of increasing/reducing the chunk size?

rich turner
