From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] LVM 2.0/Device-Mapper 1.0 update
Message-ID: <20030821073951.GA430@fib011235813.fsnet.co.uk>
References: <20030821000539.P29420@uk.sistina.com> <20030820231726.GM5431@electricrain.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030820231726.GM5431@electricrain.com>
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
Date: Thu Aug 21 02:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Aug 20, 2003 at 04:17:26PM -0700, Dan Sully wrote:
> * Alasdair G Kergon <agk@uk.sistina.com> shaped the electrons to say...
> 
> > I've updated the LVM 2.0 and Device-Mapper 1.0 tarballs
> > at ftp.sistina.com to incorporate a few minor bug fixes.
> > 
> > 
> > ftp://ftp.sistina.com/pub/LVM2/tools/LVM2.0-stable.tgz
> >   (CVS tag v2.00.06)
> > 
> > ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper-stable.tgz
> >   (CVS tag v1.00.03)
> 
> Do these work on the 2.6.x test series yet?

2.6 has device-mapper in it already, but it doesn't have snapshots or
the mirror target yet (needed for pvmove).

- Joe
