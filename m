Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103121825.f2CIP8l04898@webber.adilger.int>
Subject: Re: [linux-lvm] Problems with vgscan
In-Reply-To: <Pine.LNX.4.30.0103100129080.12825-201000@hq.nawigator.pl> from
 Lukasz Trabinski at "Mar 10, 2001 01:36:38 am"
Date: Mon, 12 Mar 2001 11:25:08 -0700 (MST)
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

Lukasz Tribinski writes:
> I'm posting patched pv_read_all_pv_of_vg.c, too verify it.

Not related to the problem, AFAICS.

> OK. There is gzipped output from vgscan -v -d

It looks like it is not able to find LEs which are assigned to this LV.

What version of tools do you have?  It appears that with all of the
"lvm_add_dir_cache" calls you have an old version (this was fixed a few
weeks ago).  Maybe you should try the tools from CVS.

It appears you have two PVs - hdg1 and hdh1, correct?  Other than that,
I can't see what is missing.  Maybe "pvdata -a /dev/hd[gh]1" will help.
It will be long again (you have 16k+ LEs there), but it should show the
LE numbers on both PVs.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
