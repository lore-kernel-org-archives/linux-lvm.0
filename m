Return-Path: <heimdall@mail.org>
From: "Daniel E Whicker" <heimdall@mail.org>
Subject: RE: [linux-lvm] Problem with vgscan/ vgcfgrestore
Date: Mon, 12 Mar 2001 18:16:49 -0600
Message-ID: <GIEGKMCLIJBKBNBCCHEACEJACAAA.heimdall@mail.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200103122319.f2CNJKP00753@webber.adilger.int>
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
To: linux-lvm@sistina.com

Andreas,
	Thanks for helping.  I did in fact have devfs compiled in and mounted to an
alternative path.  The only other oddness in the kernel was reiserfs.
Beyond that, everything is pretty vanilla.  I'm rebuilding the OS on that
system at the moment, but as soon as I'm done, I'll get 2.4.2 with LVM
.9.1b5 and your patch installed and see how it goes from there.  In the
meantime, is there any way of restoring the "HM" magic to the PVs
nondestructively?

Gang,
	Sorry for bomblasting ya'll with those earlier messages.  I'd failed to
look at the file sizes before emailing that.  Won't happen again.  As far as
the digital signatures preventing plaintext messaging:  baaaaad M$.  (Note:
signatures have been removed)

Thanks for your patience and assistance.

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of Andreas Dilger
Sent: Monday, March 12, 2001 5:19 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore

Anyways,
vgscan doesn't appear to be finding any of your PVs because they are missing
the "HM" magic for the PV, or so err -268 tells me.  The only PV that
appears
intact is /dev/hdc, which ends up being discarded because it isn't in the
dir
cache.  You can see that nothing is found from pv_read_all_pv() - it reports
"np: 0" at the end.

Are you running devfs, or even have it compiled into the kernel by any
chance?
It also appears you are not running the current CVS code (pretty much a must
when tracking down problems) because you are going into lvm_add_dir_cache()
multiple times.
