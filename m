Message-ID: <004901c159ad$dcf67c40$5300a8c0@adsting.linux>
From: "stingtaogiga" <stingtao@giga.net.tw>
References: <3BD1E714.B8CF216D@libertysurf.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] can't pvcreate more than 64 dasds on Linux/390
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
Date: Sat Oct 20 16:21:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I am using lvm-0.9.1_beta7-1 with TurboLinux6.5(2.2.19) over IBM
mainframe S/390. I tried to pvcreate 200 dasds(disks) together, than I'll
make them a vg, totally disk space around 500G.
    I can work with dasds whose major number is 94 (that is, 64 dasds in
total)all right. However, I fails to pvcreate those dasds whose major number
is 253, 252.... The message is:

[root@host96 block]# pvcreate /dev/dasdb[st]1
pvcreate -- invalid physical volume name "/dev/dasdbs1"

    I traced lvm kernel source and found that in
/usr/src/linux-2.2.19/include/linux/major.h, only dasd with major number 94
is defined. I think that's the reason pvcreate thought those dasds are
invalid.
    Any Solutions?
