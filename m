Message-ID: <46425545.3060008@ce.jp.nec.com>
Date: Wed, 09 May 2007 19:12:05 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mirrored lv with 6TB
References: <4641D430.1010101@cargo-partner.com>
	<4641D81D.1040009@cargo-partner.com>
In-Reply-To: <4641D81D.1040009@cargo-partner.com>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>, michael.eisenkoelbl@cargo-partner.com

Hi,

Michael Eisenk=EF=BF=BDlbl / FIS wrote:
> *i want to create a volumegroup with a mirrored lv. but this is only
> possible up to 4TB.
> if i want to create a mirrored lv with 6TB, i got kernel panic with
> following in the /var/log/messages:*

It looks that dm-log requested too big write to dm-io and
dm-io couldn't handle it.

You should be able to work around it using larger region size
(-R option of lvcreate).

For example, the following command creates a LV with 4MB region size.
# lvcreate -L 6T -R 4 ...

Thanks,
--=20
Jun'ichi Nomura, NEC Corporation of America
