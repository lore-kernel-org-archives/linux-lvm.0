Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6M71a8c010831
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2011 03:01:36 -0400
Received: from seldrel01.sonyericsson.com (seldrel01.sonyericsson.com
	[212.209.106.2])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6M71Yi4027615
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2011 03:01:35 -0400
From: "Assarsson, Emil" <Emil.Assarsson@sonyericsson.com>
Date: Fri, 22 Jul 2011 09:01:33 +0200
Message-ID: <2BF070A7A2375D46BA1B6087F8D5DCB67E864BF903@seldmbx01.corpusers.net>
References: <2BF070A7A2375D46BA1B6087F8D5DCB67E864BF902@seldmbx01.corpusers.net>
	<b0fec5b3-201a-4072-bff3-1959ae76dc5a@email.android.com>
In-Reply-To: <b0fec5b3-201a-4072-bff3-1959ae76dc5a@email.android.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] How to resize a logical volume with snapshots?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> >>From my understanding the snapshot need to be able to contain all
> >changed blocks so additional blocks in a resize need to be copied into
> >the snapshot volume. Or am I wrong?
> 
> Yes, you are. Adding extents doesn't write anything to them.

I'm Happy to be wrong :-D
Thank you for the quick answer.

--
Emil Assarsson
