Return-Path: <au@hcsd.de>
Date: Fri, 25 May 2001 17:09:08 +0200
From: Stephan Austermuehle <au@hcsd.de>
Subject: Re: [linux-lvm] EMC Storage + LVM + XFS
Message-ID: <20010525170908.G29884@babbage.hcsd.de>
References: <20010525085816.F18197@babbage.hcsd.de> <Pine.LNX.4.33.0105250946400.10104-100000@UberGeek.coremetrics.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0105250946400.10104-100000@UberGeek.coremetrics.com>; from austin@coremetrics.com on Fri, May 25, 2001 at 09:47:34AM -0500
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

On Fri, May 25, 2001 at 09:47:34AM -0500, Austin Gonyou wrote:

> I don't think I'm clear on your statement. As far as I know, which is a
> lot about EMC, you can definitely plug disks online. Having Linux see
> them? Not necessarily so, but I believe the polling interval for the Fibre
> driver will take care of that.

Oh, of course the Symmetrix allows hot plugging of disks and online
mapping of hypers to one or more channels via a Bin upgrade or the
SDR. But at the moment I do not know any way to make Linux recognise
the additional disks without reloading (rebooting) the driver. But
even if there's a way to online detect new disks -- if a vgscan is
necessary to tell the Linux LVM about where its VGs have gone it isn't
a very smart solution because it often requires application down time.

Stephan
