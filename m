Mime-Version: 1.0
From: Jonathan Buzzard <jonathan@buzzard.org.uk>
Message-Id: <E177uaF-0000ja-00@jelly.buzzard.org.uk>
Subject: [linux-lvm] Some suggestions about lvminitrd_create
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
Date: Wed May 15 04:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@Sistina.com

Just a couple of suggestions firstly it would be nice if it checked
for /boot/System.map-'uname -r' rather than for just /boot/System.map.
When you have more than one kernel floating about this is handy.

Second suggestion it would be nice if a -t option existed to allow a
choice in the type of filesystem the initrd is created in. Not everyone
is using ext2 these days :)

JAB.

-- 
Jonathan A. Buzzard                 Email: jonathan@buzzard.org.uk
Northumberland, United Kingdom.       Tel: +44(0)1661-832195
