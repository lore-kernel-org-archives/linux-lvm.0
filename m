Resent-Message-Id: <200005181913.VAA17804@e35.marxmeier.com>
Resent-To: linux-lvm
Date: Thu, 18 May 2000 17:35:02 +0100 (IST)
From: Paul Jakma <paulj@itg.ie>
Subject: Re: [linux-lvm] reproducible segfault in vgscan (fwd)
Message-ID: <Pine.LNX.4.21.0005181726000.1456-100000@rossi.itg.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Marxmeier <mike@msede.com>

michael, 

i've just downloaded the lvm 0.8final tools, and tried your suggestion: i
changed the +2 in malloc(..) to +3.

and vgscan now works everytime! 

Thanks!

--paul jakma.

---------- Forwarded message ----------
Date: Thu, 11 May 2000 01:39:12 +0200
Resent-Date: Thu, 18 May 2000 21:13:06 MESZ
From: Michael Marxmeier <mike@msede.com>
To: Paul Jakma <paul@clubi.ie>
Cc: Heinz Mauelshagen <mge@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] reproducible segfault in vgscan (fwd)

Paul, just a thought ...

<22> vg_check_name -- LEAVING with ret: 0
<22> lvm_remove_recursive -- CALLED with dir: /dev/Main_VG

This looks like a bug in lvm_remove_recursive() (tools/lib/...)
A short look reveales the following suspicious code
sequence around line 71:

               if ( ( file_name = malloc ( strlen (dir) +
                                           strlen (dir_ent->d_name) +
                                           2)) == NULL) {
                  ret = -LVM_EREMOVE_RECURSIVE_MALLOC;
                  goto lvm_remove_recursive_end;
               }
               sprintf ( file_name, "%s/%s%c", dir, dir_ent->d_name,
0);

AFAICS this could write a byte beyound file_name, depending
on file name length (due to malloc alignment).

Try to replace the sprintf() with:

sprintf ( file_name, "%s/%s", dir, dir_ent->d_name);

or make the +2 a +3 in the malloc call.


Hoipe this helps
Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
