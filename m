From: Herbert =?iso-8859-1?Q?P=F6tzl?= <herbert@13thfloor.at>
Subject: Re: [linux-lvm] disk info
Message-ID: <20030806193146.GA16054@www.13thfloor.at>
References: <200308061457.22773.vk@mail.lepp.cornell.edu> <20030806191026.GA11612@www.13thfloor.at> <200308061520.06784.vk@mail.lepp.cornell.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200308061520.06784.vk@mail.lepp.cornell.edu>
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
Date: Wed Aug  6 14:32:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valentine Kouznetsov <vk@mail.lepp.cornell.edu>
Cc: linux-lvm@sistina.com

On Wed, Aug 06, 2003 at 03:20:06PM -0400, Valentine Kouznetsov wrote:
> Herbert,
> thanks for tip. I've look at resize2fs, but at least for ext2/ext3 I
> need to unmount my partition first. How about situation if root partion
> is on LVM and I want to resize it as well.

there are some effords to resize a fs while mounted,
but usually the procedure is the same, and you either
boot from a rescue cd/floppy or a special rescue 
partition ...

HTH,
Herbert
 

> Thanks,
> V.
> 
> On Wed August 6 2003 15:10, you wrote:
> > On Wed, Aug 06, 2003 at 02:57:22PM -0400, Valentine Kouznetsov wrote:
> > > Hi,
> > > I'm newbie of using LVM. I'm having the following "strange" behaviour:
> > > I can lvextend my volumes, but I cannot see the changes using df
> > > command. Actually df output is different from LV size of lvdisplay
> > > output. Is it known bug and/or I'm missing something.
> >
> > you have to resize the filesystem on the lvm lv
> > after you extended it ...
> >
> > for ext2/ext3 this would be resize2fs ...
> >
> > HTH,
> > Herbert
> >
> > > My configuration:
> > > RedHat 9, kernel 2.4.21 or 2.4.20-19-9 (from RedHat), lvm-1.0.3-12 (from
> > > RedHat 9)
> > >
> > > I would appreciate if you cc me to vk@mail.lepp.cornell.edu
> > >
> > > Thanks,
> > > Valentine.
> > >
> > >
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
