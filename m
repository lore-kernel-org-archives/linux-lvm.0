From: Austin Gonyou <austin@coremetrics.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1037638130.15261.5.camel@UberGeek>
Mime-Version: 1.0
Subject: [linux-lvm] LV Larger than DIsk?
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
Date: Mon Nov 18 10:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I was trying to get 2.5.47 going this weekend, some of you may have seen
in the chan.

I finally got all the patches and got them applied for all the bits
broken in that kernel. I got compiled and booted, but...

After compiling lvm2 tools, vgscan runs fine, but then vgchange -ay only
activates 2 of the 5 lv's. I get an error that the LV is too large for
the allocated PE. 

I've got 2 PVs, one with 3 partitions, then the rest part of the
/dev/Data volume, and another disk I just added that I simply did
lvextend to one of the LV's I wanted to increase the size of.

Under LVM1, all is well, under LVM2, I'm having some serious issues.
Please advise.


-- 
Austin Gonyou <austin@coremetrics.com>
Coremetrics, Inc.
