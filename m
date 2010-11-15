Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAFI8VZa016614
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 13:08:31 -0500
Received: from q7.q7.com (q7.q7.com [69.168.48.248])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFI8Gcn018576
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 13:08:17 -0500
Received: from charon.spiretech.com (charon.spiretech.com [69.168.63.193])
	(authenticated bits=0)
	by q7.q7.com (8.13.8/8.13.8) with ESMTP id oAFI8CWD022515
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 10:08:16 -0800
Message-ID: <4CE1770B.8000007@q7.com>
Date: Mon, 15 Nov 2010 10:08:11 -0800
From: Joe Pruett <joey@q7.com>
MIME-Version: 1.0
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>	<4CDDBF95.9040104@q7.com>
	<4CDDCF7E.4070006@q7.com>	<AANLkTik5soU2jrS+MpDbAO6PBTEw-Qy-gtUiiyrXkEgs@mail.gmail.com>	<4CDDE2CE.90907@bmsi.com>
	<AANLkTimzHm_zhG97cpCnnAO_mTDzEnftDGB=OQ8G-417@mail.gmail.com>
In-Reply-To: <AANLkTimzHm_zhG97cpCnnAO_mTDzEnftDGB=OQ8G-417@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


>> BTW, rewriting that 1G file would be normal speed, since
>> the modified chunks have already been copied to the snapshot.
> i'd think that, and you'd think that, but it is not the case.  most of
> my tests were done by rewriting the file 4x, and while the snap %used
> (monitored with the 'lvs' command) doesn't keep going up, performance
> stays the same.
>
i did similar tests and i saw that even though i was rewriting the file,
it appeared that the ext3 layer was reallocating new blocks.  the
snapshot usage would increase to show 3x the number of blocks i had
thought it should have touched, and then it seemed to stay stable.  this
is one of the problems with a block level (as opposed to file level)
snapshot.
