Date: Thu, 2 Aug 2012 02:50:17 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120802015017.GH11876@agk-dp.fab.redhat.com>
References: <1912398.2IYGSI2Xbi@bursa22>
	<20120801122413.GF11876@agk-dp.fab.redhat.com>
	<2392219.d0OTJVWRfz@bursa22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2392219.d0OTJVWRfz@bursa22>
Subject: Re: [linux-lvm] [lvm2cmd] Heap destruction by lvm2_exit()?
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
To: Hubert Kario <hubert@kario.pl>
Cc: linux-lvm@redhat.com

Another factor might be different contents in your lvm.conf file compared with
mine, or different devices present causing you to hit a problem code path
and me not to.

Or some other difference in the distribution/compiler/libraries etc.

Alasdair
