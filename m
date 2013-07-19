Message-ID: <51E916A8.1000101@redhat.com>
Date: Fri, 19 Jul 2013 12:36:24 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1374172980.23440.10.camel@heisenberg.scientia.net>
In-Reply-To: <1374172980.23440.10.camel@heisenberg.scientia.net>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Christoph Anton Mitterer <calestyo@scientia.net>

Dne 18.7.2013 20:43, Christoph Anton Mitterer napsal(a):
> Hi.
>
> I'd have some questions...
>
> 1) Is the --discards option the same than the issue_discards option from
> the config file? Since the one defaults to 0 the other to passdown?
> If not what's the difference?

Nope

--discards options is for thin volume in thin pool - while lvm.conf option =
is=20
about discarding free space in VG - in general - unless you are using some
virtual storage for PVs - it's not a wise idea to enable  issue_discards,
since it makes recovery (i.e. going one step back) impossible - what is=20
discarded cannot be recovered...

For thin volumes - it could be used to free already provisioned space from =

pool (as well as getting native discard on SSD if the pool is on SSD).
Behaviour is configurable.


> 2) Of an existing LV, can I see how data was actually allocated? And how
> can I see the alloc policy of a VG? vgdisplay doesn't show it.

Looks like this attribute should be added to  lvs/vgs.
For now only  lvdisplay shows allocation policy for LV.
To see allocated extents you could use:

lvs -o+seg_pe_ranges


> 3) Do I see that correctly, when I use Normal as alloc policy,... it
> will try to do contiguous allocation... and only do not so,... if not
> possible?

Yes


> 4) md_component_detection and md_chunk_alignment
> Will these also work if there is another block layer (e.g. dmcrypt) in
> between? Especially the md_chunk_alignment?

it's only one-layer check - there is no device stack analysis.

> 5) What alignments are needed?
> "md_chunk_alignment =EF=BF=BD If set to 1, and a Physical Volume is placed
> directly upon an md device, LVM2 will align its data blocks with the md
> device's stripe-width."

What is visible in sysfs  is used.
It's responsibility of each device to provide correct values for alignment.
i.e. if you have crypted  mdraid device - then crypto needs to export
right values.

Zdenek
