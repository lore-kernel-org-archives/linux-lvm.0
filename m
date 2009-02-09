Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n19CVMi5027620
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 07:31:22 -0500
Received: from service2.sh.cvut.cz (service2.sh.cvut.cz [147.32.127.218])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n19CUu9q011678
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2009 07:30:56 -0500
Received: from localhost (localhost [127.0.0.1])
	by service2.sh.cvut.cz (Postfix) with ESMTP id 563CD138735
	for <linux-lvm@redhat.com>; Mon,  9 Feb 2009 13:30:55 +0100 (CET)
Received: from service2.sh.cvut.cz ([127.0.0.1])
	by localhost (service2.sh.cvut.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08134-06 for <linux-lvm@redhat.com>;
	Mon, 9 Feb 2009 13:30:47 +0100 (CET)
Received: from hondza.sh.cvut.cz (hondza.sh.cvut.cz [147.32.120.36])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by service2.sh.cvut.cz (Postfix) with ESMTP id D58CC138737
	for <linux-lvm@redhat.com>; Mon,  9 Feb 2009 13:30:47 +0100 (CET)
Date: Mon, 9 Feb 2009 13:30:47 +0100
From: hondza <mbdrzq8jm1wljrwyo1sk@gmail.com>
Message-ID: <20090209123047.GH3702@hondza.sh.cvut.cz>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] dm-merge: userspace tool to merge copy-on-write
	exception table
Reply-To: mbdrzq8jm1wljrwyo1sk@gmail.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello.

Back in 2008 there was a thread about merging/reverting snapshots
(http://article.gmane.org/gmane.linux.lvm.general/9899). 

I liked the idea very much so I made a simple C tool to do so. Thanks to
Lars for describing how it works.

"Project" overview: http://repo.or.cz/w/dm-merge.git

Git repository: git://repo.or.cz/dm-merge.git

Tarball of the latest version: http://repo.or.cz/w/dm-merge.git?a=snapshot;h=HEAD;sf=tgz

Hopefully it'll be useful for someone. Works for me; but read the
README.

-- 
hondza | GPG key: http://www.hondza.adslink.cz/key.asc
Fingerprint: 31E7 EF56 7280 5C89 75E9 FF9D 010E 175F 7823 CF38
GPG/PGP encrypted/signed emails are welcome.
