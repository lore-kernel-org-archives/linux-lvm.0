Message-Id: <005201c1e56c$c6d39bf0$6501a8c0@bomoon>
From: "bo" <bo@sosnetwork.net>
References: <2D0AFEFEE711D611923E009027D39F2B02F124@cdserv.meridian-data.com>
    <4186.200.184.103.3.1018972960.squirrel@www.dokbua.com>
    <20020416163659.GA19531@balu.kawo2.rwth-aachen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM tool limitation on using whole disk
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
Date: Tue Apr 16 12:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello LVM gurus,

I read the following;

"There is one important "limitation" when using whole disk. The LVM tools
used to setup
 LVM will recognize a whole disk as possible device for LVM ONLY if it has
NO
 partition table! If the disk already has one, even an empty one, LVM will
refuse to use it."

Is it still TRUE?

I am going to make several MDs on several whole disks, and then combine them
as a
volume. How could I avoid this problem?

Thanks,

Bo
