Date: Tue, 29 Oct 2019 14:41:28 +0000
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20191029144128.p6yc73a4dflol4wn@reti>
References: <ae72bf0f-2776-0bdc-7e4a-dc229cac481a@suse.com>
	<20191023213101.gpkorwubuobm5w5y@reti>
	<a3738d0e-cfba-af45-afd2-a08ca1819c83@suse.com>
	<20191028154313.ibspu6qwqqsq54cc@reti>
	<324885c4-a211-fb11-8315-979935391820@suse.com>
	<95f338d2-5855-5ce5-f0ce-c0f6b648e794@suse.com>
	<20191029110508.rlgepokvu2vgmbvm@reti>
	<1d119762-597f-bd3e-645b-2ca2234b20e9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d119762-597f-bd3e-645b-2ca2234b20e9@suse.com>
Subject: Re: [linux-lvm] resend patch - bcache may mistakenly write data to
 another disk when writes error
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
To: Heming Zhao <heming.zhao@suse.com>
Cc: David Teigland <teigland@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Oct 29, 2019 at 11:47:19AM +0000, Heming Zhao wrote:
> You are right. I forgot the radix_tree_remove_prefix().
> The radix_tree_remove_prefix() is called both bcache_invalidate_fd & bcache_abort_fd.
> So the job will not work as expected in bcache_abort_fd, because the node is already removed.
> Please correct me if my thinking is wrong.

Slightly wrong, the remove_prefix in invalidate should only be running if it.success is true.
Well spotted.

- Joe
