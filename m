Message-Id: <199906210714.AA17352@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] pvcreate -- extended partition "/dev/hda10" doesn't exist
Date: Mon, 21 Jun 1999 9:13:27 METDST
In-Reply-To: <376DA1DD.9D2251AC@mainz.ibm.de>; from "Udo Weber" at Jun 21, 99 4:22 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: udo.weber@mainz.ibm.de
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi.

> 
> I'm new here the Linux-LVM-array. This means I was downloading all
> needed software+patches, compiled successfull and also installed without
> erors on my IBM-Thinkpad (300 MHz PII, 128 MB RAM, 8GByte HD).
> I have all my LINUX-stuff on several extended partitions.
> 

Great.

> Now at first some generally questions (I don't  found an answer for this
> in the docu):
> Is it possible to create a PV on a extended partion or do I need only
> primary partions ?

You can use primary _and_ extended partitions.

> I think pvcreate writes something at the top of the physical volume (
> whole PV or partion).
> Do that works well with other OS-formated parts of the same hdisk ?
> 

Yes, it does.

If you use a partition with pvcreate, you have to set the partition identifier
to 0xfe with fdisk before.
pvcreate checks for this partition identifier to avoid to overwrite _non_
LVM partitions by accident 8*)

<SNIP>

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
