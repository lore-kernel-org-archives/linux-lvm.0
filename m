Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r16Cof1V001275
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 6 Feb 2013 07:50:43 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1U34SW-0002i2-G1
	for linux-lvm@redhat.com; Wed, 06 Feb 2013 12:50:40 +0000
Date: Wed, 6 Feb 2013 12:50:40 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130206125040.GA10407@agk-dp.fab.redhat.com>
References: <CAPhuxPsnfme0a=AeqAQ_CS0WNp9FEhE=5oXyO7A9iZHHpA+MdA@mail.gmail.com>
	<20130206122553.GA17944@soda.linbit>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20130206122553.GA17944@soda.linbit>
Subject: Re: [linux-lvm] LVM mirror logic bug?
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I forget whether this is a case that's meant to work yet or not.
If you can reproduce with the latest upstream code (and 
allocation/maximise_cling not set to 0 of course) post a link to the -vvvv
trace which shows exactly how it's doing the allocation.

Alasdair
