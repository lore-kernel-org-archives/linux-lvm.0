From: Gingia <gingiabios@email.it>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200309231754.20420.gingiabios@email.it>
Subject: [linux-lvm] vgcfgrestore and bootstrap
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
Date: Tue Sep 23 11:03:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all.
I write in this list to explain the problem with the meta data and the=20
inconsistence.

Thank to Heinz J . Mauelshagen i solve the principal problem.

Now i have another problem caused by the same root.

When i start the devlopment  server (debian woody), it remain in the runl=
evel=20
1 e ask me the pass to root access for device-filesystem problem.
It said that it had problem with the  lvm.

To start the sewrver i must to :
1) vgcfgrestore -n volume1 -f /etc/lvmconf/volume1.conf /dev/i2o/hda3
2) vgchange -a y
3) mount -a=20
 and only now i can go to runlevel 2 for normal start.

So i understand that 1) the "restoring" metadata is a routine operation a=
t=20
boostrap instead of a propely restoring 2) for some reason this does not=20
happen more.

So my question is: Why ?
How i can restabilished this at boot time? I can move to solve this other=
=20
problem?
Can you help me?
