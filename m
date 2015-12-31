Received: from [10.40.200.19] (ovpn-200-19.brq.redhat.com [10.40.200.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBVLClxO028766
	for <linux-lvm@redhat.com>; Thu, 31 Dec 2015 16:12:48 -0500
References: <CAAYit8TFUcWzveNPV3gsknnagWoEZVeKWWfWpKuFfmBauQhS2Q@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56859A4F.3020704@redhat.com>
Date: Thu, 31 Dec 2015 22:12:47 +0100
MIME-Version: 1.0
In-Reply-To: <CAAYit8TFUcWzveNPV3gsknnagWoEZVeKWWfWpKuFfmBauQhS2Q@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Could we manually suspend the origin before taking
 dm-thin snapshots?
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

Dne 31.12.2015 v 09:40 M.H. Tsai napsal(a):
> Hi All,
>
> I found an issue when taking dm-thin snapshots: LVM doesn't send
> create_snap messages if the origin was already suspended, and LVM
> doesn't report any error.
>
> lvcreate vg1 --type thin --thinpool tp1 --virtualsize 1g
> dmsetup suspend vg1-lv1
> lvcreate vg1/lv1 --snapshot -an
>

Hi

This is completely UNSUPPORTED  - you MAY NOT interfere with
LV volumes with 'dmsetup'.

You can use dmsetup only if you know EXACTLY what's going on.
The only recommended usage of dmsetup with lvm2 is - when
lvm2 lacks some error path (e.g. fix mess left after
failing lvm command).

Otherwise there is no point to hijack LVs in the middle
of LV operations - i.e. in cluster world  state of LV
(active/suspend) is tightly related to lock state.

> This is due to commit a900d150 moves messaging from resume to suspend,
> then LVM skips the suspend phase in this case. I'm not sure whether it
> is a legal operation for LVM, but if LVM supports this feature, then
> users can control the suspend timing.

plain unsupported state.

You could have been hijacking suspend/resume/remove operation
anytime. In fact you could easily block/freeze whole LV but doing
random suspends of DM devices in your system.

Regards

Zdenek
