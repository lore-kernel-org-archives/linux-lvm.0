From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Partitions on same Drive
Message-Id: <20020122090008.GD1244@tykepenguin.com>
References: <20020121214908.F22618@colombina.comedia.it>
    <Pine.LNX.4.33.0201211527050.7136-100000@lx1.daboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0201211527050.7136-100000@lx1.daboard.com>
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
Date: Tue Jan 22 03:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 21, 2002 at 03:28:35PM -0600, mitch@mdmiller.com wrote:
> > if you don't create striped LVs on the two partitions i see no
> > significant performance problem.
> 
> Brings up a question ... can you get improved performance by striping to
> multiple devices on the same SCSI channel, or do they really need to be on
> separate SCSI channels for good performance?  Ex: I have a fibre channel
> card, and multiple drives I'm gonna hook up ... someday.  Can I strip
> across all the drives and expect to push fibre channel's capabilities?

This does work OK provided that you don't hit the transfer limit on the SCSI
channel. If you have a fast SCSI and slow disks then striping can be beneficial.
Even an Ultra160 SCSI disk is unlikely to be sending 160MB/s continuously (it
has to seek at some time!) so, in theory, you should get some benefit.

My much maligned (and rightly so) striping graph shows that striping on my
interface works well for up to 3 disks on one fibre-channel.

Try it...!

patrick
