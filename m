Return-Path: <ragnark@stine.vestdata.no>
Date: Thu, 26 Apr 2001 15:26:52 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] badblocks handling with LVM
Message-ID: <20010426152651.B26041@vestdata.no>
References: <200104231008.f3NA8Gkx001134@webber.adilger.int> <01042519594802.31687@lyta> <20010426100603.A9820@sistina.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010426100603.A9820@sistina.com>; from Heinz J. Mauelshagen on Thu, Apr 26, 2001 at 10:06:03AM +0000
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Thu, Apr 26, 2001 at 10:06:03AM +0000, Heinz J. Mauelshagen wrote:
> > The problem is that when you move LV's around and make snapshots the ba=
d=20
> > blocks on the underlieing media will move.  Therefore I think that mana=
gement=20
> > of bad blocks possibly should be done in the LVM.
> >=20
> > Or should we just assume that LVM runs over RAID arrays of ATA/SCSI dis=
ks=20
> > that have sector-sparing so that bad blocks are not an issue?
>=20
> That's what I recommend because disks typically "hide" bad sectors to a c=
ertain
> degree using bad block relocation et al.
> If the given disk capacity for this is not enough because too many bad bl=
ocks
> occured already then you are in serious trouble and need to repleace
> your disk (subsystem) anyway IMO.

And if anyone insist on using LVM to mark the blocks anyway, it can be
done with out special code. Just create a volume named "broken", and put
the PVs in question in this.


--=20
Ragnar Kj=EF=BF=BDrstad
Big Storage
