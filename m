Message-ID: <5E34D857F6BB704CA3369B7553233A8165202A@ntsviemxs0152.connect.at-work.ent>
From: "Csuk, Ferenc" <Ferenc.Csuk@one.at>
MIME-Version: 1.0
Subject: [linux-lvm] Lilo problem
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
Date: Wed Nov 28 11:27:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi All,

I found one answer(Mon, 18 Jun 2001 12:48:36 -0600 (MDT)) about lilo patch.
Andreas adviced that the guy should have patched lilo with your 21.7-5
patch. I have the same problem now. I modified the lilo.conf to boot from
/dev/sdb when I got the error message Fatal: Sorry, don't know how to handle
device 0x3a00.

The background:

I just managed to complete my installation. I have a working LVM on top of a
RAID1. I have only one md0 device and one vg00. I created boot partiotion on
lvol1 on SDA. I would like to make sure if SDA goes wrong I can still boot
from SDB. What should I change in lilo configration. I suppose I have to
save MBR on that and let lilo know about it.

Should I apply that patch? If yes, how to do that? I am using Suse 7.1 with
kernel 2.4.0

Thanks in advance.

Regards,
Ferenc
