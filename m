Message-ID: <OF4A9F315E.E34E5EC4-ONC1256B1E.00574810@de.ibm.com>
From: "Martin Petermann" <martin.petermann@de.ibm.com>
MIME-Version: 1.0
Subject: [linux-lvm] read hangs when snapshot gets full
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
Date: Mon Dec 10 11:16:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

I'm using a SuSE Linux (V7.2) with a 2.4.4 kernel. If I start a program
which reads from a snapshot (e.g. cat /dev/vg/snapshot > /tmp/file) with a
low priority (nice -20), sometimes the program hangs within the
read() call if the snapshot gets full. If this is the case I'm not able to
kill the process of the application (even SIGKILL). In my application I
reduced the number of blocks in each read() call reads and I stop
reading after the snapshot is full of more then 90%. But this solution is
not completely avoiding the problem.

Is there any fix in a newer kernel version?

Thanks for any ideas!

Martin
