Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0THdRvX007048
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 12:39:27 -0500
Received: from mail.linbit.com (nudl.linbit.com [212.69.162.21])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0THcsKv011762
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 12:38:55 -0500
Received: from soda.linbit (office.linbit [86.59.100.100])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id ABDEC2DEAC70
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 18:38:48 +0100 (CET)
Date: Tue, 29 Jan 2008 18:38:48 +0100
From: Lars Ellenberg <linux-lvm@linbit.com>
Subject: Re: [linux-lvm] LVM limits?
Message-ID: <20080129173848.GE5710@barkeeper1.linbit>
References: <479DAD35.1080209@cesca.es> <479E2BEF.1090703@cesca.es>
	<1201541894.30560.24.camel@behemoth.csg.stercomm.com>
	<479E698C.10204@cesca.es>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <479E698C.10204@cesca.es>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jan 29, 2008 at 12:47:24AM +0100, Jordi Prats wrote:
> Hi,
> I'm the system administrator of PADICAT (http://www.padi.cat). It
> collects Catalan (http://en.wikipedia.org/wiki/Catalonia) web sites to
> provide permanent access to them (http://www.padi.cat/en/quees.php).
> It's equivalent to Internet Archive (http://www.archive.org) but for a
> particular culture.
> 
> Our software developers require us to have one large file system,
> actually a single directory, with all this historically-classified web
> sites on a gziped file.

if I may...
if you are _archiving_ then the archive will be read-only.
so you need a "working area" where you download and prepare the current
stuff, "pack" it into the form of object repository you need.
but then you archive it away into some much larger,
but basically read-only, store.

if that is correct so far,
what about having a some TB volume for the "working area",
and then (for example) cramfs it away into versioned archive images.
cramfs (or other strictly read-only) images have the additional
advantage that they very easily scale out: you just clone it one other
time, done. because of the read-only nature of the archive there is no
need for any coordination, and one clone is as good as the other one.
scales in any direction without effort.

> I'm currently studying lustre and other HPC-related file systems to get
> this large file system, but by now I have ext3 as our file system. Next
> Monday I'm planning to extend it to 3TB o 4TB, so I'm currently
> researching for restrictions because during next month I'll have between
> 3TB to 4TB more to add: so, it will become a 8TB file system.

If you have enterprise class hardware (enough RAM, good battery-backed
controller etc), I personaly do very much prefer XFS.
you should upgrade the "xfsprogs", though,
most distributions ship outdated xfs tools.

<shameless plug>
btw., if you want to explore lustre further, we have some cooperation
with the lustre people to run lustre on DRBD. if interessted in details,
contact address is below...
</shameless plug>

-- 
: Lars Ellenberg                           http://www.linbit.com :
: DRBD/HA support and consulting             sales at linbit.com :
: LINBIT Information Technologies GmbH      Tel +43-1-8178292-0  :
: Vivenotgasse 48, A-1120 Vienna/Europe     Fax +43-1-8178292-82 :
__
please use the "List-Reply" function of your email client.
