From: Markus Schaub <markus.schaub@gmx.net>
Subject: Re: [linux-lvm] "invalid i/o-protocol version" with e2fsadm
    (1.0.3) and 2.4.18
Message-Id: <20020227185436.B539@sparcie.schaub.loc>
References: <20020227131803.A188@sparcie.schaub.loc>
    <20020227102215.N12832@lynx.adilger.int>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020227102215.N12832@lynx.adilger.int>; from
    adilger@turbolabs.com on Wed, Feb 27, 2002 at 10:22:15AM -0700
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
Date: Wed Feb 27 11:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@sistina.com

Am 27 Feb 2002 schrieb Andreas Dilger:
> > I always get an "i/o protocol version" error when trying to resize a
> > lv witch e2fsadm (statically linked, from lvm-1.0.3 with kernel
> > 2.4.18).
> You probably have two copies of e2fsadm in your path.  Try something
> like 'which e2fsadm' or 'whereis e2fsadm'.  The other possibility is
> that your static liblvm.a is the wrong one.

That's it. e2fsadm called the old lvextend/lvreduce sitting in /sbin
and not my new one in /usr/local/sbin.

Thanks,
 Markus
