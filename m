From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] debian package
Message-Id: <20020215113624.GF1078@tykepenguin.com>
References: <20020212232032.GB2993@gmx.de>
    <200202130006.AA188608817@fb0442.mathematik.tu-darmstadt.de>
    <20020213002332.GB8060@gmx.de> <20020213025236.GA26408@dmcom.net>
    <20020215110355.GA4651@gondor.com> <20020215112826.GO32284@wiggy.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020215112826.GO32284@wiggy.net>
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
Date: Fri Feb 15 05:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Feb 15, 2002 at 12:28:26PM +0100, Wichert Akkerman wrote:
> Previously Jan Niehusmann wrote:
> > You're right, lvm10 is in debian sid, not in woody. As far as I can tell
> > this is caused by build problems on powerpc and s390. There seems to be
> > a patch for s390 available, I don't know about s390. 
> 
> And things like the little problem that the LVM tools apparently do
> nothing but segfault on sparc since they mix -fPIC and -pg (see
> http://bugs.debian.org/123322).

Which was also fixed in 1.0.2

Patrick
