From: "Stephen C. Tweedie" <sct@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14101.62291.86610.365426@dukat.scot.redhat.com>
Date: Thu, 15 Apr 1999 15:10:27 +0100 (BST)
Subject: Re: [linux-lvm] Swap/DB devices
In-Reply-To: <199904150815.AA02380@future-is.orange.co.uk>
References: <199904150815.AA02380@future-is.orange.co.uk>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Martyn.AYSHFORD@orange.co.uk
Cc: linux-lvm@msede.com, Stephen Tweedie <sct@redhat.com>

Hi,

On Thu, 15 Apr 1999 09:18:49 +0100, Martyn.AYSHFORD@orange.co.uk said:

> I'm in the process of re-jigging all the file systems to sit in volume
> groups.

> a) Can I setup swap to run from a volume group is it a good idea?

Should work OK.

> b) I have  database devices running in cooked file systems for Oracle,
> Sybase and Informix.

> Vendor recommendations for sybase and Informix are normally raw, here we
> carve our database devices from HP volume groups is this a good idea for
> linux?

We have raw IO under development: look on

	ftp://ftp.uk.linux.org/pub/linux/sct/fs

for my latest snapshots.  This should be usable by any of the
commercial databases, and we have Linus's approval in principle for
this mechanism of implementing the raw transfers.

--Stephen
