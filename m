Date: Thu, 25 Aug 2016 10:59:17 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20160825155917.GA12789@redhat.com>
References: <CAN2gjWSEzL+M45UGFEkEA_i5bgNpKLXTQ+DAMPJjJJvBBvaTKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAN2gjWSEzL+M45UGFEkEA_i5bgNpKLXTQ+DAMPJjJJvBBvaTKQ@mail.gmail.com>
Subject: Re: [linux-lvm] lvm2 cluster aware
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
Content-Type: text/plain; charset="windows-1252"
To: su liu <liusu8788@gmail.com>
Cc: linux-lvm <linux-lvm@redhat.com>

On Thu, Aug 25, 2016 at 09:50:24AM +0800, su liu wrote:
> I have a question about lvm2 cluster, The scene is that I try to imitate
> FCSAN by mapping a rbd volume to two compute node, Then I using the rbd
> volume to  create a PV and VG.I stoped the lvmetad daemon on the compute
> nodes. Then I find that when I operating the VG on one compute node, the
> changes can also be aware on another compute nodes.
>=20
> But this docment(http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html=EF=
=BC=89 says
> that "*LVM is not cluster aware".*
>=20
> My question is that can I use the method to achieve the case that I create
> or delete lv on one node whlie other compute node can using the lvs?
>=20
> Can anybody explain this?

It's not safe to use lvm on shared storage without some extra mechanism to
protect the data or coordinate access among hosts.  There are multiple
ways, depending on what sort of sharing/coordination you want to use:

- use system ID to protect VGs from other hosts,
  http://man7.org/linux/man-pages/man7/lvmsystemid.7.html

- use lvmlockd to coordinate sharing with sanlock or dlm (this is new),
  http://man7.org/linux/man-pages/man8/lvmlockd.8.html

- use clvm to coordinate sharing with dlm (this is old)
  http://man7.org/linux/man-pages/man8/clvmd.8.html
