Received: from [10.40.200.44] (ovpn-200-44.brq.redhat.com [10.40.200.44])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3IHcAp9019618
	for <linux-lvm@redhat.com>; Mon, 18 Apr 2016 13:38:11 -0400
References: <CANvCAA8ehAT5Y20hjv9uCCRCvNTTRTLna0CBJhDQUEkOc0mZJw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <57151B82.7080106@redhat.com>
Date: Mon, 18 Apr 2016 19:38:10 +0200
MIME-Version: 1.0
In-Reply-To: <CANvCAA8ehAT5Y20hjv9uCCRCvNTTRTLna0CBJhDQUEkOc0mZJw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Invalid property name or unable to query'lv_attr',
	errno = 22.
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dne 13.4.2016 v 16:30 Tomas Dalebjork napsal(a):
> Hi,
>
> We are trying to use the lvm2api, which works fine on RHEL6.
> But on some RHEL7 systems, we receive this error:
>
> *Invalid property name or unable to query'lv_attr', errno = 22.
> *
> What can possible be wrong with this?
>


Hi

Sorry but from this report it's impossible to even guess
which attribute is missing/failing

lvm2app is not really in any development and we hope to replace
it at some point with dBus interface.

So do not expect any major improvements in this area.

But if there is regression - please open RHBZ with full
traces of your problem.

If you want to use some latest lvm2 feature - simple call lvm2 command.

Regards

Zdenek
