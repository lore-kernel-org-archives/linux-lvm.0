Date: Thu, 11 Oct 2001 02:50:38 +0200
From: Peter Palfrader <peter@palfrader.org>
Subject: Re: [linux-lvm] eta for a 2.4.10 compatible release?
Message-ID: <20011011025038.A21437@marvin.palfrader.org>
References: <20011011023724.A22101@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011011023724.A22101@cistron.nl>
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

Hi Wiggy!

On Thu, 11 Oct 2001, Wichert Akkerman wrote:

> I'm looking at the LVM CVS tree and the last change in the kernel
> patches I can find is from August 22, and the patches don't
> apply to a 2.4.10 ( which is almost 3 weeks old now) or 2.4.11,
> either Linus or ac tree.
> 
> Are there any plans to make a new release that does work with a
> recent kernel or even just to update the CVS? 

The LVM source at ftp://ftp.sistina.com/pub/LVM/1.0/ builds
patches that apply and build fine with 2.4.11. I don't know whether
they work fine too - I've not rebooted yet.

ftp://ftp.sistina.com/pub/LVM/1.0/CHANGELOG:

[..]
| Driver
| ------
| o now works with 2.4.10
[..]


					yours,
					peter

-- 
 PGP signed and encrypted  |  .''`.  ** Debian GNU/Linux **
    messages preferred.    | : :' :    By professionals,
                           | `. `'      for professionals
 http://www.palfrader.org/ |   `-    http://www.debian.org/
