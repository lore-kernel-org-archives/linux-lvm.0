References: <992d73bd-259e-a89c-f34f-60388d9e1c5b@redhat.com>
	<1F8EA03C-9EC5-4006-91A0-4588756F5698@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <a571fcba-d338-07b0-5c16-b9c1be9c4283@redhat.com>
Date: Tue, 5 Nov 2019 17:24:01 +0100
MIME-Version: 1.0
In-Reply-To: <1F8EA03C-9EC5-4006-91A0-4588756F5698@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>

Dne 04. 11. 19 v 18:28 Tomas Dalebj=C3=B6rk napsal(a):
> thanks, I understand that meta data blocks needs to be update, that I can=
 understand.
> how about the other questions?
> like : data write will happen towards which device? cow device or after t=
he copying has been completed to the origin disk?

Hi

I'd assume - if the block is still mapped in COW and the block is not yet=20
merged into origin - the 'write' needs to lend COW - as there is no 'extra'=
=20
information about which 'portion' of the chunk has been already 'merged'.
If you happen to 'write' your I/O to currently merged 'chunk' - you will
wait till check gets merged and metadata are updated and then your I/O land=
 in=20
origin.

But I don't think there are any optimization made - as it doesn't really=20
matter too much in terms of the actual merging speed -  if couple I/O are=20
repeated - who cares - on the overall time of whole merging process it will=
=20
have negligible impact - and as said - the preference was made towards=20
simplicity and correctness.

For the most details - just feel free to take a look at:

linux/drviers/md/dm-snap.c

i.e. function snapshot_merge_next_chunks()

The snapshot was designed to be small and map a very low percentage of orig=
in=20
device - it's never been assumed to be used with 200GiB and similar snapsho=
t=20
COW size....

Regads

Zdenek
