From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Problems mounting LVM root volume
Message-ID: <347670000.1041094308@[192.168.200.4]>
In-Reply-To: <1041074125.3e0d87cdaaece@ogd.nl>
References: <1041074125.3e0d87cdaaece@ogd.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Sat Dec 28 10:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


> Does anybody got any ideas? I've run out of them

<brokenrecord iter=1073741824>

Take your root volume off of LVM. If there is any problem
with the system then you cannot fix it if the root volume
is inaccessable. The simplest fix is to leave /boot on
your root volume and push /usr and /var onto their own
LV's (along with /home, /opt or /usr/local, some scratch
space and /home). The point is to make sure that there is
enough of a system avaiable that you can boot single-user
if LVM is cooked and fix the problem. If you are stuck
booting off of a CD then you don't really know what the
problem is or what it looks like at boot time.

In my own case I use tmpfs for /tmp, 2GB for /scratch,
have a rather small /home and large /sandbox (where things
managed through CVS live).

</brokenrecord>

You might want to poke around in the rc.sysint (whatever
the dist uses for it) and convince yourself that vgchange
is happening after devfsd is started up.

If your root is off of LVM then you can put something like:

	/bin/grep 'single' /proc/cmdline && exit 0;

near the top of your rc.sysinit (whatever) file --
obviously after mouting /proc -- which is after /
has been fsck-ed. Depending on how high you put this
it allows you to walk down the startup process and see
what environment the startup file is living in. If you
don't like "single" as the word then try "foobar" or
"kwitit". After the system has left itself in low-level
mode you can step through the rc.sysinit by cut+paste
or simply checking the commands by hand yourself.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
