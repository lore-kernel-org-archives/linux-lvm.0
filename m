References: <ba2de1c3-518b-f252-1435-9c4ebd7aa6fd@mnl.de>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <a59d907d-1092-804a-20a0-8227b2aebc10@redhat.com>
Date: Thu, 21 Jun 2018 11:51:41 +0200
MIME-Version: 1.0
In-Reply-To: <ba2de1c3-518b-f252-1435-9c4ebd7aa6fd@mnl.de>
Content-Language: en-MW
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] How to get a list of all logical groups or volumes
 using dbus API
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Michael Lipp <mnl@mnl.de>

On 06/21/2018 09:26 AM, Michael Lipp wrote:
> Hi,
>=20
> I searched, but I cannot find the "root hook". Using the Manager
> interface, I can lookup a LV if I have some id (LookUpByLvmId). But how
> can I achieve the same results as vgs/lvs using the dbus API? I *could*
> get the list of paths and pattern match them, but IMHO this would be a ha=
ck.

I think `object_manager.GetManagedObjects()` is one of supported ways=20
(used by the test suite).

Not sure there is simpler way.



>=20
>  =C2=A0- Michael
>=20
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
