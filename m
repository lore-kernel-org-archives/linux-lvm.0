From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] lvm and Debian
Message-Id: <20020118114639.GE11018@wiggy.net>
References: <E16RWI7-00083Z-00@arwen.dev33.cvf>
    <wvpu47hqdr.fsf@freeze.oslo.dnmi.no> <E16RX7u-0000Su-00@arwen.dev33.cvf>
    <E16RXPP-0006iF-00@brooks.homenet>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16RXPP-0006iF-00@brooks.homenet>
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
Date: Fri Jan 18 05:47:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Previously Chris Danis wrote:
> These packages are present only in the 'unstable' distribution of Debian, 
> or sid. They are not in stable nor are they in testing.

Hmm, indeed:

lvm-common |        1.3 |      unstable | mips, mipsel, powerpc, sh, sparc
lvm-common |        1.4 |      unstable | source, alpha, arm, hppa, i386, ia64, m68k, s390
     lvm10 |      1.0-1 |      unstable | sh
     lvm10 | 1.0.1release-1 |      unstable | source, alpha, arm, hppa, i386, ia64, m68k, mips, mipsel, powerpc, s390, sparc

However you can manually grab the package for unstable and install it
on a testing system without any problems.

Wichert.

-- 
  _________________________________________________________________
 /wichert@wiggy.net         This space intentionally left occupied \
| wichert@deephackmode.org            http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
