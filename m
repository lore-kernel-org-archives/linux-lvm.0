Message-Id: <199911222107.WAA25823@e35.marxmeier.com>
Subject: Re: [linux-lvm] mirroring
Date: Mon, 22 Nov 99 22:07:57 MEZ
In-Reply-To: from "Brian C. Huffman" at Nov 22, 99 3:59 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian.C.Huffman@dupontpharma.com
Cc: linux-lvm@msede.com

Hello Brian,

> 	Looking at this LVM for linux, it all seems very familiar to me 
> as an HPUX administrator.  However, the one thing that I don't see is the
> ability to do RAID1 (mirroring).  Is that available, or will it be in the
> future?

You can use LVM on top of MD which provides RAID 1 and 5.
It was initially planned to have RAID 1 in LVM but so far
this has not been done.

It would be nice to have RAID and LVM more integrated (from the
administrative point of view).


Hope this helps
Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
