From: Anders Widman <andewid@tnonline.net>
Message-ID: <4131936328.20021126213826@tnonline.net>
Subject: Re: [linux-lvm] LVM for a Database
In-Reply-To: <012401c2958a$6b6baf40$4b66699f@win.doc.state.vt.us>
References: <012401c2958a$6b6baf40$4b66699f@win.doc.state.vt.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue Nov 26 14:38:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Joseph Kezar <linux-lvm@sistina.com>

> We are in the process of building a database on a 4 processor 1.8GHz, 4GB RAM Dell 6650.

> I am trying to figure out the most efficient way to use LVM for our raw data storage.  We have a RAID array with 8x36GB drives in it.  Should I do a raid 1+0(mirror 4 disks, and span them to get
> one logical volume)?

This  is  a  fast  and easy setup.. But what will you use to the disks
for?  RAID  5  is generally fast and space efficient, though it can be
slower on writes.

> If so this leaves me a /dev/sdb.  Or would I get better performance if I mirror 1 + 5, 2 + 6, 3 + 7, 4+ 8 to give me /dev/sd[b-e].
> Is it possible to figure out where the center of our spindles are?  So I can arrange for the heads to spend little time seeking?

By  mirroring  pairs  your would end up with 4 logical drives that you
can  use LVM (with striping if necessary) on top and have more freedom
to  replace and change drive setup (like if you want to replace a pair
of disks for newer/bigger models).

I am not sure if LVM 1.x support changing size of striped volumes, but
LVM  2  should  have  much  freedom  to do basically whatever you want
(still in beta though). Disk spanning with LVM 1 is quite fast though,
for most applications.

> Any perfomance hints would be greatly appreciated.


> thanks
> Joe K.
