Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB7Gx2r08703
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2004 11:59:02 -0500
Received: from ms-smtp-05-eri0.texas.rr.com (ms-smtp-05.texas.rr.com
	[24.93.47.44])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iB7GwuWK014292
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2004 11:58:56 -0500
Subject: Re: [linux-lvm] Can't access LVM volume group after changing a
	non-LVM partition
From: David Mohr <damailings@mcbf.net>
In-Reply-To: <b9a453c204120705542e927fac@mail.gmail.com>
References: <b9a453c204120705542e927fac@mail.gmail.com>
Date: Tue, 07 Dec 2004 10:58:45 -0600
Message-Id: <1102438725.2526.8.camel@adler>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-1?Q?=D2scar_=C1lvarez?= Vilaplana <grimborg@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>


On Tue, 2004-12-07 at 14:54 +0100, �scar �lvarez Vilaplana wrote:
--- skip ---
> I thought maybe changing the uuid for /dev/hda7 in the /etc/lvm files,
> but I couldn't find how to get the correct uuid for /dev/hda7.

Use:
pvdisplay /dev/hda7

I don't know either how this could have happened though...

~David
