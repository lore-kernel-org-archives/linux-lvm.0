Date: Wed, 7 Jun 2000 19:43:35 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] Reliability
Message-ID: <20000607194335.B17473@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <20000607190757.A18846@gondor.com>
Mime-Version: 1.0
In-Reply-To: <20000607190757.A18846@gondor.com>; from jan@gondor.com on Wed, Jun 07, 2000 at 07:07:57PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <jan@gondor.com>
Cc: linux-lvm@msede.com


Quorum support is a solution to deal with the activation of a VG without having
all PVs available which belong to it.

This actually is usefull in case you have associated all LEs of specific LVs
to available PVs and want to access those.
In real life scenarios this can't be garanteed though which leads to partitally
destroyed (unusable) LV contents and in consequence to filesystem errors.

Therefore qourum is IMO not really usefull.

The tradeoff of the existing solution nevertheless is that reconstruction of
the partition table and the VGDA is necessary on a replacement disk (subsystem)
which takes some time :-{(
After this we almost have the same scenario as with quorum.
The difference is that no I/O errors are returned in case of accessing
bad LEs.

Heinz

On Wed, Jun 07, 2000 at 07:07:57PM +0200, Jan Niehusmann wrote:
> What happens when one of several drives in a vg fails? Is the whole vg
> lost or only lv's that are on that pv? In the latter case, what about
> lv's that are only partly located on that pv?
> 
> I once observed that with a corrupted partition table, causing one pv
> to be lost, the whole vg didn't get detected. As I was able to reconstruct
> the partition table, I didn't try very hard to get the vg running 
> without that drive. 
> 
> Jan

-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                Sistina Software Inc.
Senior Consultant/Developer                      Bartningstr. 12
                                                 64289 Darmstadt
                                                 Germany
Mauelshgen@Sistina.com                           +49 6151 710386
                                                      FAX 710396
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
