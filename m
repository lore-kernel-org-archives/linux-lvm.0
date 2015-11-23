Date: Mon, 23 Nov 2015 10:55:15 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20151123155515.GA5148@redhat.com>
References: <5650F9FD.3020803@linbit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5650F9FD.3020803@linbit.com>
Subject: Re: [linux-lvm] Quick question regarding lvm-cache
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
To: Devin Vance <devin@linbit.com>
Cc: linux-lvm@redhat.com

On Sat, Nov 21 2015 at  6:10pm -0500,
Devin Vance <devin@linbit.com> wrote:

> Greetings,
> 
> Short version:
> 
> Is there anyway to adjust the cache blocksize of the lvm cache with
> the lvm tools?

Kind of amazing that the lvmcache man page doesn't touch on
this... there is an opportunity there ;)

Anyway, lvcreate's -c argument (aka chunksize) is re-used to specify a
different cache blocksize.
