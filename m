Message-Id: <199905081757.AA08848@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] cannot activate vg
Date: Sat, 08 May 1999 19:54:45 METDST
In-Reply-To: <3732BE43.2FD58407@post10.tele.dk>; from "Peter MN" at May 07, 99 12:19 (noon)
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter MN <pmn@post10.tele.dk>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> Can anyone help me
> 

I hope so 8*)

> I have just createt a new lv an resized the old one, now  when i run
> vgchange i get this error code
> 
> > vgchange -ay
> >vgchange -- ERROR -6 activating volume group "vg01"

Did you install lvm_0.6-patch-15031999a.gz?
If not it would explain the trouble you are seeing.

If yes and the problem persists _after_ a vgscan, send me the
stdout/stderr output of "vgscan -d" and "vgchange -d -ay".
Add a "ls -l /dev/vg01" please.

Thank you.

Regards,
Heinz


--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
