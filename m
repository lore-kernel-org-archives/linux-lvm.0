From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] resizing logical volumes
Message-ID: <20020710133238.GC822@tykepenguin.com>
References: <3D2C3003.3090307@jumpline.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D2C3003.3090307@jumpline.com>
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
Date: Wed Jul 10 08:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jul 10, 2002 at 09:00:51AM -0400, Ben Snyder wrote:
> OK, I asked a question here the other day that ended up being a 
> filesystems question, sorry, but thanks for removing my head from my 
> arse on that one (I knew that, really I did).
> 
> While I was asking that question, I also asked about adding existing 
> partitions on other devices to a logical volume/volume group.
> 
> The reply I got was this:
> 
> pvcreate /dev/device
> vgextend VolGroupName /dev/device
> lvextend --size +60G LogicalVolumePath
> 
> 
> This all seemed to work just fine, in fact when I do a lvdisplay and 
> vgdisplay, it says 120G (which is what I expected it to be).  However, 
> when I try to perform the e2fsadm, I get the following (and I'm not an 
> idiot, I'm using/seeing the actual paths here):
> 
> e2fsadm --size +20G LogicalVolumePath
> e2fsadm -- new size too large for "LogicalVolumePath"
> e2fsadm -- size of "LogicalVolumePath" would  be invalid
> 
> I thought to myself, 'Maybe I did this already.'  I was, afterall, just 
> starting me 1st cup of coffee.  Whenever I mount the filesystem and do a 
> df -h, it still reports 59G, which is what I started at.  
> 
> While this might still be a FS issue, I still can find nowhere else to 
> turn for assistance.

e2fsadm  does the logical volume resize as well as the filesystem stuff - so
effectively it is trying to do the same thing twice.

What you need to do now is simply the second part of what e2fsadm does and that
is the resize2fs

patrick
