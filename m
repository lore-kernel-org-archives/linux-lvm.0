Return-Path: <root@srv.sistina.com>
Date: Tue, 24 Apr 2001 14:00:26 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Does LVM support alternate links?
Message-ID: <20010424140026.C31988@sistina.com>
References: <Pine.LNX.4.31.0104201858090.1159-100000@dgently.hh.suse.de>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.31.0104201858090.1159-100000@dgently.hh.suse.de>; from bruck@suse.de on Fri, Apr 20, 2001 at 07:00:10PM +0200
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

On Fri, Apr 20, 2001 at 07:00:10PM +0200, Jens Bruckmann wrote:
> Hallo everybody,
> 
> I would like to know if the LVM supports alternate-links to the same
> physical device over two fiber-channel links, so if one link fails, LVM
> automatically uses the second link as it does under its "original" HP-UX.

No, as someone else already answered.

There's work queued though to enhance LVM to support multi-pathing.

A brief description of our ideas includes that a path to a device has
properties related to it like for eg. bandwidth or reliability of that
particular path.
These properties will be fed into the automatic decision taking process
in the LVM driver to which path (if there's multiple available) a switch-over
is going to take place.
There'l be CLI and config file support to configure pathes/properties,
keep that state and allow the user to witch over to different pathes manually.

Time line for this is summer.

> 
> Has anyone ever connected an EMC-Symmetrix with redundant fiber-channel
> links with LVM and Linux?
> 
> Then I was very pleased if he/she could tell me about the experiences.
> 
> Thanks a lot,
> 
>         Jens
> 
> -----------------------------------------------------------------------
> Jens Bruckmann              .-.       Mail:    jens.bruckmann@suse.de
> SuSE Linux Solutions AG     /v\       Phone:   +49 - 40 - 89 69 82 18
> Friesenweg 5F              // \\      Fax:     +49 - 40 - 85 40 04 35
> D-22763 Hamburg           /(   )\
>                            ^^-^^
> -----------------------------------------------------------------------
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
