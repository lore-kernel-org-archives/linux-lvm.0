From: Gerald Catling <geraldcc@optusnet.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200305140813.46680.geraldcc@optusnet.com.au>
Subject: [linux-lvm] LVM resizing
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
Date: Tue May 13 17:19:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Greetings from oz to all,

I have just started to use LVM with SuSE 8.1, after reading an article in=
=20
LinuxPro form the makers of Linux Format in the UK.

Istallation went well.
However resizing goes verry badly and the article implies it is possible =
to=20
grow and shrink  --- usr,home and data partitions.

Although partitions change size, KDiskfree does not show any changes.
e2fschk shows block size missmatch and gives up.
LVM in the SuSE control panel shows the correct size, but i cannot use it=
=2E
By the way growing/shrinking looses some 100MBytes of data, regrowing rec=
overs=20
some 70MBytes of data, not all good data as far as i can see.

Any help on this problem would be appreciated
Gerald
