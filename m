From: David =?iso-8859-1?Q?R=F6hr?= <david@rohr.se>
Message-ID: <20030719155405.GA22993@angelica.rajraj.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Broken UUID, and maybe more?
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
Date: Sat Jul 19 10:55:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

I had a crash on my system today, and when booting my PV:s had gotten
corrupt. When checking the UUID on the disks it seems that they where a
bit strange, and somewhat missing.

I tried the uuid_fixer, and also tried some stuff with dd, the script
says success, and even with the debug on it says ok.

But when checking with pvdisplay the problem still is there.

It seems to get the right information some times, when doing pvdisplay a
couple of times I get the right info, the wrong info, and sometimes,=20

pvdisplay -- ERROR "pv_check_consistency(): PE size" checking
consistency of physical volume "/dev/hdj"

Is ther any way to fix this? I don't want to lose all my data on the
disks, so now I'm hoping there is something I can do?

When running vgscan I always get..

vgscan -- ERROR "pv_read_all_pv_of_vg(): no PV" can't get data of volume
group

Can't realy see that several of my disks get broken at the same time?


/d

--=20
... david r=F6hr              |      o_
.. unix systems consultant  | o/  /\   Solaris, AIX, HP-UX
. qbranch system management | /|_, \\   and GNU/Linux Certified.
        www.qbranch.se        /                   =20
                              `
