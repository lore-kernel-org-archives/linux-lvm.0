From: Galen Seitz <galens@seitzassoc.com>
Message-Id: <20030923192822.DAA858F03@tinman.seitzassoc.com>
Subject: [linux-lvm] determining lv from mount point
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
Date: Tue Sep 23 14:29:02 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm trying to update my backup script (a tweaked version of hostdump.sh
from backupcentral.com) to use snapshots.  My machine has a mix of 
normal ext3 and ext3 on lvm filesystems.  What I'm looking for is an
easy way from a shell script to determine the lv from the mount point.
The ideal thing would be a shell function that takes the mount point
as an argument and returns the associated logical volume, or an error
if the filesystem doesn't use lvm.

Suggestions?

thanks,
galen
