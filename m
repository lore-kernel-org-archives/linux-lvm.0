Subject: Re: [linux-lvm] How to best use LVM?
Message-ID: <20020814202334.GA620@fib011235813.fsnet.co.uk>
References: <20020814165938.152D1F90D@tater> <20020814174547.GB898@fib011235813.fsnet.co.uk> <20020814184728.61BCEF90D@tater> <20020814193754.GA16344@chunk.voxel.net> <20020814195039.22829F90D@tater>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020814195039.22829F90D@tater>
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
Date: Wed Aug 14 15:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Aug 14, 2002 at 03:50:38PM -0400, pll+lvm@lanminds.com wrote:
> 
> In a message dated: Wed, 14 Aug 2002 15:37:54 EDT
> Andres Salomon said:
> 
> >The debian packages are pretty out of date (since 2.4.19 took _forever_),
> >I'll be uploading new ones tonight.
> 
> Oh. okay.  I guess I can wait until tomorrow to play then :)
> 
> Thanks.
> 
> >/proc/misc should definitely not be empty; is the device mapper driver
> >loaded in the kernel?  (lsmod |grep dm, if it's compiled as a module).
> 
> Well, that's the interesting part.  I'm not using modules, so I don't 
> know how to tell.  Here are the steps I took to build the 
> device-mapper:

Once you've patched the kernel go into make (x|menu)config and check
that the device-mapper option is available and selected under the
'Multi-device support (RAID and LVM)'.  If it's not available you
haven't patched the kernel correctly.  Also I would encourage you to
upgrade to a 2.4.19 kernel.

- Joe
