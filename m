Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 7 Aug 2001 08:24:52 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Missing (or double) logical volume after upgrade to 2.4.7 and beta8
Message-ID: <20010807082452.A677@tykepenguin.com>
References: <01080621060101.00882@giant.koningspage.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01080621060101.00882@giant.koningspage.nl>; from m.vd.brink@worldonline.nl on Mon, Aug 06, 2001 at 09:06:01PM +0200
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

On Mon, Aug 06, 2001 at 09:06:01PM +0200, Melis van den Brink wrote:
> Hello,
> 
> I'm experiencing a bit of trouble with LVM (just as I was becoming very happy 
> with it :-().
> I had it running on a 2.4.6 kernel patched with the beta7 lvm-stuff and some 
> patches from the reiserfs-guys. That was running quite fine.
> Today I performed the upgrade to linux 2.4.7 and lvm beta8. I followed the 
> advice from the README.1st in upgrading to the new meta-format. I installed 
> the beta8 tools and booted with the new kernel (including the patches from 
> beta8). It seemed to be working until I discovered that one of my LV's was 
> missing. Or better it showed the same filesystem as the one mounted on /var.
> 
> I could try to fix it, but would like to know some options as I am fairly new 
> to LVM.
> Attached is some information about the LVM-setup. I can give you some more, 
> but I don't know what to provide you with...

At a guess it sounds like one (or more) of the PVs hasn't had it's metadat
version number updated - there are several inactive PVs shown by PVSCAN. Check
that all your PVs are shown there (if not then get the beta6 tools and run
pvversion on them) and then run vgscan.

The "duplicate" volume is probably just an old volume not being activated and
it's major/minor number being reused by another volume that has been activated.
"ls -l" on the names will show this. If you're worried about it then just delete
the incorrect device nodes. Once all the VGs are activated they should sort
themselves out.

patrick
