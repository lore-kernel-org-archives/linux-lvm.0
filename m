Return-Path: <jorg.de.jong@ida.xs4all.nl>
Message-ID: <3AFC2460.5CD04E9A@ida.xs4all.nl>
Date: Fri, 11 May 2001 19:41:52 +0200
From: Jorg de Jong <jorg.de.jong@ida.xs4all.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM 1.0 release decision
References: <20010511155311.A17689@sistina.com>
Content-Transfer-Encoding: 7bit
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

"Heinz J. Mauelshagen" wrote:

> This leads to the dilemma, that trying to avoid further differences between
> our LVM releases and the stock kernel code would force us into postponing
> the pending LVM 1.0 release accordingly which OTOH is incovenient for the LVM
> user base.

In my opinnion the current user base can wait a some more time before what
we now have is labeled 1.0 ( minus the delta between 0.9.1.betaxx).
New users are likely to be scarred off if the find out that they still
have to patch the kernel. 
So my suggestion would be to get the needed patches of to Linus ( and
never again let them acummulate that mutch).
For the user tools I would suggest that you release for each stable kernel
a matching distibution, ie:
kernel 2.4.5 ( 20 lvm patches included), usertools 0.9.2
kernel 2.4.6 ( 45 lvm patches included), usertools 0.9.3
kernel 2.4.7 ( all lvm patches included) usertools 1.0 (plus champain) 

> 
> In regard to this situation we'ld like to know about your oppinion on
> the following request:
> is it acceptable to release 1.0 soon *before* all patches to reach the 1.0 code
> status are in vanilla (presumed that we provide them with our release as we
> always did before)?
> 
> We'll gather your answers for some days and will send the conclusion
> to the lists.
> 
> Thanks for your support!
> 
> --
> 
> Regards,
> Heinz    -- The LVM Guy --
>
