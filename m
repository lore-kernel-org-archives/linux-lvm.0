Subject: Re: [linux-lvm] Error - "device-mapper: request is larger than block size b_size"
Message-ID: <20020820213555.GA15363@fib011235813.fsnet.co.uk>
References: <EA753F4887A6ED449866D7F307ABBFDB4DB68E@mailserver.e-r-solutions.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <EA753F4887A6ED449866D7F307ABBFDB4DB68E@mailserver.e-r-solutions.com>
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
Date: Tue Aug 20 16:36:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Aug 20, 2002 at 09:36:02AM -0700, ERG@e-r-solutions.com wrote:
> Greetings,
> 
> I'm running two XFS 1.1 filesystems on top of a pair of LVM 2 volumes.  My
> version info is:
> 
> tapemaster:/# uname -r && lvm version
> 2.4.19-xfs
>   LVM version:     1.95.10 (2002-05-31)
>   Library version: 0.96.03-ioctl (2002-06-27)
>   Driver version:  1.0.3
> 
> What I'm seeing is thousands of lines of this:
> 
> device-mapper: request is larger than block size b_size (2048), block size
> (512)

Sorry about this, it's an overly verbose sanity check that I put in
when we were having problems with xfs writing misaligned blocks.  I've
knocked it out of the latest bitkeeper repository:

bk://device-mapper.bkbits.net/2.4-stable

cvs will get updated at some point.

Alternatively just knock out this if statement from dm.c:

        /*
         * Sanity checks.
         */
        if (bh->b_size > block_size)
                DMERR("request is larger than block size "
                      "b_size (%d), block size (%d)",
                      bh->b_size, block_size);


If you are using xfs please be aware that you will need to use the new
journal log format to avoid misalignment problems (search this list
for previous posts).

- Joe
