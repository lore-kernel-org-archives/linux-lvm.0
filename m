From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] How to best use LVM?
Message-ID: <20020814212731.B1492@uk.sistina.com>
References: <20020814165938.152D1F90D@tater> <20020814174547.GB898@fib011235813.fsnet.co.uk> <20020814184728.61BCEF90D@tater> <20020814193754.GA16344@chunk.voxel.net> <20020814195039.22829F90D@tater>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020814195039.22829F90D@tater>; from pll+lvm@lanminds.com on Wed, Aug 14, 2002 at 03:50:38PM -0400
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
Date: Wed Aug 14 15:28:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pll+lvm@lanminds.com
Cc: linux-lvm@sistina.com

On Wed, Aug 14, 2002 at 03:50:38PM -0400, pll+lvm@lanminds.com wrote:
> 	   make symlinks

This is only meant as a convenience for developers.
It doesn't update the kernel config / makefiles, or apply any 
of the other necessary patches.

device-mapper is not in your kernel.

I'll update the install document for the next release to make things clearer.


During the current development phase, we're only supporting one kernel
at once - currently it's 2.4.19.  Supporting more kernels would take up
too much of our time, I'm afraid, as we're only a small team.
 

If you can use 2.4.19, use the latest tarball (beta 5) from

  ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper.0.96.04.tgz

Configure and make apply-patches, enable device-mapper in your kernel
configuration and rebuild.


Otherwise your best bet is to download the last release that *did* support
2.4.18 and use that (beta 2):

  ftp://ftp.sistina.com/pub/LVM2/device-mapper/old/device-mapper.0.95.07.tgz

Compare it with the current release and work out what needs
changing to bring it up-to-date, or else put up with any bugs it
contained that we have fixed since.


Alasdair
-- 
agk@uk.sistina.com
