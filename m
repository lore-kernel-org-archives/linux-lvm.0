Return-Path: <hch@ns.caldera.de>
Date: Fri, 11 May 2001 17:02:26 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] LVM 1.0 release decision
Message-ID: <20010511170226.A20533@caldera.de>
References: <20010511155311.A17689@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010511155311.A17689@sistina.com>; from Mauelshagen@sistina.com on Fri, May 11, 2001 at 03:53:11PM +0000
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
Cc: linux-kernel@sistina.com, mge@sistina.com

On Fri, May 11, 2001 at 03:53:11PM +0000, Heinz J. Mauelshagen wrote:
> In regard to this situation we'ld like to know about your oppinion on
> the following request:
> is it acceptable to release 1.0 soon *before* all patches to reach the 1.0 code
> status are in vanilla (presumed that we provide them with our release as we
> always did before)?

IMHO you should get out a 0.9.1final and sync the stock kernel before...
If and only IF 1.0 will change the IOP again I don't want to see it all
in stock 2.4.0 - the stable series should stay backward compatible.
Otherwise:  just relese 1.0 and send the diffs to Alan and Linus - if
they think you changes are ok they will merge it.

Vendors interested in having 1.0 in their kernels will put it in anyway.

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.
