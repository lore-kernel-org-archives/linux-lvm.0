Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5EBoe030345
	for <linux-lvm@redhat.com>; Mon, 14 Jun 2004 07:50:40 -0400
Received: from ciistr2.ist.utl.pt (ciistr2.ist.utl.pt [193.136.128.2])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5EBoci5030337
	for <linux-lvm@redhat.com>; Mon, 14 Jun 2004 07:50:39 -0400
Received: from ciistr3.ist.utl.pt (ciistr3.ist.utl.pt [193.136.128.3])
	by ciistr2.ist.utl.pt (Postfix) with ESMTP id E31E27E315
	for <linux-lvm@redhat.com>; Mon, 14 Jun 2004 12:50:37 +0100 (WEST)
Received: from localhost (localhost [127.0.0.1])
	by ciistr3.ist.utl.pt (Postfix) with ESMTP id BA39E3308CD
	for <linux-lvm@redhat.com>; Mon, 14 Jun 2004 12:50:37 +0100 (WEST)
Received: from ciistr3.ist.utl.pt ([127.0.0.1])
	by localhost (ciistr3 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 12099-07 for <linux-lvm@redhat.com>;
	Mon, 14 Jun 2004 12:50:37 +0100 (WEST)
Received: from mail.ist.utl.pt (mail.ist.utl.pt [193.136.128.8])
	by ciistr3.ist.utl.pt (Postfix) with ESMTP id 752B4330626
	for <linux-lvm@redhat.com>; Mon, 14 Jun 2004 12:50:37 +0100 (WEST)
Message-ID: <40CD910A.9040605@ist.utl.pt>
Date: Mon, 14 Jun 2004 12:50:34 +0100
From: "=?ISO-8859-1?Q?Miguel_Cabe=E7a?=" <cabeca@ist.utl.pt>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 seems to chop performance by 33%
References: <40C86F52.4090500@dgreaves.com>
In-Reply-To: <40C86F52.4090500@dgreaves.com>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

> I didn't think lvm2 had such a big performance hit?
>
> 65Mb/s on the raid5 device
> 44Mb/s on the lv
>
Did you try to ajust the read ahead with blockdev on the LV itself?

# blockdev --setra XXXX /dev/sda  (raid5 device, just for comparisson)
# blockdev --setra XXXX /dev/vg/lv (lv)

Try some values for the readahead. On my system I use 2048.

Best regards

Miguel Cabe=EF=BF=BDa
