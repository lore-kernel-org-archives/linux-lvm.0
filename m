From: Wim Bakker <wim@unetix.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200208281556.58230.wim@unetix.nl>
Subject: [linux-lvm] filter problem
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
Date: Wed Aug 28 09:02:41 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

I am evaluating lvm2
I use the following :
LVM2.1.95.10  device-mapper.0.96.04 , kernel 2.4.19
after installing everything I copied the example.conf
to /etc/lvm/lvm.conf
Everything works fine except one thing, the filtering on
devices to scan
the corresponding entry in my lvm.conf is:
filter =3D ["a/sda/", "r/.*/"]
this is so only the sda devices get scanned as explained in
the man page. But it doesn't work , when I do a  "lvm vgscan"
it scans all devices in the /dev directory, not very nice of
lvm to not listen to its filter directives. It is a clean system,
no previous lvm was installed,  I created one vg , called data
with one pv , /dev/sda3 , size 8.68 Gb. I then created a lv , lvol0
size 1700 PE's, and the rest of the PE's (520) I keep to make a snapshot. T=
he
lvm partition will be used to store the database of an accountant
package, and the remaining PE's wil be used to make snapshots
of the database. Works all perfectly when tested, except for the scan filte=
r.
Any hints as what might be the problem?
TIA
Wim Bakker
