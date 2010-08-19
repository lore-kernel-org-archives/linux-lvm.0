Date: Thu, 19 Aug 2010 15:10:49 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100819141049.GP11907@agk-dp.fab.redhat.com>
References: <819282.26459.qm@web53402.mail.re2.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <819282.26459.qm@web53402.mail.re2.yahoo.com>
Subject: Re: [linux-lvm] vgs adds to .cache but doesn't remove
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
To: Tom Graves <tgraves_cs@yahoo.com>
Cc: linux-lvm@redhat.com

On Thu, Aug 19, 2010 at 06:52:49AM -0700, Tom Graves wrote:
> I am having an issue where it seems that the vgs  command is adding new LV's to 
> the  /etc/lvm/cache/.cache but they never  get removed when the LV's are 
> deleted.   
 
This might be a bug we fixed in 2.02.67.

Alasdair
