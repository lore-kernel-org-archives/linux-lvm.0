Return-Path: <thornber@btconnect.com>
Date: Thu, 5 Jul 2001 10:39:09 +0100
Subject: Re: [linux-lvm] LVM on Redhat 2.4.3-12 Kernel
Message-ID: <20010705103908.A400@btconnect.com>
References: <20010704083759.A294@btconnect.com> <Pine.LNX.4.33.0107041635050.27160-100000@chasqui.LaRed.net.pe>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0107041635050.27160-100000@chasqui.LaRed.net.pe>; from carenas@chasqui.lared.net.pe on Wed, Jul 04, 2001 at 04:50:53PM -0500
From: Joe Thornber <thornber@btconnect.com>
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

On Wed, Jul 04, 2001 at 04:50:53PM -0500, Carlo Marcelo Arenas Belon wrote:
> <SNIP>
> (BTW anyone knows what happened to the 1.0 release that was supposed to be
> yesterday?)

The release is delayed :( I think we're going to need another beta
release before the great 1.0.  We want to be careful that we can still
support existing systems with the bad alignments, as well as newly
created LV's that have correct alignment.  This is going to involve an
upgrade tool that will be run on existing VG's before the new software
(beta8) can be used.

- Joe
