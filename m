Return-Path: <e@arix.com>
From: "Erick Calder" <e@arix.com>
Subject: RE: [linux-lvm] Looking for recipe for LVM
Date: Wed, 8 Aug 2001 17:17:56 -0700
Message-ID: <009301c12068$bd4e2fb0$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010807165556.C29254@dragon.blacknet.de>
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

> and is someone gives me access to a dumpable redhat 7.1
> system I'll try to make my RPMs workable on redhat (But I've a lot of work
to
> do at the moment, so don't expect immidiat results)).

I'll jump at that chance!  I have a box I've been trying to build your RPMs
on for a while without success...  I can let you have at it.

The last point I reached was a successful build of the RPMs but I was unable
to install them, the install complained that "package kernel-2.2.19-4tr1bn
is for a different architecture".  yikes!  I was building the i686 target
specifically because without specifying the target I got complaints...

-----Original Message-----
From:	linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of Goetz Bock
Sent:	Tuesday, August 07, 2001 7:56 AM
To:	linux-lvm@sistina.com
Subject:	Re: [linux-lvm] Looking for recipe for LVM

 << File: ATT00135.dat >>
On Tue, Aug 07 '01 at 15:33, Patrick Caulfield wrote:
> On Mon, Aug 06, 2001 at 08:54:11AM -0400, John.Forrer@comsat.com wrote:
> Well, no-one else seems to be able to help so I'll try. I don't have
RedHat 7
> but I've heard bad stories about people trying to patch RedHat kernels.
For your own sanity, you should NEVER try to add another patch to any
Linux Vendors kernel. Always start with a fresh kernel and collect your
bits and pices from the web (take only thous you realy need).
And now to contradict myselve, I could offer a highly patched 2.2.19 for
Trustix (and is someone gives me access to a dumpable redhat 7.1 system
I'll try to make my RPMs workable on redhat (But I've a lot of work to
do at the moment, so don't expect immidiat results)).
--
Goetz Bock                                              IT Consultant
Dipl.-Inf. Univ.
