Message-ID: <50E6BBCF.1000205@redhat.com>
Date: Fri, 04 Jan 2013 12:23:59 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <CABTYv7WQD4Ui29U655CCExDe+XXMCv01A52Yt-iZ0f0pDdw3Pg@mail.gmail.com>
In-Reply-To: <CABTYv7WQD4Ui29U655CCExDe+XXMCv01A52Yt-iZ0f0pDdw3Pg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot causing segault
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Tyler Gates <tyler.gates@ats.coop>

On 12/31/2012 07:50 PM, Tyler Gates wrote:
> Hello everyone,
> I've been having an intermittent problem on random servers
> segfaulting while trying to create a snapshot under version
> lvm2-2.02.17-7.38.3 on kernel 2.6.16.60-0.93.1-bigsmp (SLES 10 SP4).

This is almost surely kernel bug, not userspace one.

It is very old kernel, so hard to say exactly which patches are needed
but my guess is it is very similar to https://bugzilla.redhat.com/show_bug.cgi?id=360151
(note: fixed 2007!) with upstream patch
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=512875bd9661368da6f993205a61213b79ba1df0

(But there can more patches, this is really old and someone need
to do proper analysis what is going here.)

Milan
