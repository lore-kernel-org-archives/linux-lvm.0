Received: from [10.34.131.133] (dhcp131-133.brq.redhat.com [10.34.131.133])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rA6FkNcH004805
	for <linux-lvm@redhat.com>; Wed, 6 Nov 2013 10:46:23 -0500
Message-ID: <527A644D.50406@redhat.com>
Date: Wed, 06 Nov 2013 16:46:21 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <2368A3FCF9F7214298E53C823B0A48EC0B012F@AMSPEX01CL02.citrite.net>
In-Reply-To: <2368A3FCF9F7214298E53C823B0A48EC0B012F@AMSPEX01CL02.citrite.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] maximum length of logical volume name
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

Dne 6.11.2013 16:04, Thanos Makatos napsal(a):
> It seems that the maximum name length of a logical volume is 127 bytes (discovered by trial and error). Just to make sure we're using the correct value, is this value documented somewhere? Is it possible to retrieve it at run-time?
>
> --


Hmm it's not documented in manpages - but there are some header file defines:

lvm-string.h NAME_LEN and dm-ioctl.h DM_NAME_LEN being 128char with '\0' included.

other limits are in  'man lvm'  VALID NAMES sections.


There are no plans to change this hardcoded settings - thus no reason to put 
in run-time function to obtain its value.

I guess the size for lvm name is also limited by vgname size - since together 
with '-' it cannot be longer then 127 chars (max dm device name size)


Zdenek
