Message-ID: <3BA4929A.3070903@st-peter.stw.uni-erlangen.de>
Date: Sun, 16 Sep 2001 13:52:58 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pb with pvcreate /dev/md0 has partition table again
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

hi it's a bit strange
i had 2 raids (RAID-0) ,and i used them long time --they had a FS, so i 
decided to recreate them befor makeing PV's
i stoped them , changed the order of the disks, recreated them ,
and tried pvcreate /dev/md0 , the answer was /dev/md0 has a partition table
smth was wrong
i changed the order of the disks and the stripe_size ( md0)-- the same 
answer
i changed the partition id's of the raid disks and formated them with ext2,
and then again to raid with changed order of the raid disks (md0), 
 --the same answer
so i tried it with /dev/md1 and there was no problem, dispite the fact 
that i had only one time changed the disk order
again change the order of the raid disks for md0
pvcreate /dev/md0 --> /dev/md0  has partition table

can smbd please tell me what's wrong
