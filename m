Message-ID: <3BA31A60.7080200@st-peter.stw.uni-erlangen.de>
Date: Sat, 15 Sep 2001 11:07:44 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] PBs with LVM over software RAID( RE: Olivier Sessink)
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

Hi
i did this test with /usr the problematik LV formated with XFS
and it didn't blocked the system

#!/bin/bash
cd /usr/src/linux
for i in 2 3 4 5 6
  do
  for j in 0 1 2 3 4 5 6 7 8 9
    do
    make clean;make -j3 bzImage > log."$i"$j
  done
done;
