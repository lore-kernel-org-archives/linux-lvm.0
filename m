From: Rich Turner <rich@storix.com>
Message-Id: <1051208166.1179.9.camel@rich>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvscan and vgscan
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
Date: Thu Apr 24 13:16:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

how does pvscan and vgscan know what devices to scan to search for pv's
and vg's? is there a file that it uses to determine which disks to open?
it does not appear to try to open all devices when their respective
modules have not been loaded yet.

my situation is that i have volume groups on multiple scsi devices but
the scsi modules are not being loaded before vgscan is being run in the
rc.sysinit. i realize that this is a problem inherent with the
rc.sysinit and can be fixed within it. but, my question is how does
vgscan scan all devices without opening them? normally when a device is
opened all of the modules are automatically loaded, hence vgscan will
find them.

using lvm 1.0.3
