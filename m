From: pamvdam@ramoth.xs4all.nl
Date: Sun, 3 Oct 1999 07:56:44 +0200
Subject: Re: [linux-lvm] LVM, raw-io, devfs
Message-ID: <19991003075644.A5224@ladystrange.bluehorizon.nl>
References: <006201bf0bb7$6eae4a60$030116ac@fd1> <14324.58266.920834.895229@dukat.scot.redhat.com> <002e01bf0cf8$b4667720$030116ac@fd1>
Mime-Version: 1.0
In-Reply-To: <002e01bf0cf8$b4667720$030116ac@fd1>; from Fernando Dammous on Sat, Oct 02, 1999 at 02:08:09PM -0300
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fernando Dammous <ferdam@internetcom.com.br>
Cc: "Stephen C. Tweedie" <sct@redhat.com>, Linux LVM msede <linux-lvm@msede.com>

On Sat, Oct 02, 1999 at 02:08:09PM -0300, Fernando Dammous wrote:
<stuff deleted>

> I prefer to update my kernel (to 2.3.18 or even to wait for the 2.4), before
> and then to use RAW-IO.
> I just hope I can simply alter Oracle to use RAW-IO instead of having
> reinstall it.
> Using Oracle with LVM is already very good, with RAW-IO it will be better (I
> believe).

I do question that. Sybase somehow needs (or better prefers) RAW-IO to ensure
it's structural integrity. If the buffer cache is between the data transfer
of the LOG and the physical device it is possible that not all of the log
that should be written out is written out, however Sybase thinks it has been
written to disk. RAW-IO/direct IO ensures that the LOG that has been ordered
to be written on disk will be written to disk. I would like to emphasize
that not using RAW-IO will not impose corrupting your database. It imposes
that there's a risk of loosing your data in case of a failure.

Oracle has always been using filesystems for it's datastorage. Only for
the parrallel server configuration they demand RAW IO. Like Sybase 11.9.x
under Linux it probably uses some O_SYNC flag to write to log, so the
write call only returns when the data has been really written to the
physical device. I don't think you'll see a performance enhancement when
using Oracle and RAW/IO. There's even a chance, due to the fact you mis
the buffer cache optimisations, that you'll see a performance degradation.

This is a common misunderstanding.

Best regards,

	Pascal van Dam



> In any way, I thank in advance for your interest (and of all people of here)
> in helping me in this case.
> 
> Thank you very much
> 
> Fernando
> 
> 
