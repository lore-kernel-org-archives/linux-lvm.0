Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102080116.f181G5L26592@webber.adilger.net>
Subject: Re: [linux-lvm] Help! Problems finding VG after reboot.
In-Reply-To: <Pine.LNX.4.30.0102071946280.22244-100000@tweetie.comstar.net> from
 Gregory McLean at "Feb 7, 2001 07:47:56 pm"
Date: Wed, 7 Feb 2001 18:16:05 -0700 (MST)
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

Gregory McLean writes:
> I've edited around in the startup files to _not_ call vgscan at all
> and things are working for now. Though if I need to add a drive to
> the system I'm screwed.

I disagree.  I never have vgscan in my system startup, and have never
had problems.  The only time I run vgscan is by accident, or on my
rescue partition (where the VGDA info can get out of date).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
