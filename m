Message-ID: <F888C30C3021D411B9DA00B0D0209BE8038F9671@cvo-exchange.cvo.roguewave.com>
From: Poul Petersen <petersp@roguewave.com>
MIME-Version: 1.0
Subject: [linux-lvm] sar/iostat statistics for LVM
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
Date: Wed Sep 18 22:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

	It seems that sar and iostat default to major 8 (sd) when reporting
disk activity statistics. For some reason, "iostat -x" seems broken in
RedHat 7.2. Are other people using sar to monitor lvm disks? What was
required to get sar/iostat to monitor major 58?


Thanks,


-poul
