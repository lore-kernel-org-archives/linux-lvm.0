Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i2GLRaj04235
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2004 16:27:36 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i2GLRao05244
	for linux-lvm@redhat.com; Tue, 16 Mar 2004 15:27:36 -0600
Date: Tue, 16 Mar 2004 15:27:36 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [RFC][PATCH] proper DESTDIR handling for
	device-mapper and LVM2
Message-ID: <20040316152736.A31599@homer.msp.redhat.com>
References: <4051388C.3050700@backtobasicsmgmt.com>
	<20040312013822.C4622@homer.msp.redhat.com>
	<4051D6EF.9070507@backtobasicsmgmt.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4051D6EF.9070507@backtobasicsmgmt.com>;
	from kpfleming@backtobasicsmgmt.com on Fri, Mar 12, 2004 at
	08:27:43AM -0700
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Mar 12, 2004 at 08:27:43AM -0700, Kevin P. Fleming wrote:
> To keep DESTDIR only in the template, you'll have to replace the
> bindir = @bindir@
> lines (and similar) in make.tmpl with
> bindir = $(DESTDIR)@bindir@
 
Yes.

> what was already in the Makefiles, and even then it would tend to break 
> because /usr/sbin/lvm would end up linked to
> /foo/usr/lib/libdevmapper.so
> instead of
> /usr/lib/libdevmapper.so
> and so /usr/sbin/lvm wouldn't run properly once the DESTDIR directory 
> was used as a real environment.

If this was Solaris, yes, we'd need -R to set the default run-time library
path.  But AFAIK linux only searches LD_LIBRARY_PATH, ld.so.cache
and /usr/lib:/lib.

I still think it's wrong to use the version of any include file found on 
the host system if there is a different version of it present in DESTDIR.
[That copes fine for people installing into an empty directory, 
and AFAICT also caters for people building multiple packages with
dependencies.]

Alasdair
-- 
agk@redhat.com
