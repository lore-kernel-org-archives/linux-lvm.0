Return-Path: <tandem@dnmi.no>
Subject: Re: [linux-lvm] LVM 1.0 release decision
References: <20010511155311.A17689@sistina.com>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 11 May 2001 16:06:17 +0200
In-Reply-To: "Heinz J. Mauelshagen"'s message of "Fri, 11 May 2001 15:53:11 +0000"
Message-ID: <wvheysdlpi.fsf@freeze.oslo.dnmi.no>
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

>>>>> "Heinz" == Heinz J Mauelshagen <Mauelshagen@sistina.com> writes:

    Heinz> As most of you probably know, we've got criticism a couple
    Heinz> of weeks ago about our Linux kernel patch policy causing
    Heinz> the LVM vanilla kernel code to differ from the one we
    Heinz> release directly.

    Heinz> In order to avoid this difference we provide smaller
    Heinz> patches more often now.  We have started already with a
    Heinz> subset of about 50 necessary patches.

    Heinz> Even though we get kind support from Alan Cox to get those
    Heinz> QAed and integrated, the pure amount of patches will take
    Heinz> at least a couple of weeks to make it in.

Uh, presumably you're talking 2.4 here. Seeing as each new 2.2 release
has a good number of weeks in between it would be not worth delaying
a LVM release because of that, and the same would seem to go for 2.4
as well as it becomes more stable.

    Heinz> This leads to the dilemma, that trying to avoid further
    Heinz> differences between our LVM releases and the stock kernel
    Heinz> code would force us into postponing the pending LVM 1.0
    Heinz> release accordingly which OTOH is incovenient for the LVM
    Heinz> user base.

Just release 1.0 with patches to a certain base 2.4.4 and 2.2.19 and
when 2.4.5 comes out with all the LVM patches init you just mention
that 2.4.5 has all the relevant patches.

    Heinz> In regard to this situation we'ld like to know about your
    Heinz> oppinion on the following request: is it acceptable to
    Heinz> release 1.0 soon *before* all patches to reach the 1.0 code
    Heinz> status are in vanilla (presumed that we provide them with
    Heinz> our release as we always did before)?

This is assuming I've actually completely understood what you're
talking about :-)

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
