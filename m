From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] snapshot performance question
Message-ID: <20030410081312.GA1029@fib011235813.fsnet.co.uk>
References: <20030409222402.BMRV1717.imf25bis.bellsouth.net@tiger2>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030409222402.BMRV1717.imf25bis.bellsouth.net@tiger2>
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
Date: Thu Apr 10 03:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 09, 2003 at 06:27:06PM -0400, Greg Freemyer wrote:
> Is this a clear cut case of moving my snapshot lv to the ide drive
> would be faster, or do I need to do performance testing to be sure?

There are two aspects to snapshot performance:

1) Normal io to an origin or already copied area
2) Time taken to perform a copy on write exception

We normally recommend people put their snapshots on a seperate
physical volume in order to minimise seeking for (2).  However your
raid volume will probably be faster than the IDE for (1).  So which
drive is best is going to depend on your use of the volume, if your
data isn't changing much, then you should probably optimise for (1).

Maybe you should do some benchmarks :)

- Joe
