From: Erkki Seppala <flux@inside.org>
Subject: Re: [linux-lvm] rescuing a VG with one missing PV
Message-Id: <20020212125816.GA5087@xulfad.ton.tut.fi>
References: <20020209142411.GA10226@xulfad.ton.tut.fi>
    <20020209150956.GA11057@xulfad.ton.tut.fi>
    <20020211205325.GA25253@xulfad.ton.tut.fi>
    <20020212102228.A2360@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020212102228.A2360@sistina.com>
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
Date: Tue Feb 12 06:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Tue, Feb 12, 2002 at 10:22:28AM +0100, Heinz J . Mauelshagen wrote:
> On Mon, Feb 11, 2002 at 10:53:25PM +0200, Erkki Seppala wrote:
> > The drive I got was two gigabytes smaller than the original, and thus:
> > 
> > The original disc was:
> > 
> >   PVs: [AN] ide/host0/bus0/target1/lun0/part1 60030976 /3664    
> > 		21331968 /1302    38699008/2362  
> > 
> > and it now is 58633312 blocks according to fdisk.
> 
> Change your partition to have the very same size as before and vgcfgrestore.

Thanks for the suggestion, and I would very much like to do that, but
as I said, the replacement drive is a bit smaller than the old one,
thus I cannot make as big partition :-).

I was considering hacking vgcfgrestore to ignore the fact that the
size mismatches, are there problems to be expected? Like severe VG
corruption.. I might just as well try anything, it can't be any worse
than the current situation.

-- 
  _____________________________________________________________________
     / __// /__ ____  __                              Erkki Sepp�l�\   \
    / /_ / // // /\ \/ //ircnet                           Modeemi Ry\  /
   /_/  /_/ \___/ /_/\_\@modeemi.fi        http://www.modeemi.fi/~flux/
