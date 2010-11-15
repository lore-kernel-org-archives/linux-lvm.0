Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAFIJNPI005887
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 13:19:23 -0500
Received: from mail-qy0-f174.google.com (mail-qy0-f174.google.com
	[209.85.216.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFIJ9GY016237
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 13:19:10 -0500
Received: by qyk12 with SMTP id 12so3762718qyk.12
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 10:19:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4CE1770B.8000007@q7.com>
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
	<4CDDBF95.9040104@q7.com> <4CDDCF7E.4070006@q7.com>
	<AANLkTik5soU2jrS+MpDbAO6PBTEw-Qy-gtUiiyrXkEgs@mail.gmail.com>
	<4CDDE2CE.90907@bmsi.com>
	<AANLkTimzHm_zhG97cpCnnAO_mTDzEnftDGB=OQ8G-417@mail.gmail.com>
	<4CE1770B.8000007@q7.com>
From: "chris (fool) mccraw" <gently@gmail.com>
Date: Mon, 15 Nov 2010 10:18:49 -0800
Message-ID: <AANLkTinkUaiFrOAr48JhJJaixGcpK0REmLXgK_t2Mb7D@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 15, 2010 at 10:08, Joe Pruett <joey@q7.com> wrote:
>
>>> BTW, rewriting that 1G file would be normal speed, since
>>> the modified chunks have already been copied to the snapshot.
>> i'd think that, and you'd think that, but it is not the case. �most of
>> my tests were done by rewriting the file 4x, and while the snap %used
>> (monitored with the 'lvs' command) doesn't keep going up, performance
>> stays the same.
>>
> i did similar tests and i saw that even though i was rewriting the file,
> it appeared that the ext3 layer was reallocating new blocks. �the
> snapshot usage would increase to show 3x the number of blocks i had
> thought it should have touched, and then it seemed to stay stable. �this
> is one of the problems with a block level (as opposed to file level)
> snapshot.

interestingly, xfs does not show the usage increase as sharply
(IIRC--i stopped checking that number after a few runs), but neither
is the performance better.
