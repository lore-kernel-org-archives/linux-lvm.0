Subject: Re: [linux-lvm] lvm and Debian
References: <E16RWI7-00083Z-00@arwen.dev33.cvf>
    <wvpu47hqdr.fsf@freeze.oslo.dnmi.no> <E16RX7u-0000Su-00@arwen.dev33.cvf>
    <E16RXPP-0006iF-00@brooks.homenet> <20020118114639.GE11018@wiggy.net>
From: Adrian Phillips <a.phillips@dnmi.no>
In-Reply-To: <20020118114639.GE11018@wiggy.net>
Message-Id: <wvd707ho2j.fsf@freeze.oslo.dnmi.no>
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
Date: Fri Jan 18 05:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Wichert" == Wichert Akkerman <wichert@cistron.nl> writes:

    Wichert> Previously Chris Danis wrote:
    >> These packages are present only in the 'unstable' distribution
    >> of Debian, or sid. They are not in stable nor are they in
    >> testing.

    Wichert> Hmm, indeed:

    Wichert> lvm-common | 1.3 | unstable | mips, mipsel, powerpc, sh,
    Wichert> sparc lvm-common | 1.4 | unstable | source, alpha, arm,
    Wichert> hppa, i386, ia64, m68k, s390 lvm10 | 1.0-1 | unstable |
    Wichert> sh lvm10 | 1.0.1release-1 | unstable | source, alpha,
    Wichert> arm, hppa, i386, ia64, m68k, mips, mipsel, powerpc, s390,
    Wichert> sparc

    Wichert> However you can manually grab the package for unstable
    Wichert> and install it on a testing system without any problems.

Yes, sorry about that Pierrick. I wasn't sure whether they were in
testing or unstable. I have done exactly what Wichert said (well,
actually I have setup a little pool with newer, than testing, packages
that cfengine should use for installation on our servers),

Sincerely,

Adrian Phillps

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
