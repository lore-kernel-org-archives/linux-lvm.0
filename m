Return-Path: <m.vd.brink@worldonline.nl>
From: Melis van den Brink <m.vd.brink@worldonline.nl>
Subject: Re: [linux-lvm] Missing (or double) logical volume after upgrade to 2.4.7 and beta8
Date: Tue, 7 Aug 2001 19:19:21 +0200
References: <01080621060101.00882@giant.koningspage.nl> <20010807082452.A677@tykepenguin.com>
In-Reply-To: <20010807082452.A677@tykepenguin.com>
MIME-Version: 1.0
Message-Id: <01080719192100.04758@giant.koningspage.nl>
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@sistina.com

On Tuesday 07 August 2001 09:24, you wrote:
> On Mon, Aug 06, 2001 at 09:06:01PM +0200, Melis van den Brink wrote:
> > Hello,
> >
> > I'm experiencing a bit of trouble with LVM (just as I was becoming very
> > happy with it :-().
> > I had it running on a 2.4.6 kernel patched with the beta7 lvm-stuff and
> > some patches from the reiserfs-guys. That was running quite fine.
> > Today I performed the upgrade to linux 2.4.7 and lvm beta8. I followed
> > the advice from the README.1st in upgrading to the new meta-format. I
> > installed the beta8 tools and booted with the new kernel (including the
> > patches from beta8). It seemed to be working until I discovered that one
> > of my LV's was missing. Or better it showed the same filesystem as the
> > one mounted on /var.
> >
> > I could try to fix it, but would like to know some options as I am fairly
> > new to LVM.
> > Attached is some information about the LVM-setup. I can give you some
> > more, but I don't know what to provide you with...
>
> At a guess it sounds like one (or more) of the PVs hasn't had it's metadat
> version number updated - there are several inactive PVs shown by PVSCAN.
> Check that all your PVs are shown there (if not then get the beta6 tools
> and run pvversion on them) and then run vgscan.
Do you mean the beta8 tools (meaning '6' is just a typo) or is there a reason 
for pointing to the beta6 tools ?

>
> The "duplicate" volume is probably just an old volume not being activated
> and it's major/minor number being reused by another volume that has been
> activated. "ls -l" on the names will show this. If you're worried about it
> then just delete the incorrect device nodes. Once all the VGs are activated
> they should sort themselves out.
>

Melis
