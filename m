From: "William Blunn" <bill+f.20020227@tao-group.com>
Subject: Re: [linux-lvm] Manegeability with LVM
Message-Id: <000101c1c41f$ed9dda20$216410ac@tao.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2712663015.20020304230010@tnonline.net>
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
Date: Tue Mar  5 02:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Would it be possible to setup up a software redundancy like RAID5 with
> LVM so I can keep this manageability LVM gives me?

Yes.

It's in the docs.

LVM can do (in effect) linear appending and RAID0 internally.

If you want RAID5, you just do it underneath LVM.

Create one or more RAID5 set(s) using RAID tools (not part of LVM). This
will give you one or more software RAID device(s).

Then create LVM PVs on the RAID devices. The rest is all normal LVM
stuff.

http://www.google.com/search?q=3Dlinux+software+raid

Bill
--=20
William H. Blunn - <bill+s.20020227@tao-group.com>
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/
