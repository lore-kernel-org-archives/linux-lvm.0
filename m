Subject: Re: [linux-lvm] Error - "device-mapper: request is larger than bl ock size b_size"
Message-ID: <20020821075114.GA962@fib011235813.fsnet.co.uk>
References: <EA753F4887A6ED449866D7F307ABBFDB4DB73C@mailserver.e-r-solutions.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <EA753F4887A6ED449866D7F307ABBFDB4DB73C@mailserver.e-r-solutions.com>
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
Date: Wed Aug 21 02:52:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Aug 20, 2002 at 05:57:08PM -0700, ERG@e-r-solutions.com wrote:
> If not, does anyone have an example 'mkfs.xfs -l version=2,su=X' command
> that would give me a filesystem with the appropriate alignment?  

To me it looks like you should set su to your block size, so if your
block size is 4k set su=8.  I don't use xfs myself, so you may want to
wait for confirmation before trying this.

- Joe
