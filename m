Date: Thu, 30 Aug 2001 12:09:29 +0100
Subject: Re: [linux-lvm] A Caldera related bug?
Message-ID: <20010830120929.A541@btconnect.com>
References: <OF8D6ACD21.34A36C6E-ON87256AB7.007C475A@sc.blm.gov> <20010830090848.A27345@caldera.de> <20010830032321.I541@turbolinux.com> <20010830114613.B12766@caldera.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010830114613.B12766@caldera.de>; from hch@caldera.de on Thu, Aug 30, 2001 at 11:46:13AM +0200
From: Joe Thornber <thornber@btconnect.com>
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

On Thu, Aug 30, 2001 at 11:46:13AM +0200, Christoph Hellwig wrote:
> On Thu, Aug 30, 2001 at 03:23:21AM -0600, Andreas Dilger wrote:
> > In the end, what is really needed is a well-defined LVM API between
> > kernel and user-space that doesn't pass this kind of stuff.
> 
> Completly agreed.

I think every one is aware of this, but we can't change the interface during
the 2.4 series.  If you're interested check out the LVM2 module and look
at the code in driver/device-mapper (dm.h is a good intro).

- Joe
