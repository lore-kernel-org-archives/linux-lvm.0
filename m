From: "Stephen C. Tweedie" <sct@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14328.33999.21844.718869@dukat.scot.redhat.com>
Date: Mon, 4 Oct 1999 11:43:27 +0100 (BST)
Subject: Re: [linux-lvm] LVM, raw-io, devfs
In-Reply-To: <19991003075644.A5224@ladystrange.bluehorizon.nl>
References: <006201bf0bb7$6eae4a60$030116ac@fd1>
	<14324.58266.920834.895229@dukat.scot.redhat.com>
	<002e01bf0cf8$b4667720$030116ac@fd1>
	<19991003075644.A5224@ladystrange.bluehorizon.nl>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: pamvdam@ramoth.xs4all.nl
Cc: Fernando Dammous <ferdam@internetcom.com.br>, "Stephen C. Tweedie" <sct@redhat.com>, Linux LVM msede <linux-lvm@msede.com>

Hi,

On Sun, 3 Oct 1999 07:56:44 +0200, pamvdam@ramoth.xs4all.nl said:

> Oracle has always been using filesystems for it's datastorage. Only for
> the parrallel server configuration they demand RAW IO. Like Sybase 11.9.x
> under Linux it probably uses some O_SYNC flag to write to log, so the
> write call only returns when the data has been really written to the
> physical device. I don't think you'll see a performance enhancement when
> using Oracle and RAW/IO. There's even a chance, due to the fact you mis
> the buffer cache optimisations, that you'll see a performance
> degradation.

It depends.  Raw IO uses less CPU --- much less in some cases.  It also
avoids polluting memory with extra copies of data in the buffer cache.
As a result, just measuring the pure disk bandwidth of raw IO versus
buffered IO does not tell you the whole story about performance: you
really need to measure the application's performance itself, including
the effect of CPU and memory pressure.

--Stephen
