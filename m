From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] debian package
Message-Id: <20020215111547.GE1078@tykepenguin.com>
References: <20020212232032.GB2993@gmx.de>
    <200202130006.AA188608817@fb0442.mathematik.tu-darmstadt.de>
    <20020213002332.GB8060@gmx.de> <20020213025236.GA26408@dmcom.net>
    <20020215110355.GA4651@gondor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020215110355.GA4651@gondor.com>
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
Date: Fri Feb 15 05:16:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Feb 15, 2002 at 12:03:55PM +0100, Jan Niehusmann wrote:
> On Tue, Feb 12, 2002 at 09:52:37PM -0500, Wayne Topa wrote:
> > Wiktor Wodecki(wodecki@gmx.de) is reported to have said:
> > > hm. Well, I search with apt-cache, dpkg -s dpkg -L and on the debian.org
> > > webpage...anyway, forget that then :-)
> > > 
> > Wiktor
> > 
> >   It's not in woody so maybe that is in the sid (unstable) branch.(?)
> 
> You're right, lvm10 is in debian sid, not in woody. As far as I can tell
> this is caused by build problems on powerpc and s390. There seems to be
> a patch for s390 available, I don't know about s390. 
> 
> It would be great if lvm10/lvm-common could become part of debian woody.
> So if somebody knows how to fix this, please tell!
> 

There were fixes to the way LVM uses the kernel headers for 1.0.2 that _may_ fix
those problems.

patrick
