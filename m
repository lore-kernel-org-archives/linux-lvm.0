Received: from [10.15.80.216] (dhcp80-216.msp.redhat.com [10.15.80.216])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6AErqYK027552
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2007 10:53:53 -0400
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <468DCB29.9020305@cargo-partner.com>
References: <20070704140438.8BE0177702@mail.futurelabusa.com>
	<468DCB29.9020305@cargo-partner.com>
Message-Id: <BF0A9817-D66C-4583-8416-D5A4B687351A@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] lv with cmirror
Date: Tue, 10 Jul 2007 09:51:10 -0500
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
Content-Type: text/plain; charset="iso-8859-1"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Any output found in /var/log/messages?

  brassow

On Jul 5, 2007, at 11:55 PM, Michael Eisenk=EF=BF=BDlbl / FIS wrote:

> Hi,
>
> I installed a clustered VG with a mirrored LV (RHEL4.5 and cmirror).
> and using three iscsi storages (each two channels) and =20
> multipathd ... to be sure.
>
> If I disconnect one iscsi storage, the LV is not working.
> the command lvs or lvdisplay stucks.... when connecting again, the =20
> command will be
> finished and everything will work.
>
> why doesn't it remove the fault pv? any ideas?
>
> kind regards,
> michael
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
