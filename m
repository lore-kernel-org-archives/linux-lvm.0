From: James Hawtin <oolon@ankh.org>
In-Reply-To: <20020726071225.GP1139@tykepenguin.com>
Message-ID: <Pine.LNX.4.44.0207261049130.4868-100000@pzat.meep.org>
MIME-Version: 1.0
Subject: [linux-lvm] pvmove bugette in 1.1-rc2
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
Date: Fri Jul 26 06:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

a couple of days ago I was rebuilding my disks and came across a bugette
in 1.1-rc2.

Being stupid I hadn't upgraded the particular box from 1.0.3 before trying
a pvmove so it only moved 2 gb of my striped partition, from from one disk
to the new one. So I end up with one stripe split across 2 disks after
upgrading I found that pvmove refused to move the remaining part of the
stripe to the new disk or infact the part I just moved back to the orginal
disk complaining "not enough free space", there was enough free space on
the disk. I guess there is a check in pvmove for striped partitions going
if part of the striped partition is already on a pv don;t allow any other
part if it to be moved to the same disk... This check needs to be improved
so it checks to see if the range being moved is part of the same stripe
and the part already on the disk.

In the end I tared all the data off (it was small 6gb) and rebuild the
whole filesystem onto a newly created lv.

James
