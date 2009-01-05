Received: from [10.32.10.113] (vpn-10-113.str.redhat.com [10.32.10.113])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n05KENgp012025
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 15:14:23 -0500
Message-ID: <49626A2A.80709@redhat.com>
Date: Mon, 05 Jan 2009 21:14:34 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 on-disk layout
References: <ffa0f8300901050222y2083fbb1pbbc4bdb5c10aeb5a@mail.gmail.com>
In-Reply-To: <ffa0f8300901050222y2083fbb1pbbc4bdb5c10aeb5a@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Tejas Sumant wrote:
> 3) Why the metadata inside MDA wraps around, instead of the offset
> pointing to the start of metadata?

Metadata updates run in two steps:

- write() saves the new metadata to new place (circular buffer)
but still keeping previous version active.
(Also operation can be safely reverted here, because there
are still old version of metadata prepared.)

- commit() switch the pointer to new offset and activate
new metadata. This operation is atomic (one synchronous sector write)
so it cannot corrupt active metadata copy.
(If the write fails, old metadata are still valid.)

(Imagine for example power failure during metadata write operation.)

There is serial number in metadata, lvm will update mda content to newest
metadata if any copies are older.


Milan
--
mbroz@redhat.com
