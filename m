From: darren.miller@philips.com
Subject: Re: [linux-lvm] LVM2-Snapshot
MIME-Version: 1.0
Message-ID: <OF371654A3.D85D0CB1-ON80256E54.00407A3B-80256E54.00482C2A@philips.com>
Content-Type: multipart/alternative; boundary="=_alternative 00482C2580256E54_="
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Mar 11 08:06:03 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com
Cc: linux-lvm-admin@redhat.com

This is a multipart message in MIME format.
--=_alternative 00482C2580256E54_=
Content-Type: text/plain; charset="us-ascii"

>The snapshot target isn't in vanilla 2.6 yet, use my udm (unstable dm)
>tree if you want that functionality.
>
>http://people.sistina.com/~thornber/dm/
>
>I _hope_ to submit this to lkml within the next month.
>
>- Joe

Added patches 4, 5, 6, 7, 9, 10 & 11 compiles ok but

Patch 7 one hunk fails:

Hunk #6 FAILED at 911.
1 out of 6 hunks FAILED -- saving rejects to file drivers/md/dm.c.rej

Patch 9 one hunk fails:

Hunk #1 FAILED at 3.
1 out of 1 hunk FAILED -- saving rejects to file drivers/md/Makefile.rej

Patch 10 one hunk fails:

Hunk #1 FAILED at 3.
1 out of 1 hunk FAILED -- saving rejects to file drivers/md/Makefile.rej

Patch 11 two hunks fail:

Hunk #1 FAILED at 5.
Hunk #2 FAILED at 27.
2 out of 2 hunks FAILED -- saving rejects to file drivers/md/Makefile.rej

Adding patch 2 killed it completely:

drivers/md/dm.c: In function `dm_get_table':
drivers/md/dm.c:216: structure has no member named `map_lock'
drivers/md/dm.c:220: structure has no member named `map_lock'
drivers/md/dm.c: At top level:
make[2]: *** [drivers/md/dm.o] Error 1
make[1]: *** [drivers/md] Error 2
make: *** [drivers] Error 2

Patch 3 outright gets rejected

patching file drivers/md/dm.c 
Hunk #1 FAILED at 294.
1 out of 1 hunk FAILED -- saving rejects to file drivers/md/dm.c.rej

Patch 14 outright gets rejected

patching file drivers/md/Kconfig
Hunk #1 FAILED at 199.
1 out of 1 hunk FAILED -- saving rejects to file drivers/md/Kconfig.rej
patching file drivers/md/Makefile
Hunk #1 FAILED at 30.
1 out of 1 hunk FAILED -- saving rejects to file drivers/md/Makefile.rej
patching file drivers/md/dm-zero.c

Advice needed please

==============================================================================
Darren Miller 
Senior Systems Support Engineer
Microsoft Certified Professional
SCO Advanced Certified Engineer 
Infomation Systems Department (Core Server Support)
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15 
0DJ,England
Direct Dial In: +44 (0) 2380 312681
--=_alternative 00482C2580256E54_=
Content-Type: text/html; charset="us-ascii"


<p><font size=2 face="Courier New">&gt;The snapshot target isn't in vanilla 2.6 yet, use my udm (unstable dm)<br>
&gt;tree if you want that functionality.<br>
&gt;<br>
&gt;http://people.sistina.com/~thornber/dm/<br>
&gt;<br>
&gt;I _hope_ to submit this to lkml within the next month.<br>
&gt;<br>
&gt;- Joe</font>
<br>
<br><font size=2 face="sans-serif">Added patches 4, 5, 6, 7, 9, 10 &amp; 11 compiles ok but</font>
<br>
<br><font size=2 face="sans-serif">Patch 7 one hunk fails:</font>
<br>
<br><font size=2 face="sans-serif">Hunk #6 FAILED at 911.</font>
<br><font size=2 face="sans-serif">1 out of 6 hunks FAILED -- saving rejects to file drivers/md/dm.c.rej</font>
<br>
<br><font size=2 face="sans-serif">Patch 9 one hunk fails:</font>
<br>
<br><font size=2 face="sans-serif">Hunk #1 FAILED at 3.</font>
<br><font size=2 face="sans-serif">1 out of 1 hunk FAILED -- saving rejects to file drivers/md/Makefile.rej</font>
<br>
<br><font size=2 face="sans-serif">Patch 10 one hunk fails:</font>
<br>
<br><font size=2 face="sans-serif">Hunk #1 FAILED at 3.</font>
<br><font size=2 face="sans-serif">1 out of 1 hunk FAILED -- saving rejects to file drivers/md/Makefile.rej</font>
<br>
<br><font size=2 face="sans-serif">Patch 11 two hunks fail:</font>
<br>
<br><font size=2 face="sans-serif">Hunk #1 FAILED at 5.</font>
<br><font size=2 face="sans-serif">Hunk #2 FAILED at 27.</font>
<br><font size=2 face="sans-serif">2 out of 2 hunks FAILED -- saving rejects to file drivers/md/Makefile.rej</font>
<br>
<br><font size=2 face="sans-serif">Adding patch 2 killed it completely:</font>
<br>
<br><font size=2 face="sans-serif">drivers/md/dm.c: In function `dm_get_table':</font>
<br><font size=2 face="sans-serif">drivers/md/dm.c:216: structure has no member named `map_lock'</font>
<br><font size=2 face="sans-serif">drivers/md/dm.c:220: structure has no member named `map_lock'</font>
<br><font size=2 face="sans-serif">drivers/md/dm.c: At top level:</font>
<br><font size=2 face="sans-serif">make[2]: *** [drivers/md/dm.o] Error 1</font>
<br><font size=2 face="sans-serif">make[1]: *** [drivers/md] Error 2</font>
<br><font size=2 face="sans-serif">make: *** [drivers] Error 2</font>
<br>
<br><font size=2 face="sans-serif">Patch 3 outright gets rejected</font>
<br>
<br><font size=2 face="sans-serif">patching file drivers/md/dm.c </font>
<br><font size=2 face="sans-serif">Hunk #1 FAILED at 294.</font>
<br><font size=2 face="sans-serif">1 out of 1 hunk FAILED -- saving rejects to file drivers/md/dm.c.rej</font>
<br>
<br><font size=2 face="sans-serif">Patch 14 outright gets rejected</font>
<br>
<br><font size=2 face="sans-serif">patching file drivers/md/Kconfig</font>
<br><font size=2 face="sans-serif">Hunk #1 FAILED at 199.</font>
<br><font size=2 face="sans-serif">1 out of 1 hunk FAILED -- saving rejects to file drivers/md/Kconfig.rej</font>
<br><font size=2 face="sans-serif">patching file drivers/md/Makefile</font>
<br><font size=2 face="sans-serif">Hunk #1 FAILED at 30.</font>
<br><font size=2 face="sans-serif">1 out of 1 hunk FAILED -- saving rejects to file drivers/md/Makefile.rej</font>
<br><font size=2 face="sans-serif">patching file drivers/md/dm-zero.c</font>
<br>
<br><font size=2 face="sans-serif">Advice needed please</font>
<br><font size=2 face="sans-serif"><br>
==============================================================================<br>
Darren Miller &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
Senior Systems Support Engineer<br>
Microsoft Certified Professional<br>
SCO Advanced Certified Engineer &nbsp; &nbsp; &nbsp; &nbsp;<br>
Infomation Systems Department (Core Server Support)<br>
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15 0DJ,England<br>
Direct Dial In: +44 (0) 2380 312681</font>
--=_alternative 00482C2580256E54_=--
