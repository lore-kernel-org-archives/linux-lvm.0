From: Kevin Corry <corryk@us.ibm.com>
Subject: Re: [linux-lvm] Re: [PATCH] 2.5 version of device mapper submission
References: <1034453946.15067.22.camel@irongate.swansea.linux.org.uk> <20021015103427.GH5294@suse.de> <02101509523700.05920@boiler>
In-Reply-To: <02101509523700.05920@boiler>
MIME-Version: 1.0
Message-Id: <02101510060901.05920@boiler>
Content-Transfer-Encoding: 8bit
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
Date: Tue Oct 15 11:00:32 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@suse.de>, Joe Thornber <joe@fib011235813.fsnet.co.uk>
Cc: linux-lvm@sistina.com, linux-kernel@vger.kernel.org, evms-devel@lists.sourceforge.net

On Tuesday 15 October 2002 09:52, Kevin Corry wrote:
> Also, am I correct in assuming that for merge_bvec_fn() to work properly, a
> driver's merge_bvec_fn() must also call the merge_bvec_fn() of the driver
> below it? For example, lets say we have a DM linear device that maps to two
> underlying devices (or in LVM-speak, a linear LV that spans two PVs), both
> of which are MD RAID-1 devices. For a given large request, DM may decide
> that it is fully contained within one of its two target devices, and allow
> all the requested pages to be added to the bio. However, it also needs to
> ask MD what its limits are for that request, or MD would still have to go
> through the trouble to split up the bio after it has been submitted.

This example actually should have been RAID-0 (striping), not RAID-1 
(mirroring). Sorry if this caused any confusion.

-- 
Kevin Corry
corryk@us.ibm.com
http://evms.sourceforge.net/
