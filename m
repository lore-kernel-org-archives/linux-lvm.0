Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104200013.f3K0DaBu016387@webber.adilger.int>
Subject: Re: [linux-lvm] Re: [repost] Announce: Linux-OpenLVM mailing list
In-Reply-To: <20010419232834.40495.qmail@web12405.mail.yahoo.com>
 "from Cygnus at Apr 19, 2001 04:28:34 pm"
Date: Thu, 19 Apr 2001 18:13:35 -0600 (MDT)
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
Cc: linux-openlvm@nl.linux.org

Casey writes:
> What is the EVMS project? Is this just improvements to LVM, or something
> entirely different?

EVMS is a new project which is designed to work with a number of "LVM"
on-disk formats.  It is relatively new, but intends to support (via
modules) on-disk formats from the current LVM, MD RAID, IBM OS/2 and
AIX LVM, potentially HP/UX LVM, etc.  It is a more modular implementation
than the current LVM code, and allows additional stacking of modules to
handle encryption, device merging, multipath, etc.

It will not (AFAIK) be a complete re-implementation of all of the current
kernel code for MD, partitions, etc.  Rather it will incorporate much of
the existing code into a new framework.

You can find out about it at:
http://oss.software.ibm.com/developerworks/opensource/evms/

Just so people don't get the wrong impression, this isn't a new project
started because of the mailing list issues.  It was launched last year,
and Heinz, myself, and a lot of other kernel developers have provided
input to the project.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
