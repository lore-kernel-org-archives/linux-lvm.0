Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102022056.f12KuxW23594@webber.adilger.net>
Subject: Re: [linux-lvm] newbie question
In-Reply-To: <Pine.LNX.4.21.0102012054480.1092-100000@munster.noc.fr.clara.net>
 from JAmes at "Feb 2, 2001 04:08:49 pm"
Date: Fri, 2 Feb 2001 13:56:59 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

James writes:
> If I did a standard installation using say 5 partitions / /usr /var/ /home
> swap, it would be a pain transferring this to an lvm system. So how do you
> lot do it ? WHat sort of installation do you do?

AIX comes with 7 partitions standard:

/ /usr /var /home /tmp swap boot

You can put all of these into Linux LVM, except boot.  That should be
working fairly soon.

> my partitions at the moment
> 
>  Device Boot    Start       End    Blocks   Id  System
> /dev/hda1   *         1       608   4883728+  83  Linux
> /dev/hda2           609       627    152617+  82  Linux swap
> /dev/hda3           628       749    979965   83  Linux
> /dev/hda4           750      1601   6843690    5  Extended
> /dev/hda5           750       871    979933+  8e  Linux LVM
> /dev/hda6           872       993    979933+  8e  Linux LVM
> /dev/hda7           994      1601   4883728+  8e  Linux LVM

I would suggest combining all of the LVM partitions into a single one.
You are wasting space with having multiple LVM partitions on a single
drive, and it doesn't benefit anything.  Each PV can waste up to
(PE size - 1)  bytes, so up to 4MB if you use default PE size.  The only
reason you might want to do this is if you have multiple VGs, but there
is not really a reason to do this with only a single drive.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
