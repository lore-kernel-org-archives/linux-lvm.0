From: Peter.Wuestefeld@resnova.de
Subject: Re: [linux-lvm] Re: Configuring boot partition with LVM (fwd)
Message-ID: <OFC1553943.A9DB42C0-ONC1256880.00428580@resnova.de>
Date: Wed, 9 Feb 2000 13:40:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com, jum@anubis.han.de

>> >  Lilo
>> > should also learn how to boot a kernel fom a striped volume...
>>
>> I don't think you fully appreciate the request you're making here.
>> Commercial Unices such as HP-UX and Solaris can not boot from striped
>> volumes for about the same reasons why it would be difficult to have
>> LILO read from a striped volume: the implications are just too
>> horrendous to comtemplate.

>At least the IBM people with the AIX LVM are able to make that work.
>The
>only thing that they were not able for a long time is to make system
>dumps work in such a configuration. But I believe that even that works
>under AIX 4.3.x now.

-- 
Jens-Uwe Mager           <pgp-mailto:62CFDB25>

True. And the latter works really well on standalone systems and in an SP.

BTW:

http://oss.software.ibm.com/developerworks/opensource/jfs/index.html

IBM JOINS EFFORTS TO DEVELOP ENTERPRISE FILE SYSTEM FOR LINUX

At LinuxWorld today, IBM announced the contribution of technology
and talent to help make Linux a high-performance operating system
in e-business environments.

Part of a line up of new IBM initiatives, the open-source contribution
is designed to accelerate development of a journaling file system for
Linux capable of protecting the integrity of corporate data during power
outages and other system failures.
This capability is particularly important in e-business environments,
where Web sites can receive millions of hits a day and Web application
servers are caching massive amounts of data.

IBM will assign a dedicated team of software engineers to work with the
open source community in developing an enterprise-level journaling file
system for Linux.  Journaling enhances a file system's ability to track
transactions and log operations, and can retrieve file data quickly and
intact if a system fails or gets shut down prematurely.

IBM's journaled file system technology, currently used in IBM enterprise
servers,is designed for high-throughput server environments, key to 
running
intranet and other high-performance e-business file servers.
The source code is now available for download from the Open Source and
Linux zones in the IBM developerWorks* website (http://www.ibm.com/developerworks).


Mit freundlichem Gruss/Best Regards

Peter Wuestefeld
IBM Certified System Administrator AIX 4.3
IBM Certified Support Professional AIX 4.3
==================================
res nova Unternehmensberatung GmbH
                   ...aktiv in AIX
MAIL:  Ruppmannstrasse 41
       D-70565 Stuttgart, Germany
FON:   +49 711 78888 0
FAX:   +49 711 78888 99
WWW:   http://www.resnova.de
SMTP: mailto: Peter.Wuestefeld@resnova.de

There are three kinds of people: Those who can count & those who can't.
