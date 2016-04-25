Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3PGC4lF032699
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 12:12:05 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1auj7E-0004RJ-8F
	for linux-lvm@redhat.com; Mon, 25 Apr 2016 17:12:04 +0100
Date: Mon, 25 Apr 2016 17:12:04 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20160425161204.GA16834@agk-dp.fab.redhat.com>
References: <CALm7yL33yCtUDA4g8_F0mrrbt5kJ6UqRbK_By2BUBVNii4+A-Q@mail.gmail.com>
	<87e5bd8183d08066ac92c280c2efa632@dds.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87e5bd8183d08066ac92c280c2efa632@dds.nl>
Subject: Re: [linux-lvm] No way to waive "WARNING: Sum of all thin
	volumes	sizes ..." concern, causes need to script around this?
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

There's no motivation given in the commit message, but obviously that
message should only be appearing for novices, not knowledgeable users.
A config option might be the answer.

Alasdair
