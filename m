Message-ID: <20040129022341.88184.qmail@web80402.mail.yahoo.com>
From: Chris Conn <cmcgoat@swbell.net>
MIME-Version: 1.0
Subject: [linux-lvm] combining two vg's into one
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
Date: Wed Jan 28 21:24:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm <linux-lvm@sistina.com>

I've got 2 vg's on two different partitions on
different disks, one is my root vg and the other
has /usr, /var and /tmp filesystems. I'd like to
keep them on separate disks but use the same vg
if I can, but I'm unsure how to combine them. Do 
I have to move the lv's on disk2 out of their vg
or can I just expand the vg on disk1 to include
them? The filesystems are all ReiserFS, system
is Slackware Linux 9.1.

Thanks for any advice,

=====
Chris Conn   
cmcgoat@swbell.net   http://storm.cadcam.iupui.edu/~cmcgoat
Austin, TX
