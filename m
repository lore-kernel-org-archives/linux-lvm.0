Date: Sat, 17 Apr 1999 15:44:17 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] SYLOG MESSAGES
Message-ID: <19990417154417.A18225@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <000d01be889c$1a9f8450$1401a6c0@aloha.lc.ca.org>
Mime-Version: 1.0
In-Reply-To: <000d01be889c$1a9f8450$1401a6c0@aloha.lc.ca.org>; from parkercj on Fri, Apr 16, 1999 at 11:32:43PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: parkercj <cparker1@pacbell.net>
Cc: linux-lvm@msede.com

On Fri, Apr 16, 1999 at 11:32:43PM -0700, parkercj wrote:

<snip>
> Apr 16 23:16:11 sabrina modprobe: can't locate module block-major-33
> Apr 16 23:16:11 sabrina last message repeated 5 times
> Apr 16 23:16:11 sabrina modprobe: can't locate module block-major-34
> Apr 16 23:16:11 sabrina last message repeated 5 times
> Apr 16 23:16:11 sabrina modprobe: can't locate module block-major-9
> Apr 16 23:16:12 sabrina last message repeated 9 times
> Apr 16 23:16:12 sabrina modprobe: can't locate module block-major-8
> 
<snip>
> 
> Any ideas???
> 
yes, put:
alias block-major-33 off
alias block-major-34 off
alias block-major-9 off
alias block-major-8 off
in /etc/conf.modules

L.

-- 
Luca Berra -- bluca@comedia.it
