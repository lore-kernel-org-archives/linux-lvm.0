Message-ID: <401807B2.6060900@gene.concordia.ca>
From: Chris Beck <cbeck@gene.concordia.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Snapshots for remote archiving.
References: <4016EE45.1050300@gene.concordia.ca>	 <1075246162.25365.16.camel@david.internal.NorcrossGroup.com>	 <4017E699.5020703@gene.concordia.ca> <1075310348.25365.43.camel@david.internal.NorcrossGroup.com>
In-Reply-To: <1075310348.25365.43.camel@david.internal.NorcrossGroup.com>
Content-Transfer-Encoding: quoted-printable
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
Date: Wed Jan 28 14:06:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

It is whispered that Greg Freemyer was heard, on or about 1/28/2004=20
12:19 PM to say:

>A snapshot is based on copy on write technology.  I guess you could use
>it to create the transaction log you are talking about, but it is not
>what it is designed to do, and I believe significant effort would be
>involved.
>
>Basically with a snapshot, a blank disk volume is created with a flag
>table with one entry per block of master volume data.  All of the flag
>entries are initialized as "unmodified".
>
>When a write is performed to the master volume, the flag table is
>checked.  If the flag for that particular block is set to "unmodified",
>then a copy of the unmodified block is made to the snapshot area prior
>to the write being performed.  The flag is then set to modified.
>
>Future writes to that specific block will have no effect on the flag
>table, nor on the snapshot volume.
> =20
>
Oh well, I guess I was thinking that it was the reverse:  changes were=20
written to the new volume, which was then merged into the old one once=20
the snapshot was finished.

>For your transaction log, the flag table is significant, but the actual
>snapshot volume is not.  It is just the old unmodified content.
>
>To get a true set of differences over a 24-hour period, you would have
>to create a snapshot at time T, and another at time T+24.  (Easily done
>I think).
>
>Then have code that went thru the flag table for snapshot T and
>retrieved the blocks from snapshot T+24 that were marked as modified.=20
>(LVM will automatically get the block from the appropriate source: T+24
>or Master volume)
>
>Once done, the snapshot T would be deleted, and snapshot T+24 would be
>maintained.  At the 48 hour mark, snapshot T+48 would be created and the
>process repeated.
>
>I don't think that is a trivial issue, and I think the code would have
>to implemented in the kernel.
> =20
>
Why the kernel? ... surely reading the flag tables could be done in user=20
space?  I think you have the necessary logic spot on.

>New code would also have to be developed to apply the above blocks.
> =20
>
Hmmm.  I can mess around in perl and java as well as the next guy, but=20
my c-fu is weak, very weak.  How much would it cost to sponsor someone=20
to do this do you think?

--=20
Chris Beck / Y.A.B.A. / Fungal Genomics
CFSG / Concordia University
"La loi dans sa majestueuse =C3=A9galit=C3=A9, interdit =C3=A0 tous, aux =
riches comme
aux pauvres de dormir sous les ponts, de coucher dans la rue et de voler
du pain." -- Anatole France (Les Lys Rouge - 1894)
