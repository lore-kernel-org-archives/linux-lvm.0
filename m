Received: from [10.34.131.225] (dhcp131-225.brq.redhat.com [10.34.131.225])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t52Bwaqe022894
	for <linux-lvm@redhat.com>; Tue, 2 Jun 2015 07:58:37 -0400
Message-ID: <556D9A6C.5010209@redhat.com>
Date: Tue, 02 Jun 2015 13:58:36 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <87r3puv9zp.fsf@bluescreen303.nl>
In-Reply-To: <87r3puv9zp.fsf@bluescreen303.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Cpy%Sync column - high disk activity after reboots
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 2.6.2015 v 09:35 Mathijs Kwik napsal(a):
> I'm sorry if I was unclear. But I'm not using writeback mode yet.
> The period of disk activity after reboots occurs with writethrough mode.
>
>

Please attach:

dmsetup  table

dmsetup status

dmsetup ls --tree


Zdenek
