Subject: Re: [linux-lvm] e2fsadm and snapshots?
Message-ID: <20021105085832.GA3418@fib011235813.fsnet.co.uk>
References: <1036105045.10397.68.camel@theory.jpl.nasa.gov> <20021031232551.GG23959@clusterfs.com> <1036112887.10402.88.camel@theory.jpl.nasa.gov> <20021101044736.GB554@clusterfs.com> <1036445485.26665.79.camel@theory.jpl.nasa.gov> <20021104162915.A13741@munet-d.enel.ucalgary.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021104162915.A13741@munet-d.enel.ucalgary.ca>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Tue Nov  5 02:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 04, 2002 at 04:29:15PM -0700, Andreas Dilger wrote:
> > ...I'd like to figure this out, but in truth there's a more serious
> > problem with snapshots that means I can't use it. When the file-system
> > is under load, having a snapshot increases the system load by many
> > multiples. Example:

LVM1 snapshot performance is known to be horrible, use LVM2.

- Joe
