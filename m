Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103291910.f2TJAAl09275@webber.adilger.int>
Subject: Re: [linux-lvm] safe to ru-run vgscan after mounting LV root?
In-Reply-To: <Pine.LNX.4.30.0103290944140.29639-100000@bongo.fms.indiana.edu>
 from Jay Sissom at "Mar 29, 2001 09:46:01 am"
Date: Thu, 29 Mar 2001 12:10:10 -0700 (MST)
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

Jay Sissom writes:
> Nope, I am running kernel 2.4.2 with the beta6 patch and the beta6
> utilities.

OK, that's a bad sign.

> This started after I resized a LV.  The answer from this list was, "don't
> run vgscan".  Now people on the list say you can run it as many times as
> you like.  If I run it once, all my LV's are gone.  I'd like to figure out
> what the problem is, but don't know where to start looking.

You _should_ be able to re-run vgscan, but in most cases (as you have
seen) it is not _necessary_ to do so.

In any case, how to track down the problem - run "vgscan -v -d" and
start going through the output with a fine-tooth comb.  Basically,
at some point you will start getting errors, and that is what is bad
(it is OK to get error codes in a few places, like when checking if
a partition/disk has an LVM header on it).

For a VG to be operative, you need all of the PVs in it to be OK.
This seems to be a common source of problems.  I have a modified
pv_read_all_pv() and pv_read_all_pv_of_vg() which is a lot better
in terms of reporting why a PV was discarded from the PV list. This
may make finding the source of the problem easier (even obvious ;-).

You can find it in an email to the lvm-devel mailing list dated
March 15 "Re: [lvm-devel] Extent list sorting considered buggy".

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
