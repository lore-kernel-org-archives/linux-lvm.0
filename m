Message-ID: <20020522125128.GA2009@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] [Announce] device-mapper beta3 (fast snapshots)
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
Date: Wed May 22 07:52:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-lvm@sistina.com, lvm-devel@sistina.com

Beta3 of device-mapper is now available at:

   ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper-beta3.0.tgz

The accompanying LVM2 toolset:

   ftp://ftp.sistina.com/pub/LVM2/tools/LVM2.0-beta3.0.tgz

The main addition for this release is high performance persistent
snapshots, see http://people.sistina.com/~thornber/snap_performance.html
for a comparison with LVM1 and EVMS.

Please be warned that snapshots will deadlock under load on 2.4.18
kernels due to a bug in the VM syste, 2.4.19-pre8 works fine.

pvmove is now the only major feature that LVM2 lacks compared with
LVM1.

- The LVM2 team (Patrick Caulfield, Alasdair Kergon, Joe Thornber)
