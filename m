Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0CBLL0N024087
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2009 06:21:22 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n0CBLKrW003920
	for <linux-lvm@redhat.com>; Mon, 12 Jan 2009 06:21:20 -0500
Message-ID: <496B278B.8090603@redhat.com>
Date: Mon, 12 Jan 2009 11:20:43 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Strange PV metadata issue
References: <496A8D96.9030209@alexbrett.net> <496B0E34.8080404@alexbrett.net>
In-Reply-To: <496B0E34.8080404@alexbrett.net>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Alex Brett wrote:
> For anybody interested - I managed to fix this by forcing the pvcreate
> with -ff, specifying only 1 metadata copy (not sure if I needed this bit
> or not) and then a vgcfgrestore did the trick - all seems happy now :)

The same situation/recovery steps were discussed on the list last week:

https://www.redhat.com/archives/linux-lvm/2009-January/msg00014.html

Bryn.
