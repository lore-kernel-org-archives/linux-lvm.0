Message-ID: <51E99905.9000508@redhat.com>
Date: Fri, 19 Jul 2013 21:52:37 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1374172980.23440.10.camel@heisenberg.scientia.net>
	<51E916A8.1000101@redhat.com>
	<1374258168.5231.48.camel@fermat.scientia.net>
In-Reply-To: <1374258168.5231.48.camel@fermat.scientia.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] some questions
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Christoph Anton Mitterer <calestyo@scientia.net>

Dne 19.7.2013 20:22, Christoph Anton Mitterer napsal(a):
> On Fri, 2013-07-19 at 12:36 +0200, Zdenek Kabelac wrote:
>> --discards options is for thin volume in thin pool
> Is that then really only for thin pools?
> I mean not when I "free" the LEs by removing/shrinking an LV, but when
> e.g. my ext4 deletes a file and sends a discard... does LVM pass that on
> and is that generally affected by --discards?
>
> E.g. in cryptsetup you have a general option which controls whether TRIM
> is passed through dm-crypt to lower block layers... I though --discards
> of being like that...

By default every normal (i.e. linear) LV should pass-through discards - there 
is AFAICS no code to block them and you can't disable them.

For thin volume - it's going through the pool first - and you have the choice
either to ignore them completely, process them at pool level or pass-through 
the pool to pool data device.


>>   - while lvm.conf option is
>> about discarding free space in VG - in general - unless you are using some
>> virtual storage for PVs - it's not a wise idea to enable  issue_discards,
>> since it makes recovery (i.e. going one step back) impossible - what is
>> discarded cannot be recovered...
> Sure... when e.g. using dmcrypt with it would have even some security
> drawbacks...

dmcrypt is not a problem here - but when you i.e. lvreduce -  then if 
'issue_discard' is enabled - then you cannot revert/vgcfgrestore this
metadata operation - since all reduced data would have been discarded.

In general - whenever you create new LV and then you use mkfs - it will 
discard whole device anyway.

> I though it would be enough if the dataalignment offset of the PVs was
> correctly to the underlying "blocks". AFAIU they even wouldn't need to
> be aligned to the chunksize of the MD, since the only blocks valid for
> MD are the ones from the physical drive below (usually 512B or 4KiB) and
> in case of striped MD, PAGE_SIZE blocks (usually 4KiB as well) in which
> MD reads/writes parity.
>
> Does LVM recommend that the PE's (i.e. the 4 MiB - not KiB) are aligned
> to the stripe size? I though the PE size is irrelevant for normal
> reads/writes...


Initial extents should be aligned (and ideally all extents) - (lvm2 metadata 
are located in front of extents)

i.e. my SSD uses 512KiB blocks - so this is the minimal alignment.
it's not always simple to decide which type of striping is ideal.


Zdenek
