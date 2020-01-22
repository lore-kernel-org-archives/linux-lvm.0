Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D6A42026D67
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 15:40:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 937D28012CF
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 15:40:27 +0000 (UTC)
From: Michael Lipp <mnl@mnl.de>
Message-ID: <5f84e991-7740-a5c1-300a-682fb46237c7@mnl.de>
Date: Wed, 22 Jan 2020 16:40:23 +0100
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Deeply impressed
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Just for once, I wanted to state that I am deeply impressed by the work
done with LVM. I have just just copied all my data from my old RAID to
my new RAID while continuing to work with the data using pvmove.
Compared with what I had to do several years ago, this was a great
experience. I know, of course, that professional operators do this "all
day", but doing it yourself for once felt great.

Just one question, though. I couldn't find anything about using pvmove
together with lvm cache. So to make sure, I removed the SSD caching
before pvmove and added the caching again afterwards. Would it have been
safe to leave the caching active during the pvmove?

=C2=A0- Michael
