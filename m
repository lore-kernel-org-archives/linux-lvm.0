Date: Wed, 22 Jan 2020 11:01:43 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200122160142.GA20728@redhat.com>
References: <5f84e991-7740-a5c1-300a-682fb46237c7@mnl.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f84e991-7740-a5c1-300a-682fb46237c7@mnl.de>
Subject: Re: [linux-lvm] Deeply impressed
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
To: Michael Lipp <mnl@mnl.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jan 22 2020 at 10:40am -0500,
Michael Lipp <mnl@mnl.de> wrote:

> Just for once, I wanted to state that I am deeply impressed by the work
> done with LVM. I have just just copied all my data from my old RAID to
> my new RAID while continuing to work with the data using pvmove.
> Compared with what I had to do several years ago, this was a great
> experience. I know, of course, that professional operators do this "all
> day", but doing it yourself for once felt great.
> 
> Just one question, though. I couldn't find anything about using pvmove
> together with lvm cache. So to make sure, I removed the SSD caching
> before pvmove and added the caching again afterwards. Would it have been
> safe to leave the caching active during the pvmove?

No, fairly certain pvmove wouldn't have allowed the caching layer.  So
you did the correct sequence.
