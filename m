Date: Wed, 9 Dec 2015 16:27:40 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20151209162739.GR11127@agk-dp.fab.redhat.com>
References: <22120.21444.300955.356941@quad.stoffel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22120.21444.300955.356941@quad.stoffel.home>
Subject: Re: [linux-lvm] [dm-devel] fixing mangled UUIDs
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
To: John Stoffel <john@stoffel.org>
Cc: dm-devel@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Have you tried '--manglename none' if you aren't using a udev system that
mangles names?  (Also available via environmnet variable - see man page.)

Alasdair
