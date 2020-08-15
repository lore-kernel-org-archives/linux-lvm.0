Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 866CD1006169
	for <linux-lvm@redhat.com>; Sat, 15 Aug 2020 08:57:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 067C385A5B4
	for <linux-lvm@redhat.com>; Sat, 15 Aug 2020 08:57:27 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <d077323c-fd76-8ebf-ea2d-db8ba7b876b0@yahoo.co.uk>
Date: Sat, 15 Aug 2020 09:57:21 +0100
MIME-Version: 1.0
Content-Language: en-US
References: <d077323c-fd76-8ebf-ea2d-db8ba7b876b0.ref@yahoo.co.uk>
Content-Type: multipart/mixed; boundary="------------F06844D629C98A3E8B22F8F5"
Subject: [linux-lvm] extend raid5 - how if possible?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------F06844D629C98A3E8B22F8F5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi guys

In hope that experts roam this list I want to ask if it is
possible to extend raid5.
If I wanted to be specific, raid created this way:

$ lvcreate -n raid5.1 -l 100%pv --stripes 5 --stripe-size 8
ST2000_front.0 /dev/sdj /dev/sdk /dev/sdn /dev/sdo /dev/sdp
/dev/sdq

You can see I try to be specific about hard disks here. I
hope that later I can add more of exact same hard disk to
the system and extend such raid5.

many thanks, L.

--------------F06844D629C98A3E8B22F8F5
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBF8IpOwBCADuUx1NAgdgHMaJxN3loQkui2MeAILnFgeXAqnd3BmtlRVNSxZI
uoQzu6+TDSA8lv+MsLeRyLbU+aWWSPp0DwPlBwmpLKCx5gEfMDkwpGAFkPQ3aKqS
D7KAgtgvktPFpd8QztWKlAiAeWBR5gCDM+iNRSvnNUR0OYo7E9jysA3XC3/dPjis
d/9HkaCzKznx6E6YvJr3I4q8JDnRtsUWIIuTis1leMm/AEfR0s7+bWveUvxg4Jbt
sgpTiA6G1HzDTo0MbMaMmSLDQTWVyMbhsmkkSt2nUF+lLqnzFYUxe/5WExRlpR1N
BLLHw6Gt2Zaf2HpqQs0VX4jlFzr7hFccss6dABEBAAG0HmxlamVjemVrIDxwZWxq
YXN6QHlhaG9vLmNvLnVrPokBVAQTAQgAPhYhBHGHlElrFeJ/3L06fN/abQlAAxUh
BQJfCKTtAhsDBQkB4TOABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEN/abQlA
AxUhjEgH/jj9oWVofJjQkLiYTiUPClWO5sfAz4vOTTkrr+/vkzg14KT2fvgPYiNG
tIKy9Ffb4hTjXtwy8qYD3bMEyW6W4Cw/YVyxZk2ELX6DDqYpsZAW9qQb/zG8joaq
u2kk6m+BqmOXq0BYAhPboj0k7Gp7sy2FIk5T2uArWsS2oAuBXiUKnqEWOZrySVv/
GLLmwfQe5NI++hbm4YqkMKIj9J3nN5WFwKfI02eHvd8HMsPmShDdguKTbc//08yn
ERUUBoOmxuLpjuLwgRgmcqHY+QhaeoWpt/uC0XMeik2yOi5k8723hiG+W7zUVTnn
gv3XAoBuwZKAjBIS2chBID+JzFiZIlG5AQ0EXwik7QEIAKxbvzhNR+Vs0TnTS4Gs
0ArvzoT6yNyG0zlBpTQ7nypjZcJAWbTJEW5JRIn90Xz80HeR9zSdYg/opPdiQcui
NKBrc7hcu4qjISbkMVQ4aeZVsEd/sRi85VrQJ2wKbrB9Of888Seklk3FMlaMPM3G
zp6YesmRa7tt4tcKfqsrmunwbpFySPZ193ccJRpbeagRCz8StDwI8J9Z32ZdjhsO
ouGdzI1Z6DOqfzwzKrCZAuMbIvSdKXIpYxHZ3ZZ90OxC2iD8WklMguQdIAui2dCw
r4B50fXMWsw82NmiWH0ltX++ZBCDuX56uQ0Pd+J1StNZBxyUzOBj162NP+NgFaot
l3EAEQEAAYkBPAQYAQgAJhYhBHGHlElrFeJ/3L06fN/abQlAAxUhBQJfCKTtAhsM
BQkB4TOAAAoJEN/abQlAAxUhLsUIAJCnRHk+7AFq8+5zCBixv2LMTQPZqsc7h0zG
6AWx0WBGcKej9DdNq3GKTCKKT7kwMclmzQa5zIYXdWj3NdJKYkPTo+G5uQcZtcs4
tqcWmPzUckFM4fZlOt2JVMeD8zmDTpCXksZMYL3DczDZHx1oSx3wAJRpisxNIzJj
Swmd2r6GkE772fbQxDCv479K1yqPBamYcSXgBFxUW8C9q5RqmACKRyqDGNXNyEi3
uXgvFHII2R2qEd8/MzRnyBxlLOFyfvq6cVEl+hv/sbZnfZsKXtw1ZPKIzhx9FZl9
hmIV2UxvxDXgJm/yxS9ZQf3czXPdVehgQ9oSlBqSfW98DRUrgFM=3D
=3DwC4G
-----END PGP PUBLIC KEY BLOCK-----

--------------F06844D629C98A3E8B22F8F5--
