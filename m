Return-Path: <mauelshagen@sistina.com>
Date: Wed, 15 Aug 2001 10:57:22 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Renumbered drives hosed VG.
Message-ID: <20010815105722.B29693@sistina.com>
References: <B51F0C636E578A4E832D3958690CD73E0130BFC0@es04snlnt>
Mime-Version: 1.0
In-Reply-To: <B51F0C636E578A4E832D3958690CD73E0130BFC0@es04snlnt>; from jdiehl@sandia.gov on Tue, Aug 14, 2001 at 02:52:17PM -0600
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

On Tue, Aug 14, 2001 at 02:52:17PM -0600, Diehl, Jeffrey wrote:
> Hi all,
> 
> I recently upgraded from a modular kernel to a monolithic kernel, which
> renumbered all of my drives.  sda became sdb, sdb became sdc and adc became
> sda, etc.  Now one of my VG's is hosed.  How do I recover from this?

A vgscan run should excatly address this.
Did it take place after the changes and *before* "vgchange -ay"?

> 
> Thanx,
> Mike Diehl,
> Network Monitoring Tool Devl.
> 284-3137
> jdiehl@sandia.gov
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
