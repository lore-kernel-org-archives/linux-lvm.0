Return-Path: <bluca@comedia.it>
Date: Wed, 15 Aug 2001 23:30:04 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Adding a mirror after-the-fact
Message-ID: <20010815233003.A2260@colombina.comedia.it>
References: <20010814171159.B28266@linux.com> <20010815105623.A29693@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010815105623.A29693@sistina.com>; from mauelshagen@sistina.com on Wed, Aug 15, 2001 at 10:56:23AM +0200
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

On Wed, Aug 15, 2001 at 10:56:23AM +0200, Heinz J . Mauelshagen wrote:
> On Tue, Aug 14, 2001 at 05:11:59PM -0400, Jason Tackaberry wrote:
> > I know this isn't strictly an LVM question, but ...
> > 
> > Suppose I have a volume group with 1 physical volume, say a 9GB disk.
> > Now, after some time, I decide I want to mirror this VG with another 9GB
> > disk.  What options do I have?  AFAICS, the only way to do this would be
> > to start from scratch?  This is a pretty simple and presumably common
> > thing to want to do, so I hope I'm wrong.  :)
> 
> Yes, you are (with 2.4 kernels) ;-)
> 
> You could either mirror the whole disk using MD *without* persistent superblocks
> 
raid superblock is at end of disk, so you could also
create an lv with only the last PE of the PV and NEVER USE it

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
