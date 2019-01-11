References: <MEAPR01MB502904BB1C62BCAEDA77544FC28D0@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<8fb5fa67-1b56-7baf-e8c9-b422c5c8b443@redhat.com>
	<MEAPR01MB5029BFA4227BCA2DD60501A5C2840@MEAPR01MB5029.ausprd01.prod.outlook.com>
	<CACrcyfLBRPnFXxxo8jKYYUJkH+GpUL3vjO7ORfvYhHQ74Wykfw@mail.gmail.com>
From: Sarah Newman <srn@prgmr.com>
Message-ID: <50446a5a-7cf5-81da-00df-c5ab007929d3@prgmr.com>
Date: Fri, 11 Jan 2019 11:29:11 -0800
MIME-Version: 1.0
In-Reply-To: <CACrcyfLBRPnFXxxo8jKYYUJkH+GpUL3vjO7ORfvYhHQ74Wykfw@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] how to copy a snapshot,
 or restore snapshot without deleting it
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>
Cc: Marian Csontos <mcsontos@redhat.com>

On 1/10/19 6:34 AM, Tomas Dalebj=C3=B6rk wrote:
> Checkout this
> https://github.com/mpalmer/lvmsync
>=20
> This can probably do what you are asking for.
>=20
> Regards Tomas

This does not address the original issue of what to do with thin snapshots,=
 but FYI there is also https://github.com/yurytaranov/lvsync which deals
with non-thin snapshots with much fewer dependencies.

--Sarah
