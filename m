Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104170553.f3H5rdYI001302@webber.adilger.int>
Subject: Re: [linux-lvm] CDRECORD not working when LVM loaded.
In-Reply-To: <200104170441.f3H4fuW29720@west.navpoint.com> "from Rupert Heesom
 at Apr 16, 2001 11:34:20 pm"
Date: Mon, 16 Apr 2001 23:53:39 -0600 (MDT)
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

Rupert writes:
> I had some trouble using cdrecord, and saw the man page for cdrecord,
> particularly the following part where it says that cdrecord cannot be
> used in conjunction with volume management.

When cdrecord is talking about "volume management" they mean automatic
CD-ROM volume detection.  Solaris has a daemon called "vold" which sees
that a new CD-ROM is inserted and mounts it automatically.  This breaks
cdrecord, because the CD-ROM is then busy before it has a chance to open
it.

> I unloaded the "lvm-mod" kernel module, and cdrecord works fine without
> it.

Sorry, probably unrelated to LVM.

> Basically I'm merely trying to find out whether I can get my system
> working with both LVM and cdrecord concurrently.

I have LVM and Grip running on my laptop at the same time without problems.
Grip is a GTK CD ripper, which uses cdparanoia for the back end.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
