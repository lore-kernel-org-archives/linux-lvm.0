From: Matthew Johnson <mjj29@cam.ac.uk>
In-Reply-To: <20020823224424.GB6812@kluge.net>
Message-ID: <Pine.LNX.4.31.0209142054090.4852-100000@kern.srcf.societies.cam.ac.uk>
MIME-Version: 1.0
Subject: [linux-lvm] Error extending an lv
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
Date: Sat Sep 14 14:59:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, I've just had to resize one of the lv's on my lvm system (debian
woody), so I ran lvextend -L +5G /dev/lvm1/music, then ran
resize_reiserfs /dev/lvm1/music - and continued copying stuff on. This
was done with the vg active, but I had to unmount the partition to
resize the reiserfs (my mount is screwed up - I'm going to reinstall the
system anyway in a couple of weeks, I'm just booting it in single user
mode atm to put some data somewhere temporarily).

Anyway, when I next booted and ran vgchange -ay, I get the message
"physical volume /dev/hde8 inconsistant", and the partition won't mount.

Any ideas?

(that pv might only now have data on it, but it created fine with the
pvcreate command earlier)

Matt.
