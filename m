Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2CFRf808355
	for <linux-lvm@redhat.com>; Fri, 12 Mar 2004 10:27:41 -0500
Received: from office.labsysgrp.com (wsip-68-14-253-125.ph.ph.cox.net [68.14.253.125])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2CFRe07016747
	for <linux-lvm@redhat.com>; Fri, 12 Mar 2004 10:27:40 -0500
Received: from [127.0.0.1] (helo=localhost)
	by office.labsysgrp.com with esmtp (Exim 4.24)
	id 1B1oZS-0001Yn-PW
	for linux-lvm@redhat.com; Fri, 12 Mar 2004 08:27:34 -0700
Received: from office.labsysgrp.com ([127.0.0.1])
 by localhost (office.lsg.internal [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 05881-01 for <linux-lvm@redhat.com>;
 Fri, 12 Mar 2004 08:27:33 -0700 (MST)
Received: from jeeves.kpf.internal ([192.168.170.1])
	by office.labsysgrp.com with esmtp (Exim 4.24)
	id 1B1oZR-0001Yh-SD
	for linux-lvm@redhat.com; Fri, 12 Mar 2004 08:27:33 -0700
Received: from [192.168.172.107] (helo=backtobasicsmgmt.com)
	by jeeves.kpf.internal with esmtp (Exim 4.05)
	id 1B1oZQ-0001hE-00
	for linux-lvm@redhat.com; Fri, 12 Mar 2004 08:27:32 -0700
Message-ID: <4051D6EF.9070507@backtobasicsmgmt.com>
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [RFC][PATCH] proper DESTDIR handling for device-mapper
 and LVM2
References: <4051388C.3050700@backtobasicsmgmt.com> <20040312013822.C4622@homer.msp.redhat.com>
In-Reply-To: <20040312013822.C4622@homer.msp.redhat.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Mar 12 10:25:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Alasdair G Kergon wrote:

> Thanks for the tidying: I'll work through this properly late next week.  
> (Office moves today.)  Quick comments: I'd prefer not to see DESTDIR in 
> Makefiles though: only in the template, and some (I thought most?) people 
> *do* want to pick up some include files etc. from their DESTDIR (they're not
> installed on their main system, or the ones on their system are different
> versions from the ones in DESTDIR which has the correct environment the
> software uses when it runs): perhaps that should be split into a separate
> configuration option (enabled by default)?

To keep DESTDIR only in the template, you'll have to replace the

bindir = @bindir@

lines (and similar) in make.tmpl with

bindir = $(DESTDIR)@bindir@

to avoid the problem of @bindir@ not including ${prefix}. Just don't 
bother putting $(DESTDIR) into prefix/exec_prefix at all, IMHO.

I can't speak to what everyone else does with DESTDIR, but most 
packaging systems point DESTDIR to an _empty_ subtree to do the install 
into, so they can package up all the resulting files. If someone wanted 
to build LVM2 on a system that had device-mapper _only_ installed into 
DESTDIR (i.e. /usr/lib did not contain libdevmapper.so, /usr/include did 
not contain libdevmapper.h, etc.) this would take a lot more work than 
what was already in the Makefiles, and even then it would tend to break 
because /usr/sbin/lvm would end up linked to

/foo/usr/lib/libdevmapper.so

instead of

/usr/lib/libdevmapper.so

and so /usr/sbin/lvm wouldn't run properly once the DESTDIR directory 
was used as a real environment.

So just to be completely redundant <G>, I'll reiterate the way I've 
always seen DESTDIR used: it's used _only_ at "make install" time to 
redirect the installation to a different path than the package was 
compiled to run from.
