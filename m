Subject: Re: [linux-lvm] FWD: Re: Draft Snapshot Regression Test
Message-ID: <20020829151752.GA4391@fib011235813.fsnet.co.uk>
References: <20020829150824.WQMQ2113.imf22bis.bellsouth.net@TAZ2>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020829150824.WQMQ2113.imf22bis.bellsouth.net@TAZ2>
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
Date: Thu Aug 29 10:18:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 29, 2002 at 11:07:12AM -0400, Greg Freemyer wrote:
> On the xfs regression test I posted yesterday, there is concern that my check for lvm being present in the kernel is not general enough to check LVM 1 and LVM 2, or even EVMS.

For LVM2 kernel side:

grep device-mapper /proc/devices


For LVM2 tools:

lvm vgdisplay --version

and look for a > 1.9x version number, eg,

LVM version:     1.95.10-cvs (2002-05-31)
Library version: 0.96.03-ioctl-cvs (2002-06-27)
Driver version:  1.0.3


- Joe
