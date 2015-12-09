MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <22120.22900.364905.238586@quad.stoffel.home>
Date: Wed, 9 Dec 2015 11:40:20 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <20151209162739.GR11127@agk-dp.fab.redhat.com>
References: <22120.21444.300955.356941@quad.stoffel.home>
	<20151209162739.GR11127@agk-dp.fab.redhat.com>
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
To: Alasdair G Kergon <agk@redhat.com>
Cc: dm-devel@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>


Alasdair> Have you tried '--manglename none' if you aren't using a
Alasdair> udev system that mangles names?  (Also available via
Alasdair> environmnet variable - see man page.)

That seems to be working, using the default Debbian Jessie lvm tools:

  dmsetup --manglename none status --target cache
  data-home: 0 1153433600 cache 8 2443/32768 128 54020/819200 80721
  350897 64427 66938 0 23882 1 1 writeback 2 migration_threshold 2048
  smq 0 rw -
  data-local: 0 702545920 cache 8 2443/32768 128 1078/819200 6268 85795
  1492 2715 0 1057 0 1 writeback 2 migration_threshold 2048 smq 0 rw -


So now I can try to monitor my cache usage.

So the question still remains, what is the long term fix so I don't
have to deal with this breakage by default?  Do I have bad UUIDS on my
volumes?

John
