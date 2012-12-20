Date: Thu, 20 Dec 2012 15:11:06 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20121220151106.GB11558@agk-dp.fab.redhat.com>
References: <50D32703.70307@avature.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50D32703.70307@avature.net>
Subject: Re: [linux-lvm] Problems with snapshot rollback
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
To: Guillermo Schulman <guillermos@avature.net>
Cc: linux-lvm@redhat.com

If you *intend* to rollback, have you considered doing the test in
the snapshot itself (which can be written to) and not bothering
with a later merge?

But for any unpredictable problems with devices, first thing to rule out is
unintended interference from udev.

Alasdair
