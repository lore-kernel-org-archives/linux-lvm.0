From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] where do i find the device mapper/LVM2 documentation?
Message-ID: <20030531091712.GB2157@gw.silicide.dk>
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
Date: Sat May 31 04:16:02 2003
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

yes it does, or atleast so with the old LVM. Here at work i run
LVM ontop of loop-aes, and PPDD ontop of LVM (different machines)

bad:
loop-aes can not change password
you encrypt the hole LVM-system
ppdd can change password, but LVM1 wont run ontop of that, and still, you
have to encrypt everything
snapshots doesnt work when you puut loop-back ontop of a LV,
unless you unmount.


> (I assume LVM2 is compatible with the existing loopback encrypting devices.)

it does work, but there are some issues


> A compressing target would be uniquely valuable because I don't think it can be implemented via a loopback device.
> 
> i.e. I believe a loopback device requires a 1:1 (or constant) ratio between input size and output size.


knoppix has a read-only encryption loop-back device. I've talked with
my fellow students about writeable encryption, and they thought that
it would be like audio/video codecs, where you also cant map an address
in the system after to an address in the system before. (sector in data
to sector in compressed data). So they thought that adding indexes would
handle the problem that you cant know how much space data takes after
compression.


> Actually, that sounds like a pretty interesting problem to try to work on.  

yeah, i guess so



JonB
