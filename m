Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n06AmD4H031977
	for <linux-lvm@redhat.com>; Tue, 6 Jan 2009 05:48:13 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n06AmC01009687
	for <linux-lvm@redhat.com>; Tue, 6 Jan 2009 05:48:12 -0500
Message-ID: <496336BC.9090805@redhat.com>
Date: Tue, 06 Jan 2009 10:47:24 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 on-disk layout
References: <ffa0f8300901050222y2083fbb1pbbc4bdb5c10aeb5a@mail.gmail.com>
	<Pine.LNX.4.64.0901051346580.508@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0901051346580.508@bmsred.bmsi.com>
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

Stuart D. Gathman wrote:
>> 3) Why the metadata inside MDA wraps around, instead of the offset
>> pointing to the start of metadata?

It's a ring (circular) buffer.

Regards,
Bryn.
