Message-ID: <2D92FEBFD3BE1346A6C397223A8DD3FC0924D1@THOR.goeci.com>
From: Murthy Kambhampaty <murthy.kambhampaty@goeci.com>
MIME-Version: 1.0
Subject: [linux-lvm] ERROR creating snapshot: "Cannot allocate memory"
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
Date: Wed Dec  3 16:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

While trying to snapshot a 335 GB LV (sdd1) on a machine with 12 GB of RAM,
and 67 GB of free space (sdc1), I get the following error:

lvcreate -s -l 21 -n snapshot /dev/VGdb01/LVdb
lvcreate -- WARNING: the snapshot will be automatically disabled once it
gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for
"/dev/VGdb01/snapshot"
lvcreate -- ERROR "Cannot allocate memory" creating VGDA for
"/dev/VGdb01/snapshot" in kernel

kernel is 2.4.21 (LVM 1.0.5+) with tools form
~redhat/contrib/lvm-1.0.5.src.rpm

Help
