From: Scott Mcdermott <smcdermott@questra.com>
Message-ID: <20030702073723.GC30882@questra.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] snapshots on RAID5 blow up machine ("switching cache buffer size")
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
Date: Wed Jul  2 02:38:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Today my NFS-mounted mail spool slowed to a crawl in my mail
agent; I logged into the server and noticed the load average
over 20.  I saw that a developer had a build going on (from
another machine) off one of the NFS exports (LVM on RAID5).
This particular LV was snapshotted at the time and
presumably the build caused lots of snapshot activity, but a
load over 20 is obviously abnormal.

I saw these in the logs:

    kernel: raid5: switching cache buffer size, 4096 --> 1024
    kernel: raid5: switching cache buffer size, 1024 --> 4096
    kernel: raid5: switching cache buffer size, 4096 --> 1024
    kernel: raid5: switching cache buffer size, 0 --> 1024
    last message repeated 3 times
    kernel: raid5: switching cache buffer size, 1024 --> 4096
    kernel: raid5: switching cache buffer size, 0 --> 1024
    kernel: raid5: switching cache buffer size, 0 --> 4096
    last message repeated 2 times
    kernel: raid5: switching cache buffer size, 4096 --> 1024

mostly the transitions were 512 to 4k, then back again,
hundreds of times per second.

I've searched the archives and see that this is related to
the filesystem using 4k blocks whereas snapshot IO uses 1k
blocks, so RAID5 code gets confused, but I don't understand
the internals of the filesystem to be able to say this is
expected behavior.

My questions are these:

    - Is this a RAID5 problem or an LVM problem, or both?
      I'm using an SMP kernel 2.4.22-pre2.  In other words,
      am I asking the wrong list about this problem because
      it's a perfectly fair use of the backing store by the
      LVM subsystem?

    - Is this problem nonexistent on RAID1 backed or
      RAID10 backed VGs (especially the latter since I am
      contemplating a switch thereto)?

    - Is the problem dependent on the snapshot extents
      residing on the same PV as the snapshotted LVs? In
      this case how to force snapshot extents to use
      particular PVs if not all extents in the PV which
      contains the LVs in question are allocated already?

I am planning to make extensive use of snapshots for backup
purposes (I plan to keep the last seven days of data online
as daily exported snapshots, to let users easily retrieve
things without going to tape), so I need to try to
understand this problem better.

Thanks for any comments.
