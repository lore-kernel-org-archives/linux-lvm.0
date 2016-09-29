References: <CABGge9y-NDG1YdF3M5BSxems4wHHy2YiaXOi7dqFfG6VOGasSg@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <1d992f9f-02e1-96db-6168-1c72c7f7a063@redhat.com>
Date: Thu, 29 Sep 2016 11:23:17 +0200
MIME-Version: 1.0
In-Reply-To: <CABGge9y-NDG1YdF3M5BSxems4wHHy2YiaXOi7dqFfG6VOGasSg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] metadata too large for circular buffer - any way to
 increase PV metadatasize?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, john@johnleach.co.uk

Dne 28.9.2016 v 15:51 Charles Koprowski napsal(a):
>  On Sun, 10 Aug 2008 18:45:16 +0100, John Leach wrote:
>
>     On Thu, 2008-08-07 at 20:41 +0100, Alasdair G Kergon wrote:
>     > To remove the metadata areas you need to:
>     >
>     >    get an up-to-date metadata backup (vgcfgbackup)
>     >
>     >   pvcreate --restorefile pointing at a copy of that backup file
>     requesting 0 metadata areas
>     > and specifying the same uuid as it had before
>     >
>     >   vgcfgrestore from the backup file
>     >
>     This doesn't look like something you can do with the volume group active
>     (with cluster lvm anyway):
>     [root testnode0 ~]# pvcreate --restorefile san-metadata -u
>     fTLglk-j1C1-02Z7-8k6l-DTAm-2WNj-9ZGT19 --metadatacopies 0 /dev/hdb -ff
>     Really INITIALIZE physical volume "/dev/hdb" of volume group "san" [y/n]? y
>       Can't open /dev/hdb exclusively.  Mounted filesystem?
>     Is that right, or am I missing something?
>
>
> Hi John,
>
> I know it's been a long time but, Did you found out a solution for this ?
>
> I'm trying to follow the same scenario to increase the metadatasize and got
> stuck at the same point.




Hi

I've no real idea what's the original problem  - but here is clear error on 
user side. This message:

"Can't open /dev/hdb exclusively.  Mounted filesystem?"

indicates that device is NOT UNUSED and it has to be unused for this operation 
- i.e. you MAY NOT run this operation while there are active LVs from this PV 
(one of possible reasons why  'hdb' cannot be opened exclusively)



To increase 'metadata' size - you ether have to add some NEW PV with
much bigger metadata size space (and such operation still needs some
extra space to proceed with existing size). Then disable existing metadata
areas - so you will end-up of storing bigger MDA only to this new bigger MDA 
on a new PV -  note - it's quite risky plan to leave MDA only on single PV in 
multi-PV VG  - so I'd not advice this for any serious use.

You may PV via pvmove to a new bigger PV.
(adviced operation - though it may take its time...)

There is NOT lvm2  native support for  'online' resize of PV mda size - and 
while it's possible to do this operation manually - it's quite complex task - 
so I'd not advice to do this either - unless you have FULL backup of everything.

So back to your original problem - please describe  EXACTLY what is your 
problem and attach  outputs of  pvs,vgs,lvs  and what you want to achieve.


Regards

Zdenek
