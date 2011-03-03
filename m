Message-ID: <4D6F6D8D.6010001@redhat.com>
Date: Thu, 03 Mar 2011 10:29:33 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <4D6EA3EF.1070401@bartk.us>
In-Reply-To: <4D6EA3EF.1070401@bartk.us>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Tracing IO requests?
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
Cc: Bart Kus <me@bartk.us>

On 03/02/2011 08:09 PM, Bart Kus wrote:
> Hello,
> 
> I have the following setup:
> 
> md_RAID6(10x2TB) -> LVM2 -> cryptsetup -> XFS
> 
> When copying data onto the target XFS, I notice a large number of READs 
> occurring on the physical hard drives.  Is there any way of monitoring 
> what might be causing these read ops?

The blktrace command is extremely useful for this kind of I/O tracing. I've used
it numerous times to figure out where I/O is originating and also how it's
making its way through layers of stacked devices.

There's a conference talk overview here from a few years ago:

http://www.gelato.org/pdf/apr2006/gelato_ICE06apr_blktrace_brunelle_hp.pdf

And also a user's guide:

http://www.cse.unsw.edu.au/~aaronc/iosched/doc/blktrace.html
http://pdfedit.petricek.net/bt/file_download.php?file_id=17&type=bug

Regards,
Bryn.
