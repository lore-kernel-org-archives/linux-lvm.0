Return-Path: <root@srv.sistina.com>
Date: Tue, 6 Feb 2001 10:22:45 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] modprobe errors in syslog
Message-ID: <20010206102245.C8914@srv.sistina.com>
References: <3A7B1410.6B37C0A5@tampabay.rr.com>
Mime-Version: 1.0
In-Reply-To: <3A7B1410.6B37C0A5@tampabay.rr.com>; from ozric@tampabay.rr.com on Fri, Feb 02, 2001 at 03:09:52PM -0500
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

Hi Richard,

this is well known because vgscan(8) checks for a couple of possibly
existing devices.
If they don't exist (i.e. the drivers are not loaded or build into the kernel)
that run triggers (lots of) messages. If you face more of them your actual
kernel configuration might include less drivers than your previous one.

There's 2 ways to address this:

 a. change your modules.conf and set the unused drivers to "off".
 b. ignore the messages ;-)


On Fri, Feb 02, 2001 at 03:09:52PM -0500, Richard Smith wrote:
> I have 2.4.1 patched with .9beta3.  Everything I have tried so far is
> working,
> but I get lots of modprobe errors in my log after I run vgscan. please
> advise,
> is this from md.o or devfs ?  I am not using md.o for raid. 
> 
> thanks
> Richard
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
