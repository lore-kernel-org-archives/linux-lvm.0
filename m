Date: Tue, 30 Jun 2009 12:18:32 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] S.I. and consistent units
Message-ID: <20090630111832.GB20848@agk-dp.fab.redhat.com>
References: <4A46366C.2000607@impulze.org> <4A47F129.7040701@impulze.org>
	<20090629055011.GA14031@maude.comedia.it>
	<4A48880E.3060703@impulze.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A48880E.3060703@impulze.org>
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
Content-Transfer-Encoding: 7bit
To: Daniel Mierswa <impulze@impulze.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Firstly, any *functional* changes in the patch need to be identified:
If, given identical data, any code reads in or writes out a different number as
a result of the patch we need to consider implications carefully and
document that change in release notes.

Secondly, in the man pages, where we list the units, it would be helpful to
add a sentence each time to explain the difference between MB and MiB, in
terms of multiples of 1000 vs multiples of 1024.

Perhaps lvm.8 could have a paragraph about how LVM2 uses units
throughout incl.  an external reference to something like
http://physics.nist.gov/cuu/Units/binary.html (or the original standard
if you can track that down).

Alasdair
