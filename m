Message-ID: <2D92FEBFD3BE1346A6C397223A8DD3FC092522@THOR.goeci.com>
From: Murthy Kambhampaty <murthy.kambhampaty@goeci.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM snapshots: memory requirements?
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
Date: Wed Dec 24 10:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Is there a way to determine the amount of memory requred to create LVM
snapshots for a given original volume size. On a server with 12G of memory
(no load during testing), I get an "Cannot allocate memory" error when
trying to take the snapshot of a 339G original volume. When I bumped memory
to 16GB the snapshot was created, but unfortunately the SuperMicro Super8050
server is unstable with 16GB of memory (oopses on rsync and postgresql,
seems to run everything else fine; memtest86 says the memory is fine). LVM2
on 2.4.21 does not successfully make the snapshot either; in fact, with
LVM2, the snapshot fails and then locks the filesystem; upon reboot, the
system hangs trying to mount the filesystems on the LVM volumes because of
the locked one; the solution is to start a recue disk with LVM1 and vgscan
-r (it would be nice if vgscan -r would work in LVM2).
