Date: Thu, 19 Oct 2000 20:44:42 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Thanks! and Swap on LVM?
Message-ID: <20001019204442.A31563@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <39E3008D.A969BC89@winqvist.net> <200010112229.QAA01048@lynx.turbolabs.com> <20001019012957.C699@wookimus.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001019012957.C699@wookimus.net>; from chewie@wookimus.net on Thu, Oct 19, 2000 at 01:29:57AM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Thu, Oct 19, 2000 at 01:29:57AM -0500, ^chewie wrote:
> On Wed, Oct 11, 2000 at 04:29:05PM -0600, Andreas Dilger wrote:
> > Try the updated lvm tools (SRPM) at:
> > 
> > ftp://ftp.stelias.com/pub/adilger/
> 
> Thank you!!!  I usually stay away from SRPM's, but now that I've got
> alien, it's not so bad.  'alien --to-tgz' is a dream.  A plus side to
also dd | gzip -dc | cpio :)))))

....
> 
> Has anyone successfully used a lv parition as a swap device???
> 
[pts/5]bluca@Moskowskaya:~% uname -a
Linux Moskowskaya 2.4.0-test8 #1 Sun Sep 10 09:48:24 CEST 2000 i586 unknown
[pts/5]bluca@Moskowskaya:~% swapon -s
Filename                        Type            Size    Used    Priority
/dev/vg01/lvol2                 partition       262136  29416   -1

L.
-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
