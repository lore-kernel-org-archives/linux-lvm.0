From: "William Blunn" <bill@tao-group.com>
Subject: Re: [linux-lvm] Rescue cd for lvm 1.0.3
Message-Id: <003301c1beb5$e3e04b90$216410ac@tao.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.A32.4.33.0202261151050.20290-100000@as1.viastore.de>
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
Date: Tue Feb 26 05:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> not really a lvm problem, but after moving my system to boot from an
> root-lvm, my lilo stops with the LI error. I think, rewriting the lilo
> could help, but how can I access my system datas?

"boot from an root-lvm" ... sounds dodgy to me.

You can have the *root* filesystem "/" on an LVM volume.

However the *boot* filesystem should be /boot, which should be a small
ext2 partition mounted directly on a partition.

Bill
--=20
William H. Blunn - bill+linuxlvm@tao-group.com
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/
