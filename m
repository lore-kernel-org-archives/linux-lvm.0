Date: Tue, 22 Feb 2000 00:23:42 +0100
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] Can we make char files not blocked for the volumes
Message-ID: <20000222002342.A7687@gruyere.muc.suse.de>
References: <200002191235.NAA27590@u9etz.164.27.16.48> <38AE95CD.915AC596@alwan.com> <14513.48287.977291.125248@dukat.scot.redhat.com> <38B1BFF2.769DED19@alwan.com>
Mime-Version: 1.0
In-Reply-To: <38B1BFF2.769DED19@alwan.com>; from chris@alwan.com on Mon, Feb 21, 2000 at 04:45:06PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Anderson <chris@alwan.com>
Cc: "Stephen C. Tweedie" <sct@redhat.com>, "linux-lvm@msede.com" <linux-lvm@msede.com>

On Mon, Feb 21, 2000 at 04:45:06PM -0600, Chris Anderson wrote:
> "Stephen C. Tweedie" wrote:
> 
> > Hi,
> >
> > On Sat, 19 Feb 2000 07:08:29 -0600, Chris Anderson <chris@alwan.com> said:
> >
> > > Heinz Mauelshagen wrote:
> > >> Please have a look at the rawio support for Linux.
> >
> > > Where can I find this?  In the kernel?  Any help would be great.
> >
> > 2.3 has it, and there are 2.2 patches on
> >
> > ftp://ftp.uk.linux.org/pub/linux/sct/fs/raw-io
> 
> Thanks.  I used the link and download the files.
> 
>  It is odd how it is used.  I had to hack it into 2.2.14, but go it working.
> I think the "raw" command is odd, also it needs to be run every time you
> reboot.  Also who is the owner of this code. How does it find its way into
> the standard 2.3 and lvm has not yet?  That is odd too.

LVM is in 2.3.47.

> My test with Informix IDS 7.3 for linux showed that the raw io is twice as
> slow.  A 17 mins load under block device using lvm but took 31mins for the
> raw linked version.  I will be testing the Informix 9.2 version tonight.  I
> could not find much doc from informix other then the device need to be
> char/raw.

rawio does not do any caching (as the name says), so you probably 
need to configure the database to cache more on itself.  


-Andi
