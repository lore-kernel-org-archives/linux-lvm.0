From: Daniel Phillips <dphillips@sistina.com>
Subject: Re: [linux-lvm] where do i find the device mapper/LVM2 documentation?
References: <20030530171732.KHXN4433.imf46bis.bellsouth.net@tiger2>
In-Reply-To: <20030530171732.KHXN4433.imf46bis.bellsouth.net@tiger2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200305302005.30999.dphillips@sistina.com>
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
Date: Fri May 30 13:04:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Greg Freemyer <freemyer@NorcrossGroup.com>

On Friday 30 May 2003 19:22, Greg Freemyer wrote:
>  >>  On Thu, May 29, 2003 at 10:21:27PM +0100, Joe Thornber wrote:
>  >>  > On Thu, May 29, 2003 at 02:27:15PM +0200, Daniel Phillips wrote:
>  >>  >
>  >>  > If you're interested in writing your own targets I suggest you look
>  >>  > at a couple of the trivial targets that already exist.  Such as
>  >>  > dm-linear.c, dm-stripe.c.
>  >>
>  >>  i am planning to write my own targets as a graduate project.
>  >>  My idea was encryption and possibly compression as well.
>  >>  (is anyone else doing any of these targets?)
>
> An encrypting target would be nice, but does it offer any value over an
> encrypting loopback device?

Simplicity and reliability?

Regards,

Daniel
