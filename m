Message-Id: <200003150122.CAA15305@e35.marxmeier.com>
Subject: Re: [linux-lvm] LVM 0.8final and 2.3.51
Date: Wed, 15 Mar 2000 2:22:14 MEZ
In-Reply-To: <Pine.OSF.4.21.0003141454010.2523-100000@lazy.accessus.net>; from "Jay Weber" at Mar 14, 100 2:55 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jay@lazy.accessus.net
Cc: linux-lvm@msede.com

> 
> Has anybody successfully gotten LVM 0.8final working with 2.3.51 yet.
> Using Mylex DAC960 raid controller in this case here.  Also, Reiserfs is
> now available for 2.3.51, maybe we can get an LVM patch for 2.3.51? :)

I tried the patch-2.3.49-LVM-0.8final.gz against the 2.3.51 kernel.
Applied cleanly with only minor warnings (so i did not care to make
a separate patch against 2.3.51). The patched kernel compiled without
a problem. Due to lack of time i did not test it yet.


Hope this helps
Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
