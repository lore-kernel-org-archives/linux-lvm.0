From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] filesystem corruption...
Message-Id: <20020228100118.A25011@sistina.com>
References: <224974437.20020227233630@tnonline.net>
    <20020227164228.A964@lynx.adilger.int> <3399590000.1014862362@tiny>
    <77527890.20020228065139@tnonline.net>
    <45423062.20020228093553@tnonline.net>
MIME-Version: 1.0
In-Reply-To: <45423062.20020228093553@tnonline.net>; from
    andewid@tnonline.net on Thu, Feb 28, 2002 at 09:35:53AM +0100
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
Date: Thu Feb 28 03:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 28, 2002 at 09:35:53AM +0100, Anders Widman wrote:
> 
> >> On Wednesday, February 27, 2002 04:42:28 PM -0700 Andreas Dilger <adilger@clusterfs.com> wrote:
> 
> >>> On Feb 27, 2002  23:36 +0100, Anders Widman wrote:
> >>>> Unfortunatley, something went seriously wrong. I can't mount the disk
> >>>> any more, or use reiserfsck. They (mount/reiserfsck) say there isn't
> >>>> a valid filesystem on the device. Vgscan does however find all devices
> >>>> and can activate the volume group, but reiserfsck doesn't work.
> >>>> 
> >>>> What should I do to be able to save a s much data as possible?
> >>> 
> >>> dd if=/dev/vg/lv of=/new/disk conv=sync,noerror
> 
> >> Then we should be able to use debugreiserfs and reiserfsck to 
> >> find a copy of the super in the log, or just recreate it.
> 
> >> -chris
> 
> > So. How much space would this require on the 'new' disk? The same
> > amount as the entire LV? If that is, it would be impossible (for me,
> > economically) to do this.
> 
> > The disk with bad blocks is 80GB, and I have a "spare" 80GB disk, but
> > not more.
> 
> > //Anders
> 
> Oh, I forgot to ask how I can recover the filsystem
> header/suprtblock.. What exactly is "dd if=/dev/vg/lv of=/new/disk
> conv=sync,noerror" doing to the data, except copying it to the new
> device?

It copies all it can read to another sane device so that youe don't loose
more data if your drive turns worse.

After that, you want to use "reiserfsck --rebuild-sb /dev/vg/lv".


> 
> //Anders
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
