Date: Wed, 30 Jan 2013 02:55:20 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130130025520.GB868@agk-dp.fab.redhat.com>
References: <51082839.5080400@barfooze.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51082839.5080400@barfooze.de>
Subject: Re: [linux-lvm] lvm2 portability issues (GNU sed is assumed)
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
To: John Spencer <maillist-lvm@barfooze.de>
Cc: linux-lvm@redhat.com

On Tue, Jan 29, 2013 at 08:51:21PM +0100, John Spencer wrote:
> may i ask kindly to reformulate that statement so that it works with  
> posix sed (as used in busybox 1.20.2) ?

I'm perfectly happy using modern extensions to these tools:)

If you want this to work with alternative versions, please send a tested
patch for us to incorporate.  (Either modifications to the commands so
it works with both or else alternative versions which configure chooses
between.)

Alasdair
