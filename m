Return-Path: <root@srv.sistina.com>
Date: Fri, 11 May 2001 15:53:11 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Message-ID: <20010511155311.A17689@sistina.com>
Mime-Version: 1.0
Subject: [linux-lvm] LVM 1.0 release decision
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
To: linux-lvm@sistina.com, linux-kernel@sistina.com
Cc: mge@sistina.com

As most of you probably know, we've got criticism a couple of weeks ago about
our Linux kernel patch policy causing the LVM vanilla kernel code to differ
from the one we release directly.

In order to avoid this difference we provide smaller patches more often now.
We have started already with a subset of about 50 necessary patches.

Even though we get kind support from Alan Cox to get those QAed and integrated,
the pure amount of patches will take at least a couple of weeks to make it in.

This leads to the dilemma, that trying to avoid further differences between
our LVM releases and the stock kernel code would force us into postponing
the pending LVM 1.0 release accordingly which OTOH is incovenient for the LVM
user base.

In regard to this situation we'ld like to know about your oppinion on
the following request:
is it acceptable to release 1.0 soon *before* all patches to reach the 1.0 code
status are in vanilla (presumed that we provide them with our release as we
always did before)?

We'll gather your answers for some days and will send the conclusion
to the lists.

Thanks for your support!

-- 

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
