From: "Steve Wray" <steve.wray@paradise.net.nz>
Message-Id: <NBBBKLKHMJHIJLHOGAOJMEPJJEAA.steve.wray@paradise.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJEEPHJEAA.steve.wray@paradise.net.nz>
Subject: [linux-lvm] striping volumes
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
Date: Wed Feb 20 18:18:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Ok,
after a bit more benchmarking, it seems clear
that striping logical volumes across multiple
heterogenous IDE drives (all masters)
is only beneficial (WRT performance) on large
file sizes. The file size at which the performance
increase happens appears to depend on system memory.
On my system at 128M RAM, the filesize is around 32M,
with 64M RAM that drops to 8M files; but the point at
which the step occurs is nothing to do with striping vs
linear.

Also, there seems to be very very little difference
for *reads*; only writes (and the difference is definitely
worth it. I get a 10Mps improvement over linear mapping
starting at 64M files and that improvement is stable as filesize 
increases; linear mapping performance seems to constantly drop off
as file size increases).
I guess that this makes sense all things considered.

What I'd like to know is;
has anyone else done any similar benchmarking on LVM?
If so, where can I get a peek at it please!
:)
