Subject: Re: [linux-lvm] kernel 2.2.19 support
References: <3BBC4146.51CD437D@promofinarsa.es>
	<wv669v3b96.fsf@freeze.oslo.dnmi.no> <3BBC4E6E.BCA3EE70@promofinarsa.es>
	<wvzo771uju.fsf@freeze.oslo.dnmi.no> <3BBC535B.59D6A5CB@promofinarsa.es>
	<wv3d4zh1r8.fsf@freeze.oslo.dnmi.no>
	<20011004111023.C31061@turbolinux.com>
	<wvy9mrfhmy.fsf@freeze.oslo.dnmi.no>
	<20011004114903.G31061@turbolinux.com>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 04 Oct 2001 20:05:42 +0200
In-Reply-To: <20011004114903.G31061@turbolinux.com>
Message-ID: <wvpu83ffgp.fsf@freeze.oslo.dnmi.no>
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

    Andreas> On Oct 04, 2001 19:18 +0200, Adrian Phillips wrote:
    >> Yes, but what concerned me was if there was some equivalent for
    >> 2.2 (foo.dev22 = bar). I was going to check the LVM CVS to see
    >> what changes had been done but was unable to login :-

    Andreas> It was just added recently (probably a devfs thing).
    Andreas> Before that, it just ran the "lvm_fs_setup()" (or
    Andreas> whatever) function, and didn't do anything with the
    Andreas> output.  Hmm, that means my suggestion may be broken.

    Andreas> Need something like:

    Andreas> #if LINUX_KERNEL_VERSION > KERNEL_VERSION (2, 3, 38)
    Andreas> foo.de = #endif lvm_fs_setup();

Great thanks for the help. I'll have a look at the weekend. It anyone
else with troubles wants to beat me to it, be my guest :-)

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
