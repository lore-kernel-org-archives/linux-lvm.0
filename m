Message-ID: <00bd01c2c710$52576aa0$0a42a8c0@darkstar>
From: "Thomas Kleffel" <thomas.kleffel@maintech.de>
References: <Pine.LNX.4.44.0301281418370.5767-100000@zeus.itg.uiuc.edu>
Subject: Re: [linux-lvm] resize LV
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
Date: Tue Jan 28 15:01:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi!

> I know how to expand the LV while the LV is mounted, piece of cake
> (lvextend -L+50GB /dev/homevg/userslv - expands userslv by 50GB). But how
> do I expand the filesystem while it is mounted? I don't want to
> umount the filesystem down to do this.
>
> The filesystem is an ext3 filesystem. Can I use resize2fs?

No, afaik neither ext2 nor ext3 support resizing while being mounted.
And if I'm not wrong JFS and ReiserFS can't do this either but XFS can.

I'm using XFS for this reason and it works fine for me.

Bye,

Tommy
