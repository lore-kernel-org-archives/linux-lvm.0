From: "Kai-Min Sung" <k@kaisung.com>
Message-ID: <001801c3192c$02bb4a70$09fea8c0@nimiak>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] iSCSI and LVM
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
Date: Tue May 13 03:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux-lvm@sistina.com

Hi,
	Is anyone on this list familiar with iSCSI? I was wondering if
it'd be possible to setup a Logical Volume as an iSCSI target and export
it over an IP network for other clients to use. I'm interested in
setting up an IP SAN, where the storage devices are logical volumes
managed by LVM. There's this company called SANRAD that makes a hardware
device called an iSCSI switch. The iSCSI switch is connected to a pool
of storage disks on the back-end and to a bunch of servers on the
front-end. It uses logical volume management to carve out logical disks
from the back-end storage disks, then exports these using iSCSI to the
front-end servers. (Check out their website http://www.sanrad.com for a
nice flash movie of this architecture). Anyways, some fellow classmates
and I are interested in building such an iSCSI switch in software, using
LVM and other opensource components. Any feedback would be greatly
appreciated.

Regards,
Kai-Min Sung
