Date: Sat, 10 Jul 2010 22:50:17 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100710215017.GB26290@agk-dp.fab.redhat.com>
References: <AANLkTilHHV9DOCDeeqREaGdYqVVaLcOt5V7i9CQGlX8M@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTilHHV9DOCDeeqREaGdYqVVaLcOt5V7i9CQGlX8M@mail.gmail.com>
Subject: Re: [linux-lvm] LVM2 mirror segment monitoring function failed
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
To: grzegorz.wierzowiecki+lvm2@gmail.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Don't start dmeventd till later.

Look at a recent version of Fedora to see how to do it.

Add the --sysinit option for initial activation.

After pivotroot and when the filesystems are all up, then use --monitor y.

Alasdair
