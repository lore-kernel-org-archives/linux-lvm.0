From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002191235.NAA27590@u9etz.164.27.16.48>
Subject: Re: [linux-lvm] Can we make char files not blocked for the volumes
In-Reply-To: <38AE3AF5.C2184CDE@alwan.com> from Chris Anderson at "Feb 19, 2000  0:40:54 am"
Date: Sat, 19 Feb 2000 13:35:17 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Anderson <chris@alwan.com>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


Please have a look at the rawio support for Linux.
This enables you to create raw devices for every block device in the system
including the LVM ones.

Heinz

> Can lvm create char devices not blocked for the volumes?
> 
> Did a listing in the volume group dir.  Note the char device file
> (group).  How can we make the other files / volumes the same.  Informix
> wants char devices not blocked.  I seem to note that linux does not
> really treat them different but...
> 
> $ ls -l
> 
> crw-r-----   1 root     root     109,   0 Jan 29 18:46 group
> brw-rw----   1 informix informix  58,   1 Jan 29 19:10 infx_data1
> brw-rw----   1 informix informix  58,   0 Jan 29 19:09 infx_root
> 
> Thanks,
> 
>    Chris Anderson
>     chris@alwan.com
> 
Content-Description: S/MIME Cryptographic Signature

[Attachment, skipping...]


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
