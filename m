Date: Thu, 22 Jul 1999 11:21:20 +0200 (CEST)
From: Ingo Molnar <mingo@chiara.csoma.elte.hu>
Reply-To: Ingo Molnar <mingo@chiara.csoma.elte.hu>
Subject: Re: [linux-lvm] Work on HSM
In-Reply-To: <7n6lfe$smf$1@vulcan.alphanet.ch>
Message-ID: <Pine.LNX.3.96.990722105758.23683B-100000@chiara.csoma.elte.hu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc SCHAEFER <schaefer@alphanet.ch>
Cc: linux-lvm@msede.com


On 22 Jul 1999, Marc SCHAEFER wrote:

> is there any mailing-list I could join talking about HSM on Linux
> development ?  LVM already fullfills many high end storage requirements,
> and HSM might be an interesting addition.

the RAID driver has a component that implements 'block level HSM', and has
recently been renamed to hsm.c and CONFIG_BLKDEV_HSM to avoid confusion
(and merging problems) with the LVM stuff being discussed here. It's still
a prototype, but i'm trying out a more generic approach than the
traditional Veritas/HP/AIX way of managing storage. The hsm.c framework
enables the following unique features which i'd like to implement:

- on-demand storage. (with the prototype i was able to create a 100G
  filesystem on a 1G physical disk - more disks can be added later)

- transparent (to the filesystem) block and disk migration. block
  migration on nonfatal IO errors, disk migration when older disks are
  getting phased out.

- online (runtime) block-reordering without impacting the filesystem.
  Block access statistics are stored on-disk and these can be used to
  defragment _access chains_. [and not files - no particular sequential
  access pattern is presumed, it's all usage driven]

- block-granularity storage backup. Based on the statistics data, an LRU
  scheme can be implemented that moves rarely accessed data to slower
  storage. Note that this has _block_ granularity, not file/inode
  granularity as traditional HSM approaches.

The hsm.c framework enables basically every LVM and HSM feature, in a
unified way - plus more. I think these features are exciting enough to do
it the 'hard way' - block granularity HSM isnt exactly trivial ...

i believe the lvm.c code (Heinz's stuff) is orthogonal to this approach. 
hsm.c has fundamentally higher memory, CPU and disk costs than lvm.c - so
both approaches are i think useful.

-- mingo
