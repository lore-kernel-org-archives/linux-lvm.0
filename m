References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
	<51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
	<4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<bd9a12f33412163e9c65b4a9b78eeb4f@xenhideout.nl>
	<6dd3a268-8a86-31dd-7a0b-dd08fdefdd55@redhat.com>
	<9142007eeb745a0f4774710b7c007375@assyoma.it>
	<eea26091-40e7-8f31-e4ba-dfab059f3d70@redhat.com>
	<0a322a6f355a0744427f2a7a45162c81@assyoma.it>
	<c5f98473-1dad-b48e-ef3f-b311e5de2ee9@redhat.com>
	<fbf49ac9-152e-fb41-2905-56d30ee2024c@assyoma.it>
	<1be887bb-d86f-5896-1c19-844864c41ba2@redhat.com>
	<c3c0342c-2957-b44b-92cc-abe9b58e818d@assyoma.it>
	<f354fa7c-63e3-8ad3-d564-98b7e152ce37@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <815e7534-f432-97d6-0879-b722246bbf92@assyoma.it>
Date: Thu, 1 Mar 2018 17:26:29 +0100
MIME-Version: 1.0
In-Reply-To: <f354fa7c-63e3-8ad3-d564-98b7e152ce37@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: Zdenek Kabelac <zkabelac@redhat.com>, linux-lvm@redhat.com

On 01/03/2018 17:00, Zdenek Kabelac wrote:
> metadata snapshot 'just consumes' thin-pool metadata space,
> at any time there can be only 1 snapshot - so before next usage
> you have to drop the existing one.
>=20
> So IMHO it should have no other effects unless you hit some bugs...

Mmm... does it means that a not-release metadata snapshot will lead to=20
increased metadata volume usage (possibly filling it faster)?

> thin-pool=EF=BF=BD target is having different goals then VDO
> so both targets will likely live together.
>=20
> Possibly thin-pool might be tested for using VDO data volume if it makes =

> any sense...

Great. Thank you for the very informative discussion.
Regards.

--=20
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
