Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Wed, 24 Jan 2001 23:27:33 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] Newbie questions
Message-ID: <20010124232733.A2053@srv.sistina.com>
References: <OGEIIBECLDEKAJGFBOGCKEDBCAAA.mvasa@confluencenetworks.com>
Mime-Version: 1.0
In-Reply-To: <OGEIIBECLDEKAJGFBOGCKEDBCAAA.mvasa@confluencenetworks.com>; from mvasa@confluencenetworks.com on Wed, Jan 24, 2001 at 02:21:20PM -0800
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

On Wed, Jan 24, 2001 at 02:21:20PM -0800, Mayank Vasa wrote:
> Hi,
> 
> I am new to LVM and have some basic questions:
> 
> 1) From the documentation I have read, I think once you extend/reduce a LV
> or VG you don't need to reboot the system. Correct?

Correct.

> 
> 2) Assuming 1 is correct, how is the filesystem made aware of the changes?
> I'd like to understand the flow of this too.

Its size needs to be changed in a seperate step.
With ext2 there's Ted Tso's offline resizer and for eg. Andreas Dilger's
online resizer.
With reiserfs there's an online extender and offline shrinker available.

> 
> 3) What are LVM snapshots?

Another LV exposing a "frozen" image of a preexisting LV.

IOW: you create another LV (the snapshot LV) which is "connected" to an
     already exiting one (called original LV in this context).
     The snapshot LV doesn't change its content while the original LV can
     still be updated (changed).

> 
> TIA.
> -mayank.
> 
> 
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
