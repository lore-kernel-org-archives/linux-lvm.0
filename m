From: Jan Niehusmann <list039@gondor.com>
Message-ID: <20030816102005.GA12916@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] pvmove hangs
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
Date: Sat Aug 16 05:21:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

On my computer, pvmove just hangs at 0.2% done. First it looked like the
reason was that I hadn't loaded dm-mirror before calling pvmove.
Modprobe was called automatically, but tried to write to
/var/log/ksymoops/, which was on one of the lvs to move.

But then I booted to singe user mode and didn't mount any partitions on
lvm, and still, pvmove was hanging at 0.2%.

Another unusual detail about my installation is that the target pv is on
a degraded raid1 array. Perhaps there is some locking issue?

Jan
