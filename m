From: "William Blunn" <bill@tao-group.com>
Subject: Re: [linux-lvm] To compile
Message-Id: <003901c1bad9$dd43eb50$216410ac@tao.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20020221124537.GA7834@balu.kawo2.rwth-aachen.de>
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
Date: Thu Feb 21 07:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> On Thu, Feb 21, 2002 at 01:01:48PM +0100, Pierrick PONS wrote:
> >=20
> > When I want to start with lvm, here is my problem :
> > pvcreate /dev/sdb
> > pvcreate: error in loading shared libraries: liblvm-10.so.1:=20
> cannot open=20
> > shared object file: No such file or directory
> >=20
> > I don't really understand, liblvm is in /usr/local/lib as a=20
> link pointing to=20
> > /usr/local/stow/lvm/lib .
>=20
> Is /usr/local/lib in your Library Path? Add this path to
> /etc/ld.so.conf, run ldconfig and retry it.

Er, you might find that it is a good idea to put your LVM shared library =
in /lib.

Otherwise you might have difficulting starting up the system if /usr or =
/usr/local is on an LVM volume.

Bill
--=20
William H. Blunn - bill@tao-group.com - Developer Support
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/
