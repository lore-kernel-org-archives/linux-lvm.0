Return-Path: <ragnark@stine.vestdata.no>
Date: Thu, 26 Apr 2001 16:36:12 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] badblocks handling with LVM
Message-ID: <20010426163612.D26041@vestdata.no>
References: <200104231008.f3NA8Gkx001134@webber.adilger.int> <01042519594802.31687@lyta> <20010426100603.A9820@sistina.com> <20010426152651.B26041@vestdata.no> <20010426162742.A8220@dragon.blacknet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010426162742.A8220@dragon.blacknet.de>; from Goetz Bock on Thu, Apr 26, 2001 at 04:27:42PM +0200
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Thu, Apr 26, 2001 at 04:27:42PM +0200, Goetz Bock wrote:
> On Thu, Apr 26 '01 at 15:26, Ragnar Kj�rstad wrote:
> > And if anyone insist on using LVM to mark the blocks anyway, it can be
> > done with out special code. Just create a volume named "broken", and put
> > the PVs in question in this.
> That would be a waste of space, my PVs are all 10+GB in size, I'd like
> bad block handling on PE level not on PV level.
> But I can live with out badblock handling in LVM.

Sorry, I meant "put the PEs in question in this".
(it doesn't actually do anything, just mark that space as used, so you
won't accidently put something else there)

-- 
Ragnar Kj�rstad
Big Storage
