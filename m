From: "Ben Holness" <ben@bens-house.org.uk>
Subject: RE: [linux-lvm] LVM Boot = /sbin/modprobe: error while loading
    shared libraries: libzso.1
Message-Id: <000201c18e66$847edec0$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011226234944.A22510@colombina.comedia.it>
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
Date: Wed Dec 26 17:36:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

did you run lilo again after creatinh the initrd?

<sheepish grin> No </sheepish grin>

OK, ran lilo and it got back to stage one again - cannot open libz.so.1
(error exactly the same as per my first LVM root mail) :(

I had some trouble with pvcreate because MDK set my system up with devfs
enabled.

Could this be playing some part in the problem?

Cheers,

Ben
