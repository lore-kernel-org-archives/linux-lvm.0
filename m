From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] where do i find the device mapper/LVM2 documentation?
Message-ID: <20030530172355.GD445@fib011235813.fsnet.co.uk>
References: <20030530171732.KHXN4433.imf46bis.bellsouth.net@tiger2>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030530171732.KHXN4433.imf46bis.bellsouth.net@tiger2>
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
Date: Fri May 30 12:24:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 30, 2003 at 01:22:32PM -0400, Greg Freemyer wrote:
>  >>  On Thu, May 29, 2003 at 10:21:27PM +0100, Joe Thornber wrote:
>  >>  > On Thu, May 29, 2003 at 02:27:15PM +0200, Daniel Phillips wrote:
>  >>  > 
>  >>  > If you're interested in writing your own targets I suggest you look at
>  >>  > a couple of the trivial targets that already exist.  Such as
>  >>  > dm-linear.c, dm-stripe.c.
> 
>  >>  i am planning to write my own targets as a graduate project.
>  >>  My idea was encryption and possibly compression as well.
>  >>  (is anyone else doing any of these targets?)
> 
> An encrypting target would be nice, but does it offer any value over an encrypting loopback device?

I still don't trust the loop device enough to use it.

- Joe
