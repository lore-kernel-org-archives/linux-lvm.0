Date: Tue, 11 Apr 2000 21:01:10 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm'ing root fs
Message-ID: <20000411210109.A20092@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <38F2C2BB.BE0AD186@twc.de> <2447.000411@comlineag.de>
Mime-Version: 1.0
In-Reply-To: <2447.000411@comlineag.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Tue, Apr 11, 2000 at 10:43:46AM +0200, Jens Bruckmann wrote:
> I used cpio for this:
> 
> find /sourcedir -print | cpio -pvumdl /destdir

thass better, if u have gnu find & cpio use
find /sourcedir -print0 | cpio -0padmuV
(-0 deals with files with \n embedded, -l in your command
would try to link files)

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
