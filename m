Message-Id: <199904251753.AA01936@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] vgscan & vgchange -a y location in startup scripts
Date: Sun, 25 Apr 1999 19:53:26 METDST
In-Reply-To: <37233A05.27BFC35E@geotec.net>; from "Eric Smith" at Apr 25, 99 10:51 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: seric@geotec.net
Cc: linux-lvm@msede.com, mge@ts1.ez-darmstadt.telekom.de

> 
> On my Alpha, with RedHat 5.2 (SysV style init), where exactly should I
> put the vgscan and vgchange -a y?
> 
> ** Should I put it in /etc/init.d/rc.sysinit?  And if so, should it be
> AFTER mounting / and /proc (but before, of course, mounting anything
> else)?

Yes, put it there.
/ has to mounted (see assumption below), /proc doesn't before running vgscan.

> 
> ** Should it be after fsck runs?
> 
> I have the kernel patched and lvm installed (with patch) and I'm ready
> to try it out.  But I need to know just where to put vgscan and vgchange
> -a y!
> 

vgscan accesses /etc/lvmtab.d read/write.
If you want to stay with this directory and its contents in your root
filesystem, do a fsck root and a vgscan afterwards followed by
the "vgchange -ay".

A script fragment follows from my /sbin/init.d/boot on SuSE.
There's a redundand ro mount in it, because SuSEs boot script
remounts / rw afterwards again :)

#############################################################################
#
# Find and activate volume groups (HM 1/1/1999)
#
if [ -x /sbin/vgscan -a -x /sbin/vgchange ]; then
   while read line; do
      set -- $line
      if [ "$2" = "/" ]; then
         root=$1
         type=$3
         break
      fi
   done < /etc/fstab

   fsck -y -t $type $root; ret=$?

   if [ $ret -eq 0 ]; then
      echo "Remounting / read/write for vgscan..."
      mount -n -o remount,rw /
      echo "Scanning for LVM volume groups..."
      /sbin/vgscan
      mount -n -o remount,ro /
      echo "Activating LVM volume groups..."
      /sbin/vgchange -ay
   else
      echo "Error checking / for vgscan..." >&2
   fi
else
   echo "Skipping LVM activation..."
fi
#
# End find and activate volume groups (HM)
#
#############################################################################


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
