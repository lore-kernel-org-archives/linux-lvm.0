From: "Stephen C. Tweedie" <sct@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14513.48287.977291.125248@dukat.scot.redhat.com>
Date: Mon, 21 Feb 2000 22:30:55 +0000 (GMT)
Subject: Re: [linux-lvm] Can we make char files not blocked for the volumes
In-Reply-To: <38AE95CD.915AC596@alwan.com>
References: <200002191235.NAA27590@u9etz.164.27.16.48>
	<38AE95CD.915AC596@alwan.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Anderson <chris@alwan.com>
Cc: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>, "linux-lvm@msede.com" <linux-lvm@msede.com>, Stephen Tweedie <sct@redhat.com>

Hi,

On Sat, 19 Feb 2000 07:08:29 -0600, Chris Anderson <chris@alwan.com> said:

> Heinz Mauelshagen wrote:
>> Please have a look at the rawio support for Linux.

> Where can I find this?  In the kernel?  Any help would be great.

2.3 has it, and there are 2.2 patches on 

ftp://ftp.uk.linux.org/pub/linux/sct/fs/raw-io

It comes with all recent Red Hat and SuSE distributions as standard,
btw.  I'm not sure about other distributions (anyone know?)

--Stephen
