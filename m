Return-Path: <jamesp@foobarhouse.com>
Date: Tue, 31 Jul 2001 12:20:02 +0100 (BST)
From: James Pattinson <jamesp@foobarhouse.com>
Message-ID: <Pine.LNX.4.33.0107311215030.6499-100000@greebo.foobarhouse.com>
MIME-Version: 1.0
Subject: [linux-lvm] Snapshot Info
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi

OK, I've got snapshots working now that I've re-created my PVs with beta8
tools.

Where can I find some more info about how snapshots work? I'm a bit
confused as to how space is allocated. Here's an example of what I'm
seeing:

I have a 3GB LV called /dev/vg00/lvol6 that is about half full.

1.	Created a 512MB snapshot LV for this LV
2.	Copied 9MB worth of data to /dev/vg00/lvol6
3.	Looked at lvdisplay /dev/vg00/snap_lvol6 and 18MB is used in the
snapshot.

Where does the figure 18MB come from? is the fact that it is 2 x 9MB
significant?

I'd quite like to know how big I should be making my snapshots.

Cheers!!

James
