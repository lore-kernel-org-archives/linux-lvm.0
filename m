Message-ID: <38C4E15F.CB60403E@netconnect.com.au>
Date: Tue, 07 Mar 2000 11:00:47 +0000
From: bug1 <bug1@netconnect.com.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] strip lvmcreate_initrd fails
References: <38C4886B.B98FDDE6@netconnect.com.au> <38C4B6E7.C8E1DFC3@ep-ag.com>
Content-Type: multipart/mixed;
 boundary="------------3FB8F3E568EFB8697C33E0EE"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Klaus Strebel <stb@ep-ag.com>
Cc: linux-lvm@msede.com

This is a multi-part message in MIME format.
--------------3FB8F3E568EFB8697C33E0EE
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi again, ive made this little patch that fixes what i saw as a problem.

I havent made many diff's before, let me know if i havent done it
correctly.

It just modifies the /LVM/0.8final/tools/Makefile so that install-bin
doesnt do an install -s on scripts.

Thanks

Glenn McGrath
--------------3FB8F3E568EFB8697C33E0EE
Content-Type: text/plain; charset=us-ascii;
 name="lvm-dont-strip-scripts"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lvm-dont-strip-scripts"


--------------3FB8F3E568EFB8697C33E0EE--
