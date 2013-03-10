From: Mike Snitzer <msnitzer@fedoraproject.org>
Date: Sun, 10 Mar 2013 12:18:08 -0400
Message-Id: <1362932290-28679-1-git-send-email-msnitzer@fedoraproject.org>
Subject: [linux-lvm] [PATCH 0/2] yum-utils fs snapshot plugin: fix old LVM
	snapshots and add thinp support
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yum-devel@lists.baseurl.org
Cc: okozina@fedoraproject.org, James Antill <james@fedoraproject.org>, linux-lvm@redhat.com

Hi,

I'd really appreciate it if someone with commit access to yum-utils
could both review and then commit these changes for me.  I'd like to
see these changes committed in time for the F19 feature freeze this
Tuesday (Mar 12), as this work is a prereq for the following F19
feature:
https://fedoraproject.org/wiki/Features/YumFsSnapshotThinpSupport

Ondrej Kozina may also offer an additional patch to have fs-snapshot
use the snapper utility [1] to create the snapshots (by Tuesday) but
that is still TBD.

While implementing snapshot support for thinly provisioned LVM volumes
I quickly noticed that the older LVM snapshot no longer works.  This
was due to a regression in commandline processing in "dmsetup
splitname".  So the first patch addresses this regression.

The second patch adds support for thinly provisioned LVM volumes.
Please see each patch's headers for more details.

Thanks,
Mike

[1] http://en.opensuse.org/Portal:Snapper

Mike Snitzer (2):
  fs snapshot plugin: fix inspect_volume_lvm to use supported dmsetup splitname options
  fs snapshot plugin: add support for snapshotting thinly provisioned LVM volumes

 docs/yum-fs-snapshot.conf.5        |  3 ++-
 plugins/fs-snapshot/fs-snapshot.py | 34 +++++++++++++++++++++-------------
 2 files changed, 23 insertions(+), 14 deletions(-)

-- 
1.8.1
