From: Torsten Neumann <torsten@londo.rhein-main.de>
Subject: Re: [linux-lvm] LVM - Grundlagen
Date: 15 Mar 2000 21:00:47 +0100
Message-ID: <8aoq5f$8t0$1@londo.rhein-main.de>
References: <200003151643.RAA27423@u9etz.ez-darmstadt.telekom.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de> wrote:

>> 
>> Is there any draw-backs in this combination or anything to know about?
>> 

> Not so far ;-{)

It seems to me that LVM breaks the install routines of JBuilder.
This routines alway reports that lvm-filesystems are completly full :(

Quick fix:

# mv /bin/df /bin/df.orig
# cat >/bin/df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/sda1             12385456  10177268   2082360  83% /
^D
# chmod 755 df

and after installation, move the original df back.

	Torsten
