From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] read_intr errors
Message-ID: <20011030085547.J690@tykepenguin.com>
References: <20011026091007.A587@tykepenguin.com> <000e01c15e63$5e91c7f0$0300000a@pacbell.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000e01c15e63$5e91c7f0$0300000a@pacbell.net>; from e@arix.com on Fri, Oct 26, 2001 at 02:15:41PM -0700
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
Date: Tue Oct 30 02:55:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 26, 2001 at 02:15:41PM -0700, Erick Calder wrote:
> > What it's warning you about is reducing the size of the LV without first
> changing
> > the size of the filesystem that is using it.
> 
> aha... maybe I could encourage the man page's maintainer to make that point
> a little clearer?

I've added some extra words to the lvreduce man page to help clarify matters,
and make it a little less scary!

 
> > If you are using an ext2 filesystem then you can use the e2fsadm command:
> >
> > # e2fsadm -l -1 /dev/LVM/mp3z
> 
> I performed the above command expecting I would have to do an lvreduce later
> but it <gasp> did it for me...  I haven't done a compare against backups to
> make sure I didn't lose data ok but I still have the problem... here's the
> output (but read beyond):

It'll be fine. e2dsadm does the filesystem AND LV changes in the right order.

> 
> by the time this code is run I've already un-mounted /var/LVM/mp3z and done
> a "vgchange -a n"... so in retrospect I can say that the only thing that has
> changed (I wasn't having these errors before installing LVM) is that I did a
> "pvcreate /dev/hdc"...
> 
> is the info above of any use and is there anything else I can try?

Don't reboot?

I'm out of ideas now, I'll have think....
 

patrick
