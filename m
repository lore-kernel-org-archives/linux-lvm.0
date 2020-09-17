References: <cf779b76e25707b8ec3361f55318a1c7@assyoma.it>
	<E99B2EFD-42A3-4EAA-81C5-E04325569E8D@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b2dade35-fd56-453e-bee6-1963a324f074@redhat.com>
Date: Thu, 17 Sep 2020 21:17:58 +0200
MIME-Version: 1.0
In-Reply-To: <E99B2EFD-42A3-4EAA-81C5-E04325569E8D@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvm limitations
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
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: Zdenek Kabelac <zkabelac@redhat.com>

Dne 16. 09. 20 v 6:58 Tomas Dalebj=C3=B6rk napsal(a):
> just curious about this:
>=20
>> Worth to note there is fixed strict limit of the ~16GiB maximum
>> thin-pool kernel metadata size - which surely can be exhausted -
>> mapping holds info about bTree mappings and sharing chunks between
>> devices....
> would that mean that one single thin-pool can maximum hold 16GiB/16 nr of=
 blocks?

thin_metadata_size is the tool that you can play with and see the needed sp=
ace=20
of metadata to handle various sized of data volumes.
The bigger the thin-pool chunk is - the less metadata is needed - but the
less 'efficient' snapshot becomes.


> and how about if LVM2 uses VDO as backend, are there more limitations tha=
t I need to consider there that are not reflected here

certainly yes - you need to check documentation for VDO how to configure=20
parameters to held given expected amount of data (with lvm lot of them
is ATM configurable from lvm.conf or profiles)


Zdenek
