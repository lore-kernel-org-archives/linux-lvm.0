Subject: Re: [linux-lvm] Misleading documentation
From: Les Mikesell <lesmikesell@gmail.com>
In-Reply-To: <20060921094228.GB4796@redhat.com>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<20060918193728.GC28043@arvo.suso.org>
	<4B875923-CB76-4792-837B-EDA3B9E53756@slamb.org>
	<45111CDA.6080406@mortent.org> <20060920114019.GA4796@redhat.com>
	<1158756105.31514.3.camel@les-home.futuresource.com>
	<20060921094228.GB4796@redhat.com>
Message-Id: <1158843140.2111.7.camel@les-home.futuresource.com>
Mime-Version: 1.0
Date: Thu, 21 Sep 2006 07:52:21 -0500
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: mauelshagen@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2006-09-21 at 04:42, Heinz Mauelshagen wrote:
> > > > 
> > > > Mirroring should be dealt with in LVM itself, by mapping more PEs on 
> > > > physical seperate PVs to each LE. From the little information I've seen 
> > > > about the new LVM mirroring, it seems that the mirrors are defined on LV 
> > > > level instead of LE/PE. But after some JFGI sessions nothing really 
> > > > enlightening has shown up.
> > > 
> > > LVM2 does mirror by grouping multiple (hidden) logical volumes
> > > into a mirror set.
> > 
> > Where would I find example commands to add a mirror, check
> > the mirroring status, break it, reuse the other half, etc.?
> 
> 'man lvcreate' to start with.
>
> > Is it possible to mirror a snapshot instead of the changing
> > volume?
> 
> Not yet.

Are the parts that do work version-specific?  What is the
earliest version where the mirror support is reliable
and has that made it into the popular distributions yet?

-- 
  Les Mikesell
   lesmikesell@gmail.com
