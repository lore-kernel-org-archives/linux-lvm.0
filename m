Date: Sat, 9 Jun 2012 13:28:11 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120609122810.GG15806@agk-dp.fab.redhat.com>
References: <20120609002308.GD15806@agk-dp.fab.redhat.com>
	<4FD30CF2.8060505@redhat.com>
	<CAFJqGkPHjaCXPq4zYxHp_koMwxbku0w=1W0wNznM_nEnpGaUGg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFJqGkPHjaCXPq4zYxHp_koMwxbku0w=1W0wNznM_nEnpGaUGg@mail.gmail.com>
Subject: Re: [linux-lvm] LVM release 2.02.96 / git / veritysetup
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
To: Somchai Smythe <buraphalinuxserver@gmail.com>
Cc: dm-devel@redhat.com, lvm-devel@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Jun 09, 2012 at 06:00:42PM +0700, Somchai Smythe wrote:
> Do not package LVM release 2.02.96 at all, or just the verity stuff?
 
Just veritysetup - its interfaces/formats are still being changed
(within userspace - no interface changes are planned on the kernel side)
and the new version will not be backwards-compatible.

Alasdair
