From: "Justin Hamilton" <JHamilton@Earthling.Net>
Subject: [linux-lvm] llseek & lseek64
Date: Sun, 30 Jul 2000 18:19:13 -0400
Message-ID: <NDBBKIEANAMHBNPAILKPAECHCLAA.JHamilton@Earthling.Net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM LIst <linux-lvm@msede.com>

Got a message that llseek is unsafe, use lseek64.

I changed the two files where llseek is used,
tools/lib/{pv_get_size.c,pv_move.c}, and recompiled just fine.

I guess this is ok.

Justin
