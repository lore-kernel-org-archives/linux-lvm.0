From: Benjamin Lee <benjaminlee@consultant.com>
Message-ID: <20011019195632.A8790@pov.home.ben>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] kernel 2.4.x-ac private gendisk_head
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
Date: Fri Oct 19 04:55:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi all,

In reference to:

http://lists.sistina.com/pipermail/linux-lvm/2001-October/009169.html
http://lists.sistina.com/pipermail/linux-lvm/2001-October/009171.html

I've successfully compiled a kernel, Linux pov 2.4.12-ac3 #10 SMP,
with LVM 1.0.1-rc4 (or CVS [are they the same at the moment?]) and
made the changes to lvm.c and lvm-snap.c outlined in the messages
above.

I am *just about* to create some volumes and test the whole setup
(first with ext2, then ext3).

It is to my understanding, that the modifications to support the
private gendisk_head means that the add_gendisk and del_gendisk
functions are [now] being used from ./drivers/block/genhd.c. Is this
correct? Is everything going to be happy and safe? ;-)

You can find the modified files here:

http://xaos.homeip.net/lvm/lvm.c
http://xaos.homeip.net/lvm/lvm-snap.c

--=20
Benjamin Lee
Melbourne, Australia             "Always real."    http://realthought.net/

Weather outside looks to be 12=EF=BF=BDC, mostly cloudy.
__________________________________________________________________________
If the master dies and the disciple grieves, the lives of both have
been wasted.
