Subject: Re: [linux-lvm] A tool to administrate LVM.
In-Reply-To: <3DA6862E.3CEF0241@silicide.dk>
References: <3DA679AD.B77ACC01@silicide.dk>
	<20021011164755X.jyoshida@miraclelinux.com>
	<3DA6862E.3CEF0241@silicide.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20021011174828O.jyoshida@miraclelinux.com>
From: Jun YOSHIDA <jyoshida@miraclelinux.com>
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
Date: Fri Oct 11 03:49:09 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

on [Fri, 11 Oct 2002 10:05:02 +0200], 
Jon Bendtsen <jon+lvm@silicide.dk> wrote on "Re: [linux-lvm] A tool to administrate LVM."
> Jun YOSHIDA wrote:
> > 
> > on [Fri, 11 Oct 2002 09:11:41 +0200],
> > Jon Bendtsen <jon+lvm@silicide.dk> wrote on "Re: [linux-lvm] A tool to administrate LVM."
> > > Jun YOSHIDA wrote:
> > > >
> > > > Hello all,
> > > >
> > > > I am a developer working for MIRACLE LINUX which is one of the linux
> > > > distributors in Japan.
> > > >
> > > > I made a tool to administrate LVM easily and named it LVMAdmin temporarily.
> > > > It will help beginners to create PV/VG/LV easily.
> > > >
> > > > Small screenshot is put at:
> > > >         http://www.miraclelinux.com/developer/lvmadmin.html
> > >
> > > It must be very small, because i cant see it :/
> > 
> > I put English manual temporarily.
> > 
> >         http://www.miraclelinux.com/developer/lvmadmin-doc-e.html
> > 
> > Please try to read it.
> 
> It's much better, and it does appear as a usefull tool.
> How ever, all my LVM's are ontop of a software raid1, 
> what color are they ?

Oops! I have not considered about that. LVMAdmin will be unable to
probe software raid.

I have a lots of things I have to implement. LVMAdmin won't work well
with software raid and raw device and it might exit with some errors
in such cases.

I will enhance LVMAdmin as much as I can.

Thank you,
-Jun
