From: Stephan Mueller <smueller@suse.de>
Subject: [linux-lvm] Re: Large LVM-Partitions Update
Date: Fri, 8 Oct 1999 11:10:21 +0200
References: <99100810084701.03116@edamer>
MIME-Version: 1.0
Message-Id: <99100811122305.03116@edamer>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@msede.com
Cc: muc-tech@suse.de

Am Fre, 08 Okt 1999 schrieben Sie:
> Hi folks,
> 
> I have the following problem: my VG is 32 GB in size and there is 26 GB left.
> Now I want to create a LV with 26 GB, but LVM tells me that there is only 6,8
> GB left. OK, I created a LV with 6,8 GB. Now I wanted to extend it to 26 GB.
> Again it tells me there is only 12 GB left (Now I have nearly 19 GB). Again I
> wanted to extend but again there  is only 3 GB left and so forth. After several
> extends (with decreasing space) I could finally use all 26 GB.
> 
> Could somebody tell me, what is the problem?
> 
> Technical Data:
> Netfinity 5500 (2 CPUs, 512 MB RAM)
> 36 GB SCSI RAID 5 (/dev/sda)
> 
Some additional info:
SuSE Linux 6.2
Kernel 2.2.12
LVM 0.7
(Sorry I forgot)
> 
> Cheers
> Stephan
--
Stephan M�ller			smueller@suse.de
SuSE M�nchen GmbH		phone 	+49 (0) 89 42769-0
Stahlgruberring 28		fax 	+49 (0) 89 42017701
D-81829 M�nchen			mobile 	+49 (0) 179 6978712
http://www.suse.de		http://www.suse.com
>>> Wer Rechtschreibfehler findet, darf sie behalten. <<<
