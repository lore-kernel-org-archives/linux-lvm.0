Return-Path: <mauelshagen@sistina.com>
Date: Mon, 26 Mar 2001 17:34:36 -0600
From: Heinz Mauelshagen <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] where is pv_t?
Message-ID: <20010326173436.A18978@sistina.com>
References: <3ABB8810.E4216B29@in.tum.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ABB8810.E4216B29@in.tum.de>; from vidalrod@informatik.tu-muenchen.de on Fri, Mar 23, 2001 at 06:29:52PM +0100
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

On Fri, Mar 23, 2001 at 06:29:52PM +0100, David Vidal Rodriguez wrote:
> I'm trying to write a program that can put the UUIDs of a PV manually.
> I'm having a look at the functions and at the structures I need, but I
> can't find how pv_t looks like. Can sb tell me in which file is it
> contained?

Look for pv_disk_t in lvm.h

> 
> 
> 
> --
>   ------------------------------------------------------------------------
>  David Vidal R. (vidalrod@in.tum.de)
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
