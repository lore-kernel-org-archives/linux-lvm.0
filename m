Subject: Re: [linux-lvm] using previously created lvm
References: <000401c03a8e$4861a620$a200a8c0@babbage.siliconinfusion.com>
	<20001020154123.A10018@colombina.comedia.it>
	<yq1puku53kx.fsf@jaguar.mkp.net>
	<20001022160940.B24630@colombina.comedia.it>
From: "Martin K. Petersen" <mkp@linuxcare.com>
Date: 23 Oct 2000 09:03:10 -0400
In-Reply-To: Luca Berra's message of "Sun, 22 Oct 2000 16:09:40 +0200"
Message-ID: <yq1og0b90c1.fsf@jaguar.mkp.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bluca@comedia.it
Cc: linux-lvm@msede.com

>>>>> "Luca" == Luca Berra <bluca@comedia.it> writes:

>> Actually, I implemented HFS support in Linux ufs when we started
>> the PA-RISC port.  It's been included in the 2.[34] kernels for
>> quite a while now...

Luca> Another well hidden secret :( it is not documented anywhere
Luca> except in /usr/src/linux/fs/ufs/super.c, besides as of
Luca> 2.4.0-test8 it seems read-only.

Yes, it's read-only -- I only cared about being able to read a Linux
kernel off an HP/UX partition.

Feel free to hack on it...

-- 
Martin K. Petersen      Cereal Bowl Engineer, Linuxcare, Inc.
http://mkp.net/         SGI XFS, Linux/PA-RISC, GNOME
