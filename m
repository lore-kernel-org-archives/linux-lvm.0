Subject: Re: [linux-lvm] how to remove PV from a VG? 
In-reply-to: Your message of Wed, 20 Oct 1999 13:48:40 +0700.
             <199910201149.AA09133@mailgate1b.telekom.de> 
Date: Wed, 20 Oct 1999 14:06:41 +0100
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E11dvS2-000687-00@chatteris.cl.cam.ac.uk>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: linux-lvm@msede.com

>> How do I really, physically remove the devices from the PV list?
> Set the partition type identifier to something different than 0xfe.

What if the disks were to not have a `partition type', e.g. /dev/sdb or
/dev/md33 ?
