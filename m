Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 7 Aug 2001 18:47:18 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Missing (or double) logical volume after upgrade to 2.4.7 and beta8
Message-ID: <20010807184718.A11198@tykepenguin.com>
References: <01080621060101.00882@giant.koningspage.nl> <20010807082452.A677@tykepenguin.com> <01080719192100.04758@giant.koningspage.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01080719192100.04758@giant.koningspage.nl>; from m.vd.brink@worldonline.nl on Tue, Aug 07, 2001 at 07:19:21PM +0200
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

On Tue, Aug 07, 2001 at 07:19:21PM +0200, Melis van den Brink wrote:
> >
> > At a guess it sounds like one (or more) of the PVs hasn't had it's metadat
> > version number updated - there are several inactive PVs shown by PVSCAN.
> > Check that all your PVs are shown there (if not then get the beta6 tools
> > and run pvversion on them) and then run vgscan.

> Do you mean the beta8 tools (meaning '6' is just a typo) or is there a reason 
> for pointing to the beta6 tools ?

No, you'll need the tools that match those that created them. So the beta8 tools
won't see the old PVs but beta6 should. 6 is good number! 



patrick
