Date: Tue, 25 Jul 2017 12:46:18 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20170725114618.GC6611@nim>
References: <CAGqmV7oCXLyjio67mksc-rKrLQGvoyOeJfPH4T0or3STrbdbrA@mail.gmail.com>
	<20170724160720.GB19898@redhat.com>
	<CAGqmV7oMKUeRA1Rdg5WhXNwgndnoTZmxwgPQYC5c0KiUp5zDeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGqmV7oMKUeRA1Rdg5WhXNwgndnoTZmxwgPQYC5c0KiUp5zDeQ@mail.gmail.com>
Subject: Re: [linux-lvm] dm-cache size is limited by 946GB
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
Cc: Brice Barotin <brice.barotin@gmail.com>, Mike Snitzer <snitzer@redhat.com>

On Mon, Jul 24, 2017 at 11:12:38PM +0700, CoolCold wrote:
> Hello!
> I will try to check with 4.12 kernel, but doesn't it looks suspicious
> to you that 946GB works almost instantly, while 947GB and more do not
> at all? (waited 2.6TB for ~ 1.6 days and 3TB of data).

Yes it looks very suspicious.  I'll get round to checking it out this
week.

- Joe
