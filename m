From: "Stephen C. Tweedie" <sct@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14514.52338.134386.993962@dukat.scot.redhat.com>
Date: Tue, 22 Feb 2000 17:50:42 +0000 (GMT)
Subject: Re: [linux-lvm] Can we make char files not blocked for the volumes
In-Reply-To: <38B1BFF2.769DED19@alwan.com>
References: <200002191235.NAA27590@u9etz.164.27.16.48>
	<38AE95CD.915AC596@alwan.com>
	<14513.48287.977291.125248@dukat.scot.redhat.com>
	<38B1BFF2.769DED19@alwan.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Anderson <chris@alwan.com>
Cc: "Stephen C. Tweedie" <sct@redhat.com>, "linux-lvm@msede.com" <linux-lvm@msede.com>

Hi,

On Mon, 21 Feb 2000 16:45:06 -0600, Chris Anderson <chris@alwan.com>
said:

>  It is odd how it is used.  I had to hack it into 2.2.14, but go it working.
> I think the "raw" command is odd, also it needs to be run every time you
> reboot.  

Indeed --- the raw interfaces need to be bound to specific devices just
as eth* network interface names need to be bound to addresses.

> Also who is the owner of this code. How does it find its way into
> the standard 2.3 and lvm has not yet?  That is odd too.

lvm just took a little longer --- they are both in 2.3 now.

> My test with Informix IDS 7.3 for linux showed that the raw io is twice as
> slow.  A 17 mins load under block device using lvm but took 31mins for the
> raw linked version.  I will be testing the Informix 9.2 version
> tonight. 

Raw IO does not do any caching in the O/S.  Specifically, it doesn't
perform any readahead or writebehind.  If the application was using
that implicit caching then raw IO will necessarily be slower.

--Stephen
