Message-Id: <200006080031.CAA16192@e35.marxmeier.com>
Subject: Re: [linux-lvm] Reliability
Date: Thu, 08 Jun 2000 2:31:19 MESZ
In-Reply-To: <20000607194335.B17473@hmsysv.t-online.de>; from "Heinz J. Mauelshagen" at Jun 7, 100 7:43 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauelshagen@Sistina.com
Cc: jan@gondor.com, linux-lvm@msede.com

> Quorum support is a solution to deal with the activation of a VG without having
> all PVs available which belong to it.
> 
> This actually is usefull in case you have associated all LEs of specific LVs
> to available PVs and want to access those.
> In real life scenarios this can't be garanteed though which leads to partitally
> destroyed (unusable) LV contents and in consequence to filesystem errors.
> 
> Therefore qourum is IMO not really usefull.
> 
> The tradeoff of the existing solution nevertheless is that reconstruction of
> the partition table and the VGDA is necessary on a replacement disk (subsystem)
> which takes some time :-{(
> After this we almost have the same scenario as with quorum.
> The difference is that no I/O errors are returned in case of accessing
> bad LEs.

As far as i can see Quorum support looks like the saner option:
If you loose a disk and only restore the partition table and VGDA
the replacement disk still mostly contains garbage (eg. not a fs).
So we could as well activate the VG and leave LVs with extents
on offline PVs disabled?

Any reason why this might not work?

Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
