Return-Path: <plamb_98@yahoo.com>
Message-ID: <20010807144334.39555.qmail@web13406.mail.yahoo.com>
Date: Tue, 7 Aug 2001 07:43:34 -0700 (PDT)
From: Pierre Lamb <plamb_98@yahoo.com>
Subject: Re: [linux-lvm] Looking for recipe for LVM
In-Reply-To: <20010807153341.F677@tykepenguin.com>
MIME-Version: 1.0
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

Unfortunately 2.4.3 kernels need to be patched to use
the latest LVM iop  the kernels were build with beta2
the latest is beta8. Certian tools may not work
completeky if not patched.

Pierre
--- Patrick Caulfield <caulfield@sistina.com> wrote:
> On Mon, Aug 06, 2001 at 08:54:11AM -0400,
> John.Forrer@comsat.com wrote:
> >  I have found lots of mail from people jumping
> hurdles to get various aspects of
> > lvm working, but have yet to find a recipe that I
> can understand for getting lvm
> > installed/loaded/...  into Redhat 7.1.  from
> scratch.  I have a Dell computer
> > with 4 scsi drives of 36G each that need to be
> mounted as a single drive.  Any
> > suggestions about where I can find/buy such a
> recipe and/or a canned solution?  
> 
> Well, no-one else seems to be able to help so I'll
> try. I don't have RedHat 7
> but I've heard bad stories about people trying to
> patch RedHat kernels.
> 
> I recommend you download the latest 2.2 or 2.4 (your
> preference) kernel from
> an ftp.kernel.org mirror and use that. The
> instructions in the LVM HOWTO should
> be enough to guide you through it.
> 
> The most difficult part is to figure out which
> kernel options you need to set
> - apart from LVM of course - to support your
> hardware. If in doubt build
> everything as a module and it'll probably all work
> out fine.
>  
> patrick
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://www.sistina.com/lvm/Pages/howto.html


__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
