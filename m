Message-ID: <3780FC76.FB361567@msede.com>
Date: Mon, 05 Jul 1999 20:41:58 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] another invalid i/o ... error
References: <199907052021.QAA09282@gate.penguinpowered.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: root@gate.penguinpowered.com
Cc: galtons@thegeek.org, linux-lvm@msede.com

Hello Simon.

[snip]
> But running vgscan results in the oft-reported error:
> [root@gate 0.6]# vgscan
> vgscan -- invalid i/o protocol version
> 
> So, Here's the end of an strace vgscan, note the open of "di2", whatever
> that is.  After scratching my head for a few days, I made a device file 
> in the current directory  (mknod di2 c 109 0) and re-ran vgscan -- got
> another odd error.  

Strange.  Please run a vgscan -d and send me the output. This will 
provide a function trace of the operations so it should be obvious 
(with the strace) where it fails.

In addition please send me the complete strace (w/o creating the
"di2")
and i'll have a look at it.


Hope that helps
Michael

-- 
Michael Marxmeier           Marxmeier Software GmbH
E-Mail: mike@msede.com      Besenbruchstrasse 9
Voice : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
