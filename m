From: Anders Widman <andewid@tnonline.net>
Message-Id: <CB8REB5YHGZWB9B6632XNMVQJH43VQ.3c452322@kadzuki>
MIME-Version: 1.0
Subject: [linux-lvm] Pvmove fails... No free PE's
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
Date: Wed Jan 16 00:53:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have a bad disk (hdl1) that needs to be replaced. It is 40GB, or 1220 PE's. I have another disk which is about 120GB, but has 1221 free PE's. Both disks are in the same VG, Server and the same LV, 
FTPRoot. When I try "pvmove -v /dev/hdl1" it failes (doesn't even start, really) and tells me I haven't any free PE's.

What can I have missed...

1) I shrick the filesystem first with about 60GB
2) I use lvreduce to shrick the LV with about 59GB
3) I tried "pvmove -v /dev/hdl" to move all PE's on this 40GB disk to the free ones on the other disks. This should have worked, shoudln't it?

have I missed something critical?

//Anders
