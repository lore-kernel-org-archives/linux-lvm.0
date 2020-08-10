References: <A71F734D-C071-4CC7-A381-6FC11171B94C@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <153631cb-0f0b-c20e-011c-0f3f2e183def@redhat.com>
Date: Mon, 10 Aug 2020 17:24:56 +0200
MIME-Version: 1.0
In-Reply-To: <A71F734D-C071-4CC7-A381-6FC11171B94C@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] what will happen with lvconvert merge after reboot?
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

Dne 10. 08. 20 v 1:19 Tomas Dalebj=EF=BF=BDrk napsal(a):
> hi
>=20
> If a user starts a
> # lvconvert --merge -b snaplv
>=20
> and reboots the server before the convert/merge has completed
>=20
> will the merge/converting process continue after reboot?
> or will the volume be stale?
>=20
> if the merge/convert is restarted, can it resume where it was?
>=20

Hi

Merge 'starts' when origin&snap device are unused.
Once snapshot merge start - it cannot be reverted.

If there is any sort of 'failure' (i.e. poweroff) - merging continue
after reboot and should safely finish.

Note - once the merge starts - you can already use 'merged' LV since mergin=
g=20
is running in the background (blocks are copied and you can 'monitor' its=20
status with  'lvs' command).

If you would be using 'thin' snapshot - merge is an instant operation.

Regards

Zdenek
