Subject: Re: [linux-lvm] kernel 2.2.19 support
References: <3BBC4146.51CD437D@promofinarsa.es>
	<wv669v3b96.fsf@freeze.oslo.dnmi.no> <3BBC4E6E.BCA3EE70@promofinarsa.es>
	<wvzo771uju.fsf@freeze.oslo.dnmi.no> <3BBC535B.59D6A5CB@promofinarsa.es>
	<wv3d4zh1r8.fsf@freeze.oslo.dnmi.no>
	<20011004111023.C31061@turbolinux.com>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 04 Oct 2001 19:18:45 +0200
In-Reply-To: <20011004111023.C31061@turbolinux.com>
Message-ID: <wvy9mrfhmy.fsf@freeze.oslo.dnmi.no>
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Andreas" == Andreas Dilger <adilger@turbolabs.com> writes:

    Andreas> What you need to do to "properly" fix this is add a lines
    Andreas> like

    Andreas> #if LINUX_VERSION_CODE > KERNEL_VERSION ( 2, 3, X) foo.de
    Andreas> = bar; #endif

    Andreas> around the two offending code sections, and find the
    Andreas> appropriate kernel version where this entry was added.
    Andreas> This can be done by looking at the kernel CVS:
    Andreas> http://lxr.linux.no/

Yes, but what concerned me was if there was some equivalent for 2.2
(foo.dev22 = bar). I was going to check the LVM CVS to see what
changes had been done but was unable to login :-

bash-2.03$  cvs -d :pserver:cvs@cvs.globalfilesystem.org:/data/cvs login
Logging in to :pserver:cvs@cvs.globalfilesystem.org:2401/data/cvs
CVS password: 
cvs login: authorization failed: server cvs.globalfilesystem.org rejected access to /data/cvs for user cvs

I did this according to the LVM CVS page,

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
